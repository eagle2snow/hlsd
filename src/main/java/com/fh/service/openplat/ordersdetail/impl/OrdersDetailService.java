package com.fh.service.openplat.ordersdetail.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.hlsd.OrdersDetailVO;
import com.fh.service.openplat.ordersdetail.OrdersDetailManager;
import com.fh.util.PageData;

/** 
 * 说明：订单详细信息管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:59
 * @version
 */
@Service("ordersdetailService")
public class OrdersDetailService implements OrdersDetailManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param OrdersDetailVO
	 * @throws Exception
	 */
	public void save(OrdersDetailVO vo)throws Exception{
		dao.save("OrdersDetailMapper.save", vo);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("OrdersDetailMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("OrdersDetailMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrdersDetailMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrdersDetailMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrdersDetailMapper.findById", pd);
	}
	
	/**
	 * 根据OrderId 查询订单详情
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByOrderId(String orderId)throws Exception{
		return (List<PageData>)dao.findForList("OrdersDetailMapper.findByOrderId", orderId);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrdersDetailMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

