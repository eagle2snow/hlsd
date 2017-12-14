/**
 * Title: 终端认证接口（包括登录用户名密码认证、每次服务调用时Token的认证）
 * fileName: IAuthenticate4Mobile.java
 * @author zhangWenchao
 * @Created on 2016年10月31日 下午4:06:50
 * @version 1.0
 */

package com.fh.service.app.authenticate;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.fh.util.PageData;

@Service("authenticate")
public interface IAuthenticate4Mobile{
	

	/**
	 * 认证的主方法 ： 用户id、密码认证
	 * @param Map data
	 * @param String serviceName (服务名：login、token)
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> authenticate(PageData pageData,String serviceName) throws Exception;

	/**
	 * 通过登录账号、用户密码登录
	 * @param userName  登录账号
	 * @param userPwd   MD5加密后的密码
	 * @param serviceNo 设备号
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> authenByUserNameAndPwd(Object userName,Object userPwd,Object serviceNo) throws Exception;
}
