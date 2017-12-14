/**
 * Title: 终端认证-基于Redis（包括登录用户名密码认证、每次服务调用时Token的认证）
 * fileName: AuthenticateByRedis.java
 * @author zhangWenchao
 * @Created on 2016年10月31日 下午4:06:50
 * @version 1.0
 */

package com.fh.service.app.authenticate.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.fh.controller.base.BaseController;
import com.fh.dao.DaoSupport;
import com.fh.dao.redis.RedisDao;
import com.fh.entity.system.User;
import com.fh.service.app.authenticate.IAuthenticate4Mobile;
import com.fh.service.hlsd.BD.bduser.BDUserManager;
import com.fh.service.hlsd.scale.ScaleScoreManager;
import com.fh.service.hlsd.tcommonscore.TCommonScoreManager;
import com.fh.service.hlsd.userInfo.AppUserManager;
import com.fh.util.Const;
import com.fh.util.Constants;
import com.fh.util.DateUtil;
import com.fh.util.MD5;
import com.fh.util.MessageUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.hlsd.ContentManagerUtils;
import com.fh.util.security.AESUtil;
import com.fh.util.token.TokenState;
import com.fh.util.token.redis.RedisToken;

import net.sf.json.JSONObject;
@SuppressWarnings("all")
@Service("authenticate")
public class AuthenticateByRedis implements IAuthenticate4Mobile{
	
