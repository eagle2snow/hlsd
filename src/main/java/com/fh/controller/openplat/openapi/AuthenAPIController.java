/**
 * Title: 获取登录认证的token
 * fileName: AuthenAPIController.java
 * @author zhangWenChao 张文超
 * @Created on 2017年7月03日 下午15:59:45
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.controller.openplat.openapi;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.controller.openplat.openapi.authen.Contants;
import com.fh.controller.weixin.pay.util.MD5Util;
import com.fh.dao.redis.RedisDao;
import com.fh.openplat.OrderUtils;
import com.fh.service.openplat.myapp.MyAppManager;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.util.Constants;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.token.redis.RedisToken;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/app_openapi")
public class AuthenAPIController extends BaseController {
	
	@Resource(name="myappService") //开放平台app
	private MyAppManager myappService;
	
	@Resource(name="appuserService") //用户登录
	private AppuserManager appuserService;
	
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;
	
	/**
	 * 获取登录认证的token
	 * @throws Exception
	 */
	@RequestMapping(value="/getPassToken")
	@ResponseBody
	public void getPassToken() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		logBefore(logger, pd.getString("appid")+" 请求获取登录认证的token");
		try {
			//设置参数为了查询
			PageData pdata = new PageData();
			pdata.put("APPID", pd.get("appid"));
			pdata.put("OPENID", pd.get("openid"));
			PageData pageData = myappService.findByTwoParams(pdata);
			JSONObject result  = OrderUtils.CheckAuthentication(pd,pageData);
			if(Boolean.parseBoolean(result.get("result").toString())){
				//如果检查通过，就设置相关的值
				result.put("result", true);
				//通过appid和userId 生成唯一token
				result.put("validToken", RedisToken.createToken(pd.getString("appid")+"_"+pd.getString("userId"),redisDaoImpl));
				result.put(Constants.RESP_MSG, "获取成功");
			}
			this.writeJson(result.toString());
		} catch (Exception e) {
			logger.error("请求参数错误,"+e.getLocalizedMessage());
			this.writeJson(false, Contants.PARAMERROR, "请求参数错误,"+e.getLocalizedMessage());
		}
	}
	
	
	/**
	 * 通过固定的key，获取认证的token
	 * @throws Exception
	 */
	@RequestMapping(value="/getPassTokenByKey")
	@ResponseBody
	public void getPassTokenByKey() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		logBefore(logger, pd.getString("userId")+" 请求获取登录认证的token");
		try {
			//设置参数为了查询
			String key = pd.getString("md5Key");
			String userId = pd.getString("userId");
			String configKey = Tools.getProperty("api_token_key", "001");
			String md5key = MD5Util.string2MD5(configKey);
			JSONObject result  = new JSONObject();
			if(md5key.equals(key)){
				//如果检查通过，就设置相关的值
				result.put("result", true);
				//通过md5加密后的key和userId 生成唯一token
				result.put("validToken", RedisToken.createToken(key+"_"+userId,redisDaoImpl));
				result.put(Constants.RESP_MSG, "获取成功");
			}else{
				//如果检查通过，就设置相关的值
				result.put("result", false);
				result.put(Constants.RESP_MSG, "key不正确,获取认证失败");
			}
			this.writeJson(result.toString());
		} catch (Exception e) {
			logger.error("请求参数错误,"+e.getLocalizedMessage());
			this.writeJson(false, Contants.PARAMERROR, "请求参数错误,"+e.getLocalizedMessage());
		}
	}

}
