package com.fh.util.token.map;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.fh.util.Tools;
import com.fh.util.token.TokenState;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JOSEObjectType;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jose.JWSObject;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.Payload;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;

import net.minidev.json.JSONObject;

/**
 * 核心类Jwt实现Token的生成、验证机制
 * fileName: Jwt.java
 * @author zhangWenchao
 * @Created on 2017年05月02日 下午20:58:35
 * @version 1.0
 */
public class Jwt {

	/**
	 * 秘钥
	 * 请至少保证32位及以上，不然会签名失败
	 */
	private static final byte[] SECRET = "baseplatform201705022058A9999BCDE".getBytes();

	/**
	 * 初始化head部分的数据为 { "alg":"HS256", "type":"JWT" }
	 */
	private static final JWSHeader header = new JWSHeader(JWSAlgorithm.HS256, JOSEObjectType.JWT, null, null, null,
			null, null, null, null, null, null, null, null);

	/**
	 * 生成token，该方法只在用户登录成功后调用
	 * 
	 * @param Map集合，可以存储用户id，token生成时间，token过期时间等自定义字段
	 * @return token字符串,若失败则返回null
	 *   payload.put("iat", date.getTime());// 生成时间
		 long extime = Long.parseLong("7200000");
		 payload.put("ext", date.getTime() + extime);// 过期时间为 2小时
	 */
	public static String createToken(Map<String, Object> payload) {
		String tokenString = null;
		// 创建一个 JWS object
		JWSObject jwsObject = new JWSObject(header, new Payload(new JSONObject(payload)));
		try {
			// 将jwsObject 进行HMAC签名
			jwsObject.sign(new MACSigner(SECRET));
			tokenString = jwsObject.serialize();
		} catch (JOSEException e) {
			System.err.println("签名失败:" + e.getMessage());
			e.printStackTrace();
		}
		return tokenString;
	}

	/**
	 * 校验token是否合法，返回Map集合,集合中主要包含 state状态码 data鉴权成功后从token中提取的数据
	 * 该方法在过滤器中调用，每次请求API时都校验
	 * 
	 * @param token
	 * @return Map<String, Object>
	 */
	public static Map<String, Object> validToken(String token) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			JWSObject jwsObject = JWSObject.parse(token);
			Payload payload = jwsObject.getPayload();
			JWSVerifier verifier = new MACVerifier(SECRET);

			if (jwsObject.verify(verifier)) {
				JSONObject jsonOBj = payload.toJSONObject();
				// token校验成功（此时没有校验是否过期）
				resultMap.put("state", TokenState.VALID.toString());
				// 若payload包含ext字段，则校验是否过期
				if (jsonOBj.containsKey("ext")) {
					long extTime = Long.valueOf(jsonOBj.get("ext").toString());
					long curTime = new Date().getTime();
					//终端需要重新登录的时间，以天为单位，这里配置1天，可以设置为：0.5、0.8、5、7 这样的参数
					float confHour = Float.parseFloat(Tools.getProperty("client_relogin_time", "1"));
					float extHour = (curTime-extTime)/(float)(1000*60*60*60);
					if(extHour>confHour){//需要重新登录了
						resultMap.clear();
						resultMap.put("state", TokenState.EXPIRED_LOGIN.toString());
					}else if (curTime > extTime) {// 过期了，但没超过重新登录的时间
						resultMap.clear();
						resultMap.put("state", TokenState.EXPIRED.toString());
					}
				}
				resultMap.put("data", jsonOBj);

			} else {
				// 校验失败
				resultMap.put("state", TokenState.INVALID.toString());
			}

		} catch (Exception e) {
			// e.printStackTrace();
			// token格式不合法导致的异常
			resultMap.clear();
			resultMap.put("state", TokenState.INVALID.toString());
		}
		return resultMap;
	}
	
	/**
	 * 校验token是否合法，token和userId、ServiceNo是否一致，返回Map集合,集合中主要包含 state状态码 data鉴权成功后从token中提取的数据
	 * 该方法在过滤器中调用，每次请求API时都校验
	 * @param token     token
	 * @param userId    登录账号
	 * @param serviceNo 登录设备号
	 * @return Map<String, Object>
	 */
	public static Map<String, Object> validTokenByUseridAndServiceNo(String token,Object userId,Object serviceNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			JWSObject jwsObject = JWSObject.parse(token);
			Payload payload = jwsObject.getPayload();
			JWSVerifier verifier = new MACVerifier(SECRET);

			if (jwsObject.verify(verifier)) {
				JSONObject jsonOBj = payload.toJSONObject();
				// token校验成功（此时没有校验是否过期）
				resultMap.put("state", TokenState.VALID.toString());
				// 若payload包含ext字段，则校验是否过期
				if (jsonOBj.containsKey("ext")) {
					long extTime = Long.valueOf(jsonOBj.get("ext").toString());
					long curTime = new Date().getTime();
					//终端需要重新登录的时间，以小时为单位，这里默认配置7天，可以设置为：1、3、5、7、24、36 这样的参数
					float confHour = Float.parseFloat(Tools.getProperty("client_relogin_time", "1"));
					float extHour = (curTime-extTime)/(float)(1000*60*60*60);
					if(extHour>confHour){//需要重新登录了
						resultMap.clear();
						resultMap.put("state", TokenState.EXPIRED_LOGIN.toString());
					}else if (curTime > extTime) {// 过期了，但没超过重新登录的时间
						resultMap.clear();
						resultMap.put("state", TokenState.EXPIRED.toString());
					}
				}
				String uid = jsonOBj.get("uid").toString();
				String seNo = jsonOBj.get("serviceNo").toString();
				if(!uid.equals(userId) || !seNo.equals(serviceNo)){ //判断是不是同一个用户和设备请求登录
					resultMap.put("state", TokenState.DIFFER.toString());
				}
				resultMap.put("data", jsonOBj);

			} else {
				// 校验失败
				resultMap.put("state", TokenState.INVALID.toString());
			}

		} catch (Exception e) {
			// e.printStackTrace();
			// token格式不合法导致的异常
			resultMap.clear();
			resultMap.put("state", TokenState.INVALID.toString());
		}
		return resultMap;
	}

}
