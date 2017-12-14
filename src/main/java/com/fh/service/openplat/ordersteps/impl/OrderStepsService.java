package com.fh.service.openplat.ordersteps.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.service.openplat.ordersteps.OrderStepsManager;
import com.fh.util.PageData;

/** 
 * 说明：订单详细信息管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:59
 * @version
 */
@Service("orderStepsService")
public class OrderStepsService implements OrderStepsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param OrdersStepsVO
	 * @throws Exception
	 */
	public void save(OrdersStepsVO vo)throws Exception{
		dao.save("OrderStepsMapper.save", vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<PageData> findByOrderId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrderStepsMapper.findByOrderId", pd);
	}
}

