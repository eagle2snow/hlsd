/**
 * Title: RedisToken工具类
 * fileName: java
 * @author zhangWenChao 张文超
 * @Created on 2017年5月16日 下午5:32:11
 * @version 1.0
 */

package com.fh.util.token.redis;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fh.dao.redis.RedisDao;
import com.fh.util.DateUtil;
import com.fh.util.Tools;
import com.fh.util.token.TokenState;
import com.fh.util.token.map.Jwt;

public class RedisToken {
	
	private static final Logger log = Logger.getLogger(RedisToken.class);

	/**
	 * 
	 * @param uid  登录账号 唯一
	 * @param serviceNo 设备号
	 * @param token token
	 * @param extTime 过期时间以秒为单位(0 表示永久)
	 */
	public static void saveToken(String uid,String serviceNo,String token,int extTime,RedisDao redisDaoImpl) throws Exception{
		Map<String, String> map = new HashMap<String,String>();
		map.put("uid", uid);
		map.put("serviceNo", serviceNo);
		map.put("token", token);
		//int extTime = Integer.parseInt(Tools.getProperty("token_ext_time", "7200000"));
		Map<String, String> isExist = redisDaoImpl.getMap(uid);
		if(isExist!=null && isExist.size()>0){
			redisDaoImpl.delete(uid);
		}
		if(extTime==0){
			redisDaoImpl.addMap(uid, map);
		}else{
			redisDaoImpl.addMap(uid, map,extTime);
		}
	}
	
	/**
	 * 通过用户名、serviceNo、token验证token是否合法
	 * @param uid 
	 * @param serviceNo
	 * @param token
	 */
	public static TokenState valideToken(String uid,String serviceNo,String token,RedisDao redisDaoImpl) throws Exception{
		Map<String, String> map = redisDaoImpl.getMap(uid);
		if(map.size()>0){
			String _uid = map.get("uid");
			String _service_no = map.get("serviceNo");
			String _token = map.get("token");
			if(!_uid.equals(uid) || !_service_no.equals(serviceNo) || !_token.equals(token)){
				return TokenState.DIFFER;
			}else{
				return TokenState.VALID;
			}
		}else{
			return TokenState.EXPIRED;
		}
	}
	
	
	/**
	 * 
	 * @param uid  登录账号 唯一
	 * @param token token
	 * @param extTime 过期时间以秒为单位(0 表示永久)
	 */
	public static void saveToken(String uid,String token,int extTime,RedisDao redisDaoImpl) throws Exception{
		String isDev = Tools.getProperty("devMode", "");
		if("true".equals(isDev)){
			extTime =  0 ;// 如果是开发环境有效期设置为永久
		}
		Map<String, String> map = new HashMap<String,String>();
		map.put("uid", uid);
		map.put("token", token);
		if(extTime==0){
			redisDaoImpl.addMap(uid, map);
		}else{
			redisDaoImpl.addMap(uid, map,extTime);
		}
	}
	
	/**
	 * 通过用户名、token验证token是否合法
	 * @param uid 
	 * @param token
	 */
	public static TokenState valideToken(String uid,String token,RedisDao redisDaoImpl) throws Exception{
		Map<String, String> map = redisDaoImpl.getMap(uid);
		if(map.size()>0){
			String _uid = map.get("uid");
			String _token = map.get("token");
			if(!_uid.equals(uid) || !_token.equals(token)){
				return TokenState.DIFFER;
			}else{
				return TokenState.VALID;
			}
		}else{
			return TokenState.EXPIRED;
		}
	}
	
	/**
	 * 生成token 用于网站下单平台使用
	 * @param userName  用户登录名 保证唯一
	 * @return
	 */
	public static String createToken(Object userName,RedisDao redisDaoImpl) {
		Date date = new Date();
		try {
			Map<String, Object> payload = new HashMap<String, Object>();
			payload.put("uid", userName);// 用户id
			payload.put("iat", date.getTime());// 生成时间
			
			int extTime = Integer.parseInt(Tools.getProperty("website_token_ext_time", "3600"));
			payload.put("ext", date.getTime() + extTime);
			String token = Jwt.createToken(payload);
			//配置文件配置的是以秒为单位
			RedisToken.saveToken(userName.toString(), token, extTime,redisDaoImpl);
			log.info(userName+" 获取token成功！ "+DateUtil.formatDate(date, "yyyy-MM-dd HH:mm:sss"));
			return token;
		} catch (Exception e) {
			log.error(e.getLocalizedMessage()+" 用户==》"+userName+" 获取token失败！ "+DateUtil.formatDate(date, "yyyy-MM-dd HH:mm:sss"),e);
			return "认证令牌生成错误!";
		}
	}
	
	
	/**
	 * 为互联速递那边使用存储的
	 * @param token
	 * @param uid
	 * @param extTime
	 * @throws Exception
	 */
	public static void saveTokenForHlsdv1(String token,String uid,long extTime,RedisDao redisDaoImpl) throws Exception{
		if(extTime==0){
			redisDaoImpl.addString(token, uid);
		}else{
			redisDaoImpl.addString(token, uid,extTime);
		}
	}
	
	/**
	 * @Title: savaServiceNoForHlsdv1
	 * @Description: TODO
	 * @param @param userId
	 * @param @param serviceNo    
	 * @return void    
	 * @throws
	 */
	public static void saveServiceNoForHlsdv1(String userId,String serviceNo,RedisDao redisDaoImpl){
		redisDaoImpl.addString(userId, serviceNo);
	}
	
	
	/**
	 * 保存验证码
	 * @param userId 登录账号
	 * @param yzm    需要保存的验证码
	 * @throws Exception
	 */
	public static void saveYzmForHlsdv1(String userId,String yzm,long extTime,RedisDao redisDaoImpl) throws Exception{
		if(!Tools.isEmpty(redisDaoImpl.get(userId))){
			redisDaoImpl.delete(userId);
		}
		if(extTime==0){
			redisDaoImpl.addString(userId, yzm);
		}else{
			redisDaoImpl.addString(userId, yzm,extTime);
		}
	}
	
	
	/**
	 * 判断验证码是否正确
	 * @param userId  登录账号
	 * @param yzm     用户输入的验证码
	 * @return
	 * @throws Exception
	 */
	public static boolean validYzmForHlsdv1(String userId,String yzm,RedisDao redisDaoImpl) throws Exception{
		if(yzm.equals(redisDaoImpl.get(userId))){
			redisDaoImpl.delete(userId);
			return true;
		}else{
			return false;
		}
	}

	/**
	 * 批量删除数据
	 * @Title: delect
	 * @Description: TODO
	 * @param @param list
	 * @param @param redisDaoImpl
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public static void delect(List<String> list, RedisDao redisDaoImpl) throws Exception {
		redisDaoImpl.delete(list);
	}
	
}
