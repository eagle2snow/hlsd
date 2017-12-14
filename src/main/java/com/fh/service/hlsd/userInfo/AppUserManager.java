package com.fh.service.hlsd.userInfo;

import java.util.List;

import com.fh.util.PageData;

public interface AppUserManager {

	/**
	 * @Title: getUserByUserId
	 * @Description: 根据id查询用户信息
	 * @param @param userId
	 * @param @return    
	 * @return PageData    
	 * @throws
	 */
	public PageData getUserByUserId(String userId) throws Exception;

	/**
	 * @Title: updateUserByCondition
	 * @Description: 根据Id修改用户信息
	 * @param @param pageData    
	 * @return void    
	 * @throws
	 */
	public String updateUserByCondition(PageData pd) throws Exception;
	
	/**
	 * 更新用户邀请码
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String updateUserBeInvitedCode(PageData pd) throws Exception;
	
	/**
	 * 查询邀请码是否存在
	 * @param inviteCode
	 * @return
	 * @throws Exception
	 */
	public int findUserinviteCode(String inviteCode) throws Exception;
	
	
	/**
	 * 登录认证骑手是否存在
	 * @param mobileNo
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByMobileNo(String mobileNo,Object userType) throws Exception;
	/**
	 * 登录认证骑手是否存在
	 * @param mobileNo
	 * @return
	 * @throws Exception
	 */
	public PageData getUserByMobileNoAndUerType(String mobileNo,Object userType) throws Exception;

	/**
	 * @Title: saveUser
	 * @Description: 保存用户信息
	 * @param @param pageData
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void saveUser(PageData pageData) throws Exception;
	
	/**
	 * 更新用户token，也就是userPassword这个字段
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public String updateUserToken(PageData pd) throws Exception;
	
	/**
	 * @Title: likeQueryUserIdByUserMobile
	 * @Description: 根据电话号码模糊查询用户
	 * @param @param userMobileNo
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<String> likeQueryUserIdByUserMobile(String userMobileNo)throws Exception;

	/**
	 * @Title: updateByPrimaryKey
	 * @Description: 根据主键修改信息
	 * @param @param uSER
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public Integer updateByPrimaryKey(PageData uSER)throws Exception;

	/**
	 * @Title: insertSelective
	 * @Description: 添加数据
	 * @param @param pageData
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void insertSelective(PageData pageData)throws Exception;

	/**
	 * @Title: getUserByBeInvitedCode
	 * @Description: 根据被邀请码获取用户id
	 * @param @param string
	 * @param @return
	 * @param @throws Exception    
	 * @return List<String>    
	 * @throws
	 */
	public List<String> getUserByBeInvitedCode(String string)throws Exception;

	/**
	 * @Title: updateBeInvitedCodeByUserId
	 * @Description: 根据用户id修改用户的被邀请码
	 * @param @param userIds
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void updateBeInvitedCodeByUserId(List<String> userIds)throws Exception;

}
