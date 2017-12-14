/**
 * Title: 终端认证-基于Jwt（包括登录用户名密码认证、每次服务调用时Token的认证）
 * fileName: Authenticate4MobileService.java
 * @author zhangWenchao
 * @Created on 2016年10月31日 下午4:06:50
 * @version 1.0
 */

package com.fh.service.app.authenticate.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.service.app.authenticate.IAuthenticate4Mobile;
import com.fh.util.Constants;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.token.TokenState;
import com.fh.util.token.map.Jwt;

@Service("authenticateByJwt")
public class AuthenticateByJwt implements IAuthenticate4Mobile{
	
	private final Logger log = Logger.getLogger(AuthenticateByJwt.class);

	@Resource(name = "daoSupport")
	private DaoSupport dao;

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
		Object userId = pageData.get("userId");
		Object userPwd = pageData.get("userPwd");
		Object token = pageData.get("Token");
		Object serviceNo = pageData.get("serviceNo");//终端设备号
		if ("login".equals(serviceName)) {
			result = authenByUserNameAndPwd(userId, userPwd,serviceNo);
		}else if("resetToken".equals(serviceName)){
			if(userId!=null && serviceNo!=null && token!=null){
				try {
					//Map<String, Object> token_rs = Jwt.validToken(token.toString()); //只认证token
					Map<String, Object> token_rs = Jwt.validTokenByUseridAndServiceNo(token.toString(),userId,serviceNo);
					
					String state = (String) token_rs.get("state");
					if(TokenState.getTokenState(state).equals(TokenState.EXPIRED)
							|| TokenState.getTokenState(state).equals(TokenState.VALID)){  // 成功后返回token
						result.put("result", Constants.SUCCESS);
						result.put(Constants.RESP_MSG, "获取成功！");
						result.put("Token", createToken(userId,serviceNo));
					}else if(TokenState.getTokenState(state).equals(TokenState.EXPIRED_LOGIN)){//需要重新登录
						float confHour = Float.parseFloat(Tools.getProperty("client_relogin_time", "1"));
						result.put("result", Constants.FAIL);
						result.put(Constants.RESP_MSG, "认证令牌有效期超过 "+confHour+" 小时，请重新登录才能获取认证令牌！");
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
		} else {
			if(userId!=null && serviceNo!=null && token!=null){
				result = authenByToken(token.toString(), userId, serviceNo);
			}else{
				result.put("result", Constants.FAIL);
				result.put(Constants.RESP_MSG, "请求失败，请保证用户id、设备号、失效令牌都不能为空！");
				result.put("Token", "");
			}
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
			log.error("终端请求登录用户名密码认证接口报错！", e);
			throw new Exception("终端请求登录用户名密码认证接口报错！");
		}
		return result;
	}

	/**
	 * 通过token认证
	 * @param result
	 * @param token
	 */
	private Map<String, Object> authenByToken(String token,Object userId,Object serviceNo) {
		Map<String, Object> result =  new LinkedHashMap<String, Object>();
		try {
			if (token != null) {
				Map<String, Object> token_rs = Jwt.validTokenByUseridAndServiceNo(token, userId, serviceNo);
				String state = (String) token_rs.get("state");
				switch (TokenState.getTokenState(state)) {
				case VALID:
					result.put("result", Constants.SUCCESS);
					//result.put(Constants.RESP_MSG, "请求成功！");
					//result.put("Token", token); // 成功后返回token
					break;
				case EXPIRED_LOGIN:
					float confHour = Float.parseFloat(Tools.getProperty("client_relogin_time", "1"));
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "登录令牌有效期超过 "+confHour+" 天，请重新登录才能获取登录令牌！");
					result.put("Token", "");
					break;
				case EXPIRED:
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "登录令牌过期，请重新获取认证令牌！");
					result.put("Token", "");
					break;
				case INVALID:
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "请求失败,登录令牌不合法！");
					result.put("Token", "");
					break;
				case DIFFER:
					result.put("result", Constants.FAIL);
					result.put(Constants.RESP_MSG, "非法请求,用户账号、设备号及登录令牌不一致！");
					result.put("Token", "");
					break;
				}
			} else {
				result.put("result", Constants.FAIL);
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
	 */
	private String createToken(Object userName,Object serviceNo) {
		Map<String, Object> payload = new HashMap<String, Object>();
		Date date = new Date();
		payload.put("uid", userName);// 用户id
		payload.put("serviceNo", serviceNo);// 终端设备号
		payload.put("iat", date.getTime());// 生成时间
		long extime = Long.parseLong(Tools.getProperty("token_ext_time", "7200000"));
		payload.put("ext", date.getTime() + extime);// 过期时间为配置文件里面的1.5小时，毫秒为单位
		return Jwt.createToken(payload);
	}
	
}