	private final Logger log = Logger.getLogger(AuthenticateByRedis.class);

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name = "appUserService")
	private AppUserManager appUserService;
	
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;

	@Resource(name = "scaleScoreService")
	private ScaleScoreManager scaleScoreService;
	
	@Resource(name = "tcommonscoreService")
	private TCommonScoreManager tcommonscoreService;
	
	@Resource(name = "bduserService")
	private BDUserManager bduserService;
	/**
	 * 认证的主方法 ： 用户id、密码认证
	 * 
	 * @param Map data
	 * @param String serviceName (验证类型：login、token)
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> authenticate(PageData pageData,String serviceName) throws Exception {
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		Object userId    = pageData.get("userId"); //登录和发送验证码的时候发送的是用户手机号
		Object userPwd   = pageData.get("userPwd");
		Object token     = pageData.get("Token");
		Object serviceNo = pageData.get("serviceNo");//终端设备号
		Object userType  = pageData.get("userType");//用户类型
		Object userMobileNo = pageData.get("userMobileNo");//手机号
		Object BDCODE = pageData.get("BDCODE");//手机号
		Object inviteCode = pageData.get("inviteCode");//邀请码
		Object provinceId = pageData.get("provinceId");//邀请码
		Object cityId = pageData.get("cityId");//邀请码
		Object areaId = pageData.get("areaId");//邀请码
		Object userName = pageData.get("userName");//邀请码
		if ("login".equals(serviceName)) {
			result = authenByUserNameAndYzm(userId, userPwd,serviceNo,inviteCode,userType);
		}else if("sendCode".equals(serviceName)){ //发送验证码
			try {
				long yzmExTime = Long.parseLong(Tools.getProperty("yzm_ext_time", "600000")); //验证码的有效期
				int sixCode = 999999;
				String userMobileNoList = Tools.getProperty("userMobileNoList", "13616733545");
				
				String isDev = Tools.getProperty("devMode", "true");
				if("false".equals(isDev) && !userMobileNoList.contains(userId.toString())){ //开发测试环境就不调用
					sixCode = (int)((Math.random()*9+1)*100000);
					MessageUtil.sendMessgeByYunzhixun(userId.toString(), "132446", String.valueOf(sixCode));
					log.info(userId.toString()+ "您正在使用互联速递手机认证  本次验证码为: "+sixCode+" ,验证码10分钟内有效");
				}
					
				RedisToken.saveYzmForHlsdv1(userId.toString()+"_yzm", String.valueOf(sixCode),yzmExTime,redisDaoImpl);
				
				result.put("result", Constants.SUCCESS);
				result.put(Constants.RESP_MSG, "验证码发送成功！");
			} catch (Exception e) {
				result.put("result", Constants.FAIL);
				result.put(Constants.RESP_MSG, "验证码发送失败！");
				log.error("Redis存储验证码失败 "+e.getLocalizedMessage());
			}
		}else if("resetToken".equals(serviceName)){
			if(userId!=null && serviceNo!=null && token!=null){
				try {
					TokenState state = RedisToken.valideToken(userId.toString(), serviceNo.toString(), token.toString(),redisDaoImpl);
					if(state.equals(TokenState.EXPIRED) || state.equals(TokenState.VALID)){  // 成功后返回token
						result.put("result", Constants.SUCCESS);
						result.put(Constants.RESP_MSG, "获取成功！");
						result.put("Token", createToken(userId,serviceNo));
					}else if(state.equals(TokenState.EXPIRED_LOGIN)){//需要重新登录
						result.put("result", Constants.FAIL);
						result.put(Constants.RESP_MSG, "非法请求,请通过登录才能获取认证令牌！");
						result.put("Token", "");
					}else{
						result.put("result", Constants.FAIL);
						result.put(Constants.RESP_MSG, "非法请求，获取失败！");
						result.put("Token", "");
					}
				} catch (Exception e) {
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "获取失败！");
					result.put("Token", "");
					e.printStackTrace();
				}
			}else{
				result.put("result", Constants.FAIL);
				result.put(Constants.RESP_MSG, "获取失败，请保证用户id、设备号、失效令牌都不能为空！");
				result.put("Token", "");
			}
		}else if("htmlSendCode".equals(serviceName)){
			try {
				if(userType  != null && userMobileNo != null){
					
					PageData USER = appUserService.getUserByMobileNoAndUerType(userMobileNo.toString(), userType.toString());
					
					if(USER != null){
						
						String beInvitedCode = USER.getString("beInvitedCode");
						
						if(Tools.notEmpty(beInvitedCode)){
							
							result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
							result.put(ContentManagerUtils.RESPONSE_MESSAGE, "该用户已经被邀请过了");
						}else{
							
							result = sendCode(result, userMobileNo, userType);
						}
					}else{
						result = sendCode(result, userMobileNo, userType);
					}
				}else{
					result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
					result.put(ContentManagerUtils.RESPONSE_MESSAGE, "手机号码和用户类型不能为空");
				}
			} catch (Exception e) {
				result.put("result", Constants.FAIL);
				result.put(Constants.RESP_MSG, "验证码发送失败！");
				log.error("Redis存储验证码失败 "+e.getLocalizedMessage());
			}
		}else if("BDRegest".equals(serviceName)){//BD注册
			result = authenByBDRegest(userMobileNo, userPwd,serviceNo,inviteCode, provinceId, cityId, areaId,userName);
		}else if("BDLogin".equals(serviceName)){//BD登录
			result = authenByBDUserNameAndYzm(userMobileNo, userPwd,serviceNo,inviteCode);
		}else if("inviteRegest".equals(serviceName)){//BD邀请注册
			result = authenByInviteRegest(userMobileNo,BDCODE,userPwd,userType);
		} else {
			if(userId!=null && serviceNo!=null && token!=null){
				result = authenByToken(token.toString(), userId, serviceNo);
			}else{
				result.put("result", Constants.FAIL);
				result.put("responseCode", Constants.PARAM_ERROR);
				result.put(Constants.RESP_MSG, "请求失败，请保证用户id、设备号、失效令牌都不能为空！");
				result.put("Token", "");
			}
		}
		return result;
	}
	
	/**
	 * @Title: authenByBDRegest
	 * @Description: BD注册
	 * @param @param userMobileNo  电话号码
	 * @param @param userPwd       验证码
	 * @param @param serviceNo     设备号
	 * @param @param inviteCode    邀请码
	 * @param @param provinceId    省
	 * @param @param cityId        市
	 * @param @param areaId        区
	 * @param @param userName      用户名
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	private Map<String, Object> authenByBDRegest(Object userMobileNo, Object userPwd, Object serviceNo,
			Object inviteCode, Object provinceId, Object cityId, Object areaId, Object userName) {
 		Map<String, Object> result = new LinkedHashMap<String, Object>();
		try{
			//判断电话号码是否注册
			boolean flag = detecedUserMobileNoForRegister(userMobileNo);
			if(flag) {
				//注册用户
				//检测验证码是否正确
				boolean detecedVerificationCodeResult = detecedVerificationCodeForCorrect(userMobileNo,userPwd);
				if(detecedVerificationCodeResult){
					//验证邀请码
					boolean detecedInviteCodeResult = detecedInviteCodeForCorrect(inviteCode);
					if(detecedInviteCodeResult){
						//添加用户到数据库
						regestBDUser(userMobileNo, inviteCode, provinceId, cityId, areaId, userName);
						//返回信息直接登录
						PageData pd = bduserService.getUserByMobileNo(userMobileNo.toString());
						result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_SUCCESS);
						result.put(ContentManagerUtils.RESPONSE_MESSAGE, "登录成功！");
						//result.put("Token", createToken(userId,serviceNo)); // 成功后返回token
						pd.put("Token", createBDUserToken(pd.getString("BDUSERID"),serviceNo));
						result.put(ContentManagerUtils.RESPONSE_CONTENT, JSONObject.fromObject(pd));
					} else {
						//邀请码不正确
						result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
						result.put(ContentManagerUtils.RESPONSE_MESSAGE, "邀请码错误！");
						result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
					}
				} else {
					//验证码不正确
					result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
					result.put(ContentManagerUtils.RESPONSE_MESSAGE, "验证码错误！");
					result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
				}
			}else{
				//用户已注册
				result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
				result.put(ContentManagerUtils.RESPONSE_MESSAGE, "您已经注册过,请直接登录!");
				result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
			}
		}catch (Exception e) {
			//代码出现bug
			result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
			result.put(ContentManagerUtils.RESPONSE_MESSAGE, "操作错误！");
			result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
		}
		return result;
	}

	/**
	 * @throws Exception 
	 * @Title: detecedInviteCodeForCorrect
	 * @Description: 验证邀请码是否正确
	 * @param @param inviteCode  邀请码
	 * @param @return    
	 * @return boolean    
	 * @throws
	 */
	private boolean detecedInviteCodeForCorrect(Object inviteCode) throws Exception {
		//判断邀请码是否为空
		if(inviteCode != null && StringUtils.isNotBlank(inviteCode.toString())){
			//根据邀请码获取BD用户数量
			int count = bduserService.findUserBDCode(inviteCode.toString());
			//判断邀请码是否存在
			if(count == 0){
				return false;
			}
		}
		return true;
	}

	/**
	 * @Title: regestBDUser
	 * @Description: 注册BD用户
	 * @param @param userMobileNo   电话号码
	 * @param @param provinceId     省
	 * @param @param cityId         市
	 * @param @param areaId         区
	 * @param @param userName       用户名
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	private void regestBDUser(Object userMobileNo,Object inviteCode , Object provinceId , Object cityId , Object areaId , Object userName) throws Exception {
		
		PageData pd = new PageData();
		
		pd.put("BDUSERID", BaseController.get32UUID()); // 主键
		pd.put("BDMOBILENO", userMobileNo);//电话号码
		pd.put("BDUSERNAME", userName);//用户名
		pd.put("PROVINCEID", provinceId);//省
		pd.put("BEINVITEDCODE", inviteCode);//邀请码
		pd.put("CITYID", cityId);//市
		pd.put("AREAID", areaId);//区
		pd.put("MONEY", "0"); // 余额
		pd.put("AVAILABLEBALANCE", "0"); // 可用余额
		pd.put("BDCODE", BaseController.getCodeByRandam(5)); // BD码
		pd.put("CREATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())); // 创建时间
		
		bduserService.save(pd);
	}

	/**
	 * @Title: detecedVerificationCodeForCorrect
	 * @Description: 检验用户验证码是否正确
	 * @param @param userMobileNo     电话号码
	 * @param @param verificationCode 验证码
	 * @param @return
	 * @param @throws Exception    
	 * @return boolean    
	 * @throws
	 */
	private boolean detecedVerificationCodeForCorrect(Object userMobileNo, Object verificationCode) throws Exception {
		String isDev = Tools.getProperty("devMode", "true");
		String userMobileNoList = Tools.getProperty("userMobileNoList", "");
		if("true".equals(isDev) || userMobileNoList.contains(userMobileNo.toString())){ //开发测试环境就默认存储6个9
			long yzmExTime = Long.parseLong(Tools.getProperty("yzm_ext_time", "600000"));
			verificationCode = 999999;
			RedisToken.saveYzmForHlsdv1(userMobileNo.toString()+"_yzm", verificationCode.toString(),yzmExTime,redisDaoImpl);
		}
		//验证验证码是否正确
		boolean isSuc = RedisToken.validYzmForHlsdv1(userMobileNo.toString()+"_yzm", verificationCode.toString(),redisDaoImpl);
		return isSuc;
	}

	/**
	 * @throws Exception 
	 * @Title: detecedUserMobileNoForRegister
	 * @Description: 检测电话号码是否备注册
	 * @param @param userMobileNo  电话号码
	 * @param @return    
	 * @return double    
	 * @throws
	 */
	private boolean detecedUserMobileNoForRegister(Object userMobileNo) throws Exception {
		//根据电话号码查询用户信息
		PageData BDUSER = bduserService.getUserByMobileNo(userMobileNo.toString());
		//判断用户是否存在
		if(BDUSER == null)
			//用户不存在
			return true;
		//用户存在
		return false;
	}

	/**
	 * @Title: sendCode
	 * @Description: 发送验证码
	 * @param @param result
	 * @param @param userMobileNo
	 * @param @param userType
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	private Map<String, Object> sendCode(Map<String, Object> result,Object userMobileNo ,Object userType){
		
		try{
			
			long yzmExTime = Long.parseLong(Tools.getProperty("yzm_ext_time", "600000")); //验证码的有效期
			int sixCode = 999999;
			String userMobileNoList = Tools.getProperty("userMobileNoList", "13616733545");
			
			String isDev = Tools.getProperty("devMode", "true");
			if("false".equals(isDev) && !userMobileNoList.contains(userMobileNo.toString())){ //开发测试环境就不调用
				sixCode = (int)((Math.random()*9+1)*100000);
				MessageUtil.sendMessgeByYunzhixun(userMobileNo.toString(), "132446", String.valueOf(sixCode));
				log.info(userMobileNo.toString()+ "您正在使用互联速递手机认证  本次验证码为: "+sixCode+" ,验证码10分钟内有效");
			}
			
			RedisToken.saveYzmForHlsdv1(userMobileNo.toString()+userType.toString(), String.valueOf(sixCode),yzmExTime,redisDaoImpl);
			
			result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_SUCCESS);
			result.put(ContentManagerUtils.RESPONSE_MESSAGE, "验证码发送成功！");
			
		}catch (Exception e) {
			result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
			result.put(ContentManagerUtils.RESPONSE_MESSAGE, "验证码发送失败！");
		}
		
		return result;
		
	}

	/**
	 * @Title: authenByInviteRegest
	 * @Description: 邀请用户注册
	 * @param @param userMobileNo
	 * @param @param bDCODE
	 * @param @param userPwd
	 * @param @param userType
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	private Map<String, Object> authenByInviteRegest(Object userMobileNo, Object bDCODE, Object yzm,
			Object userType) {
		
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		
		try {
			if (userMobileNo != null && yzm != null && bDCODE != null && Tools.notEmpty(bDCODE.toString())) {
				
				int userNumber = bduserService.findUserBDCode(bDCODE.toString());
				
				if(userNumber <= 0){
					result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
					result.put(ContentManagerUtils.RESPONSE_MESSAGE, "注册失败！");
				}else{
					String isDev = Tools.getProperty("devMode", "true");
					String userMobileNoList = Tools.getProperty("userMobileNoList", "");
					if("true".equals(isDev) || userMobileNoList.contains(userMobileNo.toString())){ //开发测试环境就默认存储6个9
						long yzmExTime = Long.parseLong(Tools.getProperty("yzm_ext_time", "600000"));
						yzm = 999999;
						RedisToken.saveYzmForHlsdv1(userMobileNo.toString()+userType, yzm.toString(),yzmExTime,redisDaoImpl);
					}
					//验证验证码是否正确
					boolean isSuc = RedisToken.validYzmForHlsdv1(userMobileNo.toString()+userType, yzm.toString(),redisDaoImpl);
					if (isSuc) {
						PageData USER =appUserService.getUserByMobileNo(userMobileNo.toString(), userType.toString());
						
						if(USER != null){
							
							USER.put("beInvitedCode", bDCODE);
							USER.put("beInviteTime", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
							
							Integer updateFlag = appUserService.updateByPrimaryKey(USER);
							
							if(updateFlag == 1){
								result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_SUCCESS);
								result.put(ContentManagerUtils.RESPONSE_MESSAGE, "邀请成功!");
							}else{
								result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
								result.put(ContentManagerUtils.RESPONSE_MESSAGE, "邀请失败");
							}
						}else{
							PageData pageData = new PageData();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
							String format = sdf.format(new Date());
							int last_ = (int)((Math.random()*9+1)*1000);
							pageData.put("userMobileNo",userMobileNo);
							pageData.put("userType",userType);
							if("5".equals(userType)){
								pageData.put("userId","S"+format+""+last_);
								pageData.put("status","1");
								pageData.put("role","美团骑手");
								pageData.put("displayPrice","1");
								pageData.put("commentScore","100");
								pageData.put("commonId", tcommonscoreService.getCommonIdByCommonScore(100D));//
								pageData.put("scaleScore", "0");
								pageData.put("scaleId", scaleScoreService.getScaleIdByScaleScore(0));
								pageData.put("selectCarId","20170515000002");
							}else if("1".equals(userType)){
								pageData.put("userId","Y"+format+""+last_);
							}
							pageData.put("money","0");
							pageData.put("orderNumberStatus","0");
							pageData.put("easemobFlag","0");
							pageData.put("isUse","0");
							pageData.put("beInvitedCode", bDCODE);
							pageData.put("createTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
							pageData.put("beInviteTime", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
							
							appUserService.insertSelective(pageData);
							
							result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_SUCCESS);
							result.put(ContentManagerUtils.RESPONSE_MESSAGE, "注册成功！");
						}
						
					} else {
						result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
						result.put(ContentManagerUtils.RESPONSE_MESSAGE, "验证码错误！");
					}
				}
			} else {
				result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
				result.put(ContentManagerUtils.RESPONSE_MESSAGE, "注册失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
			result.put(ContentManagerUtils.RESPONSE_MESSAGE, "注册失败！");
		}
		return result;
	}

	/**
	 * 通过用户名密码认证
	 * @param userName  登录账号
	 * @param userPwd   密码MD5加密后的密码
	 * @param serviceNo 设备号
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> authenByUserNameAndPwd(Object userName,Object userPwd,Object serviceNo) throws Exception {
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		try {
			if (userName != null && userPwd != null) {
				PageData pd = new PageData();
				pd.put("USERNAME", userName);
				pd.put("PASSWORD", userPwd);
				PageData pageData =(PageData)dao.findForObject("AppuserMapper.findByUsernamePwd", pd);
				if (pageData != null) {
					result.put("result", Constants.SUCCESS);
					result.put(Constants.RESP_MSG, "登录成功！");
					result.put("Token", createToken(userName,serviceNo)); // 成功后返回token
				} else {
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "用户名或密码错误！");
					result.put("Token", "");
				}
			} else {
				result.put("result", Constants.FAIL);
				result.put(Constants.RESP_MSG, "用户名和密码都不能为空！");
				result.put("Token", "");
			}
		} catch (Exception e) {
			result.put("result", Constants.FAIL);
			result.put(Constants.RESP_MSG, "生成认证码失败！");
			result.put("Token", ""); // 成功后返回token
			log.error("终端请求登录用户名密码认证接口报错！", e);
			throw new Exception("终端请求登录用户名密码认证接口报错！");
		}
		return result;
	}
	
	/**
	 * 通过用户名和验证码登录
	 * @param userName  用户编号
	 * @param yzm       验证码
	 * @param serviceNo 设备号
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> authenByUserNameAndYzm(Object userName,Object yzm,Object serviceNo,Object inviteCode,Object userType) throws Exception {
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		try {
			if(inviteCode !=null && Tools.notEmpty(inviteCode.toString())){
				if(inviteCode.toString().length() == 6){
					
					int isExist = bduserService.findUserBDCode(inviteCode.toString());
					
					if(isExist==1){
						
						result = checkLogin(result, userName, yzm, serviceNo,userType,inviteCode);
					}else{
						result.put("result", Constants.FAIL);
						result.put(Constants.RESP_MSG, "邀请码不存在！");
						result.put("Token", "");
					}
					
				}else{
					int isExist = appUserService.findUserinviteCode(inviteCode.toString());
					if(isExist==1){
						/*PageData pd = new PageData();
						pd.put("userId", userName);
						pd.put("beInvitedCode", inviteCode);
						appUserService.updateUserBeInvitedCode(pd);*/
						
						result = checkLogin(result, userName, yzm, serviceNo,userType,inviteCode);
					}else{
						result.put("result", Constants.FAIL);
						result.put(Constants.RESP_MSG, "邀请码不存在！");
						result.put("Token", "");
					}
				}
			}else{
				result = checkLogin(result, userName, yzm, serviceNo,userType,inviteCode);
			}
		} catch (Exception e) {
			log.error("终端请求登录认证接口报错！", e);
			throw new Exception("终端请求登录认证接口报错！");
		}
		return result;
	}
	/**
	 * BD专员通过用户名和验证码登录
	 * @param userName  用户手机号
	 * @param yzm       验证码
	 * @param serviceNo 设备号
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> authenByBDUserNameAndYzm(Object userName,Object yzm,Object serviceNo,Object inviteCode) throws Exception {
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		try {
			if(inviteCode!=null && Tools.notEmpty(inviteCode.toString())){
				int isExist = bduserService.findUserBDCode(inviteCode.toString());
				if(isExist==1){
					/*PageData pd = new PageData();
					pd.put("userId", userName);
					pd.put("beInvitedCode", inviteCode);
					appUserService.updateUserBeInvitedCode(pd);*/
					
					result = checkBDUserLogin(result, userName, yzm, serviceNo,inviteCode);
				}else{
					result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
					result.put(ContentManagerUtils.RESPONSE_MESSAGE, "邀请码不存在！");
					result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
				}
			}else{
				result = checkBDUserLogin(result, userName, yzm, serviceNo,inviteCode);
			}
		} catch (Exception e) {
			log.error("终端请求登录认证接口报错！", e);
			throw new Exception("终端请求登录认证接口报错！");
		}
		return result;
	}
	
	/**
	 * 单独把登录的提炼出一个方法
	 * @param result
	 * @param userName  用户手机_yzm
	 * @param yzm
	 * @param serviceNo
	 * @return
	 * @throws Exception
	 */
	private Map<String, Object> checkLogin(Map<String, Object> result,Object userName,Object yzm,Object serviceNo,Object userType,Object inviteCode) throws Exception{
		if (userName != null && yzm != null) {
			PageData pd = appUserService.getUserByMobileNo(userName.toString(),userType);
			if(pd!=null){
				if(inviteCode != null && !Tools.isEmpty(inviteCode.toString())){
					
					if(Tools.isEmpty(pd.getString("beInvitedCode")) && inviteCode.toString().length() == 6){
						PageData param = new PageData();
						param.put("userId", pd.get("userId"));
						param.put("beInvitedCode", inviteCode);
						param.put("beInviteTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis())));
						appUserService.updateUserBeInvitedCode(param);
						
						checkUser(result, userName, yzm, serviceNo, pd);
					}else{
						result.put("result", Constants.FAIL);
						result.put(Constants.RESP_MSG, "该账号不能被邀请");
						result.put("Token", "");
					}
				}else{
					checkUser(result, userName, yzm, serviceNo, pd);
				}
			}else{
				//验证验证码是否正确
				boolean isSuc = RedisToken.validYzmForHlsdv1(userName.toString()+"_yzm", yzm.toString(),redisDaoImpl);
				if (isSuc) {
					//如果骑手类型为5 就默认注册成为自由骑手
					if(userType != null && !Tools.isEmpty(userType.toString()) && "5".equals(userType)){ 
						PageData pageData = new PageData();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
						String format = sdf.format(new Date());
						int last_ = (int)((Math.random()*9+1)*1000);
						pageData.put("userId","S"+format+""+last_);
						pageData.put("userMobileNo",userName);
						pageData.put("userType",userType);
						pageData.put("status","1");
						pageData.put("role","美团骑手");
						pageData.put("displayPrice","1");
						pageData.put("money","0");
						pageData.put("commentScore","100");
						pageData.put("commonId", tcommonscoreService.getCommonIdByCommonScore(100D));//
						pageData.put("scaleScore", "0");
						pageData.put("scaleId", scaleScoreService.getScaleIdByScaleScore(0));
						pageData.put("orderNumberStatus","0");
						pageData.put("easemobFlag","0");
						pageData.put("isUse","0");
						pageData.put("beInvitedCode", inviteCode);
						pageData.put("selectCarId","20170515000002");
						pageData.put("beInviteTime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis())));
						appUserService.saveUser(pageData);
						
						result.put("result", Constants.SUCCESS);
						result.put(Constants.RESP_MSG, "登录成功！");
						result.put("Token", createToken(pageData.getString("userId"),serviceNo)); // 成功后返回token
						result.put("userInfo", JSONObject.fromObject(pageData));
					}
				} else {
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "验证码错误！");
					result.put("Token", "");
				}
			}
		} else {
			result.put("result", Constants.FAIL);
			result.put(Constants.RESP_MSG, "登录账号或验证码不能为空！");
			result.put("Token", "");
		}
		
		return result;
	}

	private void checkUser(Map<String, Object> result, Object userName, Object yzm, Object serviceNo, PageData pd)
			throws Exception {
		String userId = pd.getString("userId");
		String isDev = Tools.getProperty("devMode", "true");
		String userMobileNoList = Tools.getProperty("userMobileNoList", "");
		if("true".equals(isDev) || userMobileNoList.contains(userName.toString())){ //开发测试环境就默认存储6个9
			long yzmExTime = Long.parseLong(Tools.getProperty("yzm_ext_time", "600000"));
			yzm = 999999;
			RedisToken.saveYzmForHlsdv1(userName.toString()+"_yzm", yzm.toString(),yzmExTime,redisDaoImpl);
		}
		//验证验证码是否正确
		boolean isSuc = RedisToken.validYzmForHlsdv1(userName.toString()+"_yzm", yzm.toString(),redisDaoImpl);
		if (isSuc) {
			result.put("result", Constants.SUCCESS);
			result.put(Constants.RESP_MSG, "登录成功！");
			result.put("Token", createToken(userId,serviceNo)); // 成功后返回token
			result.put("userInfo", JSONObject.fromObject(pd));
		} else {
			result.put("result", Constants.FAIL);
			result.put(Constants.RESP_MSG, "验证码错误！");
			result.put("Token", "");
		}
	}
	/**
	 * 单独把登录的提炼出一个方法
	 * @param result
	 * @param userName  用户手机_yzm
	 * @param yzm
	 * @param serviceNo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("all")
	private Map<String, Object> checkBDUserLogin(Map<String, Object> result,Object userName,Object yzm,Object serviceNo,Object inviteCode) throws Exception{
		if (userName != null && yzm != null) {
			PageData pd = bduserService.getUserByMobileNo(userName.toString());
			if(pd!=null){
				if(inviteCode != null && !Tools.isEmpty(inviteCode.toString())){
					result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
					result.put(ContentManagerUtils.RESPONSE_MESSAGE, "该账号已注册,不能被邀请");
					result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
				}else{
					String BDUSERID = pd.getString("BDUSERID");
					String isDev = Tools.getProperty("devMode", "true");
					String userMobileNoList = Tools.getProperty("userMobileNoList", "");
					if("true".equals(isDev) || userMobileNoList.contains(userName.toString())){ //开发测试环境就默认存储6个9
						long yzmExTime = Long.parseLong(Tools.getProperty("yzm_ext_time", "600000"));
						yzm = 999999;
						RedisToken.saveYzmForHlsdv1(userName.toString()+"_yzm", yzm.toString(),yzmExTime,redisDaoImpl);
					}
					//验证验证码是否正确
					boolean isSuc = RedisToken.validYzmForHlsdv1(userName.toString()+"_yzm", yzm.toString(),redisDaoImpl);
					if (isSuc) {
						result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_SUCCESS);
						result.put(ContentManagerUtils.RESPONSE_MESSAGE, "登录成功！");
						//result.put("Token", createToken(userId,serviceNo)); // 成功后返回token
						pd.put("Token", createBDUserToken(BDUSERID,serviceNo));
						result.put(ContentManagerUtils.RESPONSE_CONTENT, JSONObject.fromObject(pd));
					} else {
						result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
						result.put(ContentManagerUtils.RESPONSE_MESSAGE, "验证码错误！");
						result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
					}
				}
			}else{
				result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE); 
				result.put(ContentManagerUtils.RESPONSE_MESSAGE, "用户不存在"); 
				result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
			}
		} else {
			result.put(ContentManagerUtils.RESPONSE_CODE, ContentManagerUtils.RESPONSE_CODE_FILE);
			result.put(ContentManagerUtils.RESPONSE_MESSAGE, "登录账号或验证码不能为空！");
			result.put(ContentManagerUtils.RESPONSE_CONTENT, null);
		}
		
		return result;
	}

	/**
	 * 通过token认证
	 * 
	 * @param result
	 * @param token
	 */
	private Map<String, Object> authenByToken(String token,Object userId,Object serviceNo) {
		Map<String, Object> result =  new LinkedHashMap<String, Object>();
		try {
			if (token != null && !"".equals(token)) {
				TokenState state = RedisToken.valideToken(userId+"_login", serviceNo.toString(), token,redisDaoImpl);
				switch (state) {
				case VALID:
					result.put("result", Constants.SUCCESS);
					result.put(Constants.RESP_MSG, "请求成功！");
					/*result.put("responseCode", Constants.EFFECTIVE);
					result.put("Token", token); // 成功后返回token*/			
					break;
				case EXPIRED_LOGIN:
					float confHour = Float.parseFloat(Tools.getProperty("client_relogin_time", "1"));
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "登录令牌有效期超过 "+confHour+" 天，请重新登录才能获取登录令牌！");
					result.put("responseCode", Constants.EXPIRED);
					result.put("Token", "");
					break;
				case EXPIRED:
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "登录令牌过期或无效，请重新登录获取认证令牌！");
					result.put("Token", "");
					result.put("responseCode", Constants.EXPIRED);
					break;
				case INVALID:
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "请求失败,登录令牌不合法！");
					result.put("Token", "");
					result.put("responseCode", Constants.EXPIRED);
					break;
				case DIFFER:
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "非法请求,用户账号、设备号及登录令牌不一致！");
					result.put("Token", "");
					result.put("responseCode", Constants.EXPIRED);
					break;
				}
			} else {
				result.put("result", Constants.FAIL);
				result.put("responseCode", Constants.PARAM_ERROR);
				result.put(Constants.RESP_MSG, "登录令牌不能为空！");
				result.put("Token", "");
			}
		} catch (Exception e) {
			log.error("终端请求登录用户名密码认证接口报错！", e);
		}
		return result;
	}

	
	/**
	 * 生成token
	 * @param userName  用户登录名
	 * @param serviceNo 设备号
	 * @return
	 * @throws Exception 
	 */
	private String createToken(Object userName,Object serviceNo) throws Exception {
		Date date = new Date();
		try {
			String api_token_key = MD5.md5(Tools.getProperty("api_token_key", "hlsd"));
			String token =  MD5.md5(userName.toString())        //MD5加密用户名
							+AESUtil.encrypt2Str(api_token_key) //aes再加密
							+System.currentTimeMillis();        //加上系统当前时间
			token = token.replaceAll("[^a-zA-Z0-9_\u4e00-\u9fa5]", ""); //去除特殊字符
			//下面除1000，是因为配置文件配置的是以毫秒为单位的
			int exTime = Integer.parseInt(Tools.getProperty("token_ext_time", "7200000"));
			RedisToken.saveToken(userName.toString()+"_login", serviceNo.toString(), token, exTime/1000,redisDaoImpl);
			RedisToken.saveTokenForHlsdv1(token, userName.toString(), exTime/1000,redisDaoImpl);  //为互联速递那边需要验证码
			RedisToken.saveServiceNoForHlsdv1(userName.toString()+"_steed_dataCache_phoneFlag", serviceNo.toString(),redisDaoImpl);
			//修改互联速递用户表里面的token
			PageData pd = new PageData();
			pd.put("userPassword", token);
			pd.put("phoneFlag", serviceNo);
			pd.put("userId", userName);
			appUserService.updateUserToken(pd);
			log.info(userName+" 获取token成功！ "+DateUtil.formatDate(date, "yyyy-MM-dd HH:mm:sss"));
			return token;
		} catch (Exception e) {
			log.error(e.getLocalizedMessage()+" 用户==》"+userName+" 获取token失败！ "+DateUtil.formatDate(date, "yyyy-MM-dd HH:mm:sss"),e);
			throw new Exception("认证令牌生成错误!");
		}
	}
	/**
	 * 生成token
	 * @param userName  用户登录名
	 * @param serviceNo 设备号
	 * @return
	 * @throws Exception 
	 */
	@SuppressWarnings("unused")
	private String createBDUserToken(Object userName,Object serviceNo) throws Exception {
		Date date = new Date();
		try {
			String api_token_key = MD5.md5(Tools.getProperty("api_token_key", "hlsd"));
			String token =  MD5.md5(userName.toString())        //MD5加密用户名
					+AESUtil.encrypt2Str(api_token_key) //aes再加密
					+System.currentTimeMillis();        //加上系统当前时间
			token = token.replaceAll("[^a-zA-Z0-9_\u4e00-\u9fa5]", ""); //去除特殊字符
			//下面除1000，是因为配置文件配置的是以毫秒为单位的
			int exTime = Integer.parseInt(Tools.getProperty("token_ext_time", "7200000"));
			RedisToken.saveToken(userName.toString()+"_login", serviceNo.toString(), token, exTime/1000,redisDaoImpl);
			RedisToken.saveTokenForHlsdv1(token, userName.toString(), exTime/1000,redisDaoImpl);  //为互联速递那边需要验证码
			RedisToken.saveServiceNoForHlsdv1(userName.toString()+"_steed_dataCache_phoneFlag", serviceNo.toString(),redisDaoImpl);
			/*//修改互联速递用户表里面的token
			PageData pd = new PageData();
			pd.put("userPassword", token);
			pd.put("phoneFlag", serviceNo);
			pd.put("userId", userName);
			appUserService.updateUserToken(pd);*/
			log.info(userName+" 获取token成功！ "+DateUtil.formatDate(date, "yyyy-MM-dd HH:mm:sss"));
			return token;
		} catch (Exception e) {
			log.error(e.getLocalizedMessage()+" 用户==》"+userName+" 获取token失败！ "+DateUtil.formatDate(date, "yyyy-MM-dd HH:mm:sss"),e);
			throw new Exception("认证令牌生成错误!");
		}
	}
	
}
