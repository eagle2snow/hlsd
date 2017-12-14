package com.fh.service.hlsd.ordersinfo.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.service.hlsd.ordersinfo.TOrdersInfoManager;
import com.fh.util.PageData;

@SuppressWarnings("all")
@Service("tOrdersInfoSevice")
public class TOrdersInfoService implements TOrdersInfoManager {
	
	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	/* (non-Javadoc)
	 * <p>Title: getOrderByUserId</p>
	 * <p>Description: 根据用户id获取订单信息</p>
	 * @param userId
	 * @return
	 * @see com.fh.service.hlsd.ordersinfo.TOrdersInfoManager#getOrderByUserId(java.lang.String)
	 */
	@Override
	public List<PageData> getOrderByDriverIdAbdCondition(PageData pageData) throws Exception {
		return (List<PageData>) dao.findForList("TOrdersInfoMapper.selectByDriverIdAndCondition", pageData);
	}
	/* (non-Javadoc)
	 * <p>Title: selectForOrderByLatLng</p>
	 * <p>Description: 查询可接订单</p>
	 * @param selectParam
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.ordersinfo.TOrdersInfoManager#selectForOrderByLatLng(com.fh.util.PageData)
	 */
	@Override
	public List<PageData> selectForOrderByLatLng(PageData pageData) throws Exception {
		return (List<PageData>) dao.findForList("TOrdersInfoMapper.selectForOrderByDriverIdAndCondition", pageData);
	}

}
