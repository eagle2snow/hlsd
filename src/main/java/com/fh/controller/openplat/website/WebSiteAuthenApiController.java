/**
 * fileName: WebSiteApiController.java
 * @author zhangWenChao 张文超
 * @Created on 2017年7月10日 下午6:02:46
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.controller.openplat.website;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.controller.weixin.pay.util.MD5Util;
import com.fh.dao.redis.RedisDao;
import com.fh.service.openplat.coupon.CouponManager;
import com.fh.service.openplat.website.OrderToHlsdService;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.util.Constants;
import com.fh.util.MessageUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.token.redis.RedisToken;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/app_openapi")
public class WebSiteAuthenApiController extends BaseController {
	
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	
	@Resource(name = "redisDaoImpl") //redis缓存
	private RedisDao redisDaoImpl;
	
	@Resource(name = "couponService")
	private CouponManager CouponService;
	
	/**
	 * 获取6位数验证码
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/getSixYzm")
	@ResponseBody
	public void getSixYzm() throws Exception{
		String mobileNo = this.getRequest().getParameter("mobileNo");
		logBefore(logger, mobileNo+" 获取验证码");
		JSONObject result  = new JSONObject();
		int yzm = 999999;
		try {
			String isDev = Tools.getProperty("devMode", "true");
			if(!"true".equals(isDev)){ //开发测试环境就不调用
				yzm = (int)((Math.random()*9+1)*100000);
				MessageUtil.sendMessge1(mobileNo,"您正在获取 互联速递下单平台 手机认证 \n本次验证码为: "+yzm+"  ,验证码10分钟内有效");
			}
			redisDaoImpl.addString(mobileNo+"_yzm", yzm+"",60*10);
			result.put("result", true);
			result.put(Constants.RESP_MSG, "获取成功");
		} catch (Exception e) {
			result.put("result", false);
			result.put(Constants.RESP_MSG, "获取失败");
		}
		this.writeJson(result.toString());
	}
	
	
	/**
	 * 通过用户手机的密码或获取验证码登录
	 * @throws Exception
	 */
	@RequestMapping(value="/loginByMobile")
	@ResponseBody
	public void loginByMobile() throws Exception{
		JSONObject result  = new JSONObject();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			String mobileNo = pd.getString("mobileNo");
			logBefore(logger, mobileNo+" 登录网站下单系统");
			//验证码
			String code = pd.getString("valid6Code");
			String md5Pass = pd.getString("md5Pass");
			String md5Key = MD5Util.string2MD5(Tools.getProperty("api_token_key", ""));
			if(!Tools.isEmpty(code)){ //验证码登录
				String str = redisDaoImpl.get(mobileNo+"_yzm");
				String isDev = Tools.getProperty("devMode", "true");
				if("true".equals(isDev)){ //如果是开发或测试环境，默认就是6个9作为验证码
					str = "999999";
				}
				if(!Tools.isEmpty(str) && code.equals(str)){
					//登录成功(普通用户)
					String roleId = "a69f468d0ac94cfd969b79da9079896c"; //对应sys_role里面的 ROLE_ID
					pd.put("USERNAME", mobileNo);
					pd.put("ROLE_ID", roleId);
					pd = appuserService.findByUsernameAndRoleId(pd);
					if(pd==null){ //如果为空表示没有注册过，这里默认注册一个用户
						pd = new PageData();
						String userId = this.get32UUID();
						pd.put("USER_ID", userId);
						pd.put("USERNAME", mobileNo);
						pd.put("PASSWORD", MD5Util.string2MD5(mobileNo));
						pd.put("NAME", mobileNo);
						pd.put("ROLE_ID", roleId);
						pd.put("STATUS", "1");
						pd.put("START_TIME", new Date());
						pd.put("PHONE", mobileNo);
						appuserService.saveU(pd);
						//注册到互联速递那边
						int stat = OrderToHlsdService.regNormalUser(userId, mobileNo);
						if(stat==0){//表示为新用户，给10元的优惠券
							PageData cPd = new PageData();
							cPd.put("xh", this.get32UUID());
							cPd.put("userId", mobileNo);
							cPd.put("couponType", "1");
							cPd.put("couponName", "新用户注册送10元");
							cPd.put("couponMonye", 10);
							cPd.put("couponStatus", "1");
							//20天的有效期
							SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						  	Calendar c = Calendar.getInstance();
						  	c.add(Calendar.DAY_OF_MONTH, 20);
							cPd.put("effectiveDate", f.format(c.getTime()));
							CouponService.save(cPd);
						}
					}
					//创建token
					String token = RedisToken.createToken(md5Key+"_"+mobileNo,redisDaoImpl);
					result.put("result", true);
					result.put(Constants.RESP_MSG, "登录成功");
					result.put("validToken", token);
				}else{
					//验证码错误
					result.put("result", false);
					result.put(Constants.RESP_MSG, "登录失败,验证码错误");
				}
				result.put("userXh", pd.get("USER_ID"));
				result.put("mobileNo", pd.get("USERNAME"));
				result.put("userName", pd.get("NAME"));
			}else{
				pd.put("USERNAME", mobileNo);
				pd.put("PASSWORD", md5Pass);
				pd = appuserService.findByUsernameAndPwd(pd);
				if(pd!=null){
					String token = RedisToken.createToken(md5Key+"_"+mobileNo,redisDaoImpl);
					result.put("result", true);
					result.put(Constants.RESP_MSG, "登录成功");
					result.put("validToken", token);
				}else{
					result.put("result", false);
					result.put(Constants.RESP_MSG, "登录失败,用户名或密码错误");
				}
			}
		} catch (Exception e) {
			result.put("result", false);
			result.put(Constants.RESP_MSG, "登录失败,认证Token失败");
			e.printStackTrace();
		}
		this.writeJson(result.toString());
	}
}
