package com.fh.service.hlsd.BD.bduser;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：BD专员模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-21 11:52
 * @version
 */
@SuppressWarnings("all") 
public interface BDUserManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public Integer edit(PageData pd)throws Exception;
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void updateBDUserWXMessage(PageData pd)throws Exception;
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void updateBDUserAlipayMessage(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	/**
	 * @Title: findUserBDCode
	 * @Description: 根据BD码获取bd专员信息
	 * @param @param string
	 * @param @return
	 * @param @throws Exception    
	 * @return int    
	 * @throws
	 */
	public int findUserBDCode(String string) throws Exception;

	/**
	 * @Title: getUserByMobileNo
	 * @Description: 根据电话号码获取用户信息
	 * @param @param string
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getUserByMobileNo(String string) throws Exception;

	/**
	 * @Title: findByBDUSERID
	 * @Description: 根据用户id获取用户信息
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData findByBDUSERID(PageData param)throws Exception;
	/**
	 * @Title: findByBDUSERID
	 * @Description: 根据用户id获取用户信息
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getBDUserMessageByBDUSERID(PageData param)throws Exception;

	/**
	 * @Title: getgetUserOrderNumberMessage
	 * @Description: 分页查询用户订单数量统计信息
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getUserOrderNumberMessage(PageData param)throws Exception;

	/**
	 * @Title: getBDUserByOpenId
	 * @Description: 根据openId查询用户信息
	 * @param @param selectParam
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public PageData getBDUserNumberByOpenId(PageData selectParam)throws Exception;

	/**
	 * @Title: findBySTATE
	 * @Description: 根据唯一标志查询用户信息
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData findBySTATE(PageData param)throws Exception;
	
	/**
	 * @Title: updateBDUserMessge
	 * @Description: 修改用户信息
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return Long    
	 * @throws
	 */
	public Long updateBDUserMessge(PageData param)throws Exception;

	/**
	 * @Title: getUserCountByBDCODE
	 * @Description: 根据BD码获取用户的数量
	 * @param @param selectParam
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getUserCountByBDCODE(PageData selectParam)throws Exception;

	/**
	 * @Title: getPartnerMessageByBdCode
	 * @Description: 根据BD码获取合伙人信息
	 * @param @param bDUSER
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getPartnerMessageByBdCode(PageData bDUSER)throws Exception;

	/**
	 * @Title: getPartnerCountByBDCODE
	 * @Description: 根据BD码获取合伙人数量
	 * @param @param bDUSER
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getPartnerCountByBDCODE(PageData bDUSER)throws Exception;

	/**
	 * @Title: getPartnerDetailMessageByBDUserId
	 * @Description: 根据用户id获取用户信息
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getPartnerDetailMessageByBDUserId(PageData param)throws Exception;
	
	
}

