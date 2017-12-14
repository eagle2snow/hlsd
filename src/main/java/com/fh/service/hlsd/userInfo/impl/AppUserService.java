package com.fh.service.hlsd.userInfo.impl;



import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.service.hlsd.userInfo.AppUserManager;
import com.fh.util.PageData;

@SuppressWarnings("all")
@Service("appUserService")
public class AppUserService implements AppUserManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	/* (non-Javadoc)
	 * <p>Title: getUserByUserId</p>
	 * <p>Description: 根据id查询用户信息</p>
	 * @param userId
	 * @return
	 * @see com.fh.service.hlsd.userInfo.AppUserManager#getUserByUserId(java.lang.String)
	 */
	@Override
	public PageData getUserByUserId(String userId) throws Exception {
		return (PageData) dao.findForObject("AppUserMappers.selectByPrimaryKey",userId);
	}

	/* (non-Javadoc)
	 * <p>Title: updateUserByCondition</p>
	 * <p>Description:修改用户信息 </p>
	 * @param pageData
	 * @see com.fh.service.hlsd.userInfo.AppUserManager#updateUserByCondition(com.fh.util.PageData)
	 */
	@Override
	public String updateUserByCondition(PageData pd) throws Exception {
		return dao.update("AppUserMappers.updateByPrimaryKeySelective", pd).toString();
	}

	@Override
	public String updateUserBeInvitedCode(PageData pd) throws Exception {
		return dao.update("AppUserMappers.updateUserBeInvitedCode", pd).toString();
	}

	@Override
	public int findUserinviteCode(String inviteCode) throws Exception {
		return (int) dao.findForObject("AppUserMappers.findUserinviteCode",inviteCode);
	}

	@Override
	public PageData getUserByMobileNo(String mobileNo,Object userType) throws Exception {
		
		PageData pd = new PageData();
		
		pd.put("userMobileNo", mobileNo);
		pd.put("userType", userType);
		
		return (PageData) dao.findForObject("AppUserMappers.getUserByMobileNo",pd);
	}

	@Override
	public void saveUser(PageData pageData) throws Exception {
		dao.save("AppUserMappers.saveHorseMan", pageData);
	}

	@Override
	public String updateUserToken(PageData pd) throws Exception {
		return dao.update("AppUserMappers.updateUserToken", pd).toString();
	}
	/**
	 * 根据电话号码模糊查询用户
	 * */
	@Override
	public List<String> likeQueryUserIdByUserMobile(String userMobileNo) throws Exception {
		return   (List<String>) dao.findForList("AppUserMappers.queryUserIdByUserMobile",userMobileNo);
	}

	/**
	 * 根据手机号和用户累心查询用户信息
	 * */
	@Override
	public PageData getUserByMobileNoAndUerType(String mobileNo, Object userType) throws Exception {
		
		PageData pd = new PageData();
		
		pd.put("userMobileNo", mobileNo);
		pd.put("userType", userType);
		return (PageData) dao.findForObject("AppUserMappers.getUserByMobileNoAndUerType", pd);
	}

	/* (non-Javadoc)
	 * <p>Title: updateByPrimaryKey</p>
	 * <p>Description:根据主键修改用户信息 </p>
	 * @param uSER
	 * @throws Exception
	 * @see com.fh.service.hlsd.userInfo.AppUserManager#updateByPrimaryKey(com.fh.util.PageData)
	 */
	@Override
	public Integer updateByPrimaryKey(PageData uSER) throws Exception {
		return (Integer) dao.update("AppUserMappers.updateByPrimaryKeySelective", uSER);
	}

	/* (non-Javadoc)
	 * <p>Title: insertSelective</p>
	 * <p>Description: 根据数据获取用户信息</p>
	 * @param pageData
	 * @throws Exception
	 * @see com.fh.service.hlsd.userInfo.AppUserManager#insertSelective(com.fh.util.PageData)
	 */
	@Override
	public void insertSelective(PageData pageData) throws Exception {
		
		dao.save("AppUserMappers.insertSelective", pageData);
	}

	@Override
	public List<String> getUserByBeInvitedCode(String string) throws Exception {
		return (List<String>) dao.findForList("AppUserMappers.getUserByBeInvitedCode", string);
	}

	@Override
	public void updateBeInvitedCodeByUserId(List<String> userIds) throws Exception {
		dao.update("AppUserMappers.updateBeInvitedCodeByUserId", userIds);
	}
	
	

}
