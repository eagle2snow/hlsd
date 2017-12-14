package com.fh.service.openplat.ordersinfo.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.service.openplat.ordersinfo.OrdersInfoManager;
import com.fh.util.PageData;

/** 
 * 说明：订单模块管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:53
 * @version
 */
@Service("ordersinfoService")
public class OrdersInfoService implements OrdersInfoManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增保存订单
	 * @param ordersInfo      主订单
	 * @throws Exception
	 */
	public void save(OrdersInfoVO ordersInfo)throws Exception{
		dao.save("OrdersInfoMapper.save", ordersInfo);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("OrdersInfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("OrdersInfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrdersInfoMapper.datalistPage", page);
	}
	
	/**
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listForWebSite(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OrdersInfoMapper.datalistPageForWebSite", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("OrdersInfoMapper.listAll", pd);
	}
	/**列表(超过20分钟的订单)
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listSecondMiniteData()throws Exception{
		return (List<PageData>)dao.findForList("OrdersInfoMapper.listSecondMiniteData");
	}
	
	/**通过XH获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("OrdersInfoMapper.findById", pd);
	}
	
	/**通过orderId获取数据
	 * @param orderId
	 * @throws Exception
	 */
	public OrdersInfoVO findByOrderId(String orderId)throws Exception{
		return (OrdersInfoVO)dao.findForObject("OrdersInfoMapper.findByOrderId", orderId);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("OrdersInfoMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**修改订单状态
	 * 
	 * @param orderId
	 * @param status
	 * @throws Exception
	 */
	public void updateOrderStatus(String orderId,int status)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", orderId);
		map.put("status", status);
		dao.update("OrdersInfoMapper.updateOrderStatus", map);
	}

	/**修改订单支付状态
	 * 
	 * @param orderId 订单号
	 * @param payType  支付方式 (微信、支付宝)
	 * @param payStatus  支付状态 (0未支付  1已支付)
	 * @param transaction_id  第三方支付交易订单号(支付宝、微信的交易订单号)
	 * @throws Exception
	 */
	public void updateOrderPayStatus(String orderId,String payType,String payStatus,String transaction_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", orderId);
		map.put("payType", payType);
		map.put("payStatus", payStatus);
		map.put("transaction_id", transaction_id);
		dao.update("OrdersInfoMapper.updateOrderPayStatus", map);
	}
	
	
	/**
	 * 抢单
	 * @param orderId 订单号
	 * @param driverId   司机编号
	 * @throws Exception
	 */
	public void updateOrderDriver(String orderId,String driverId)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", orderId);
		map.put("driverId", driverId);
		dao.update("OrdersInfoMapper.updateOrderDriver", map);
	}
	
	
	/**通过orderId和订单状态获取数据
	 * @param orderId  订单号
	 * @param status   订单状态
	 * @throws Exception
	 */
	public OrdersInfoVO findByOrderIdAndStatu(String orderId,String status)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", orderId);
		map.put("driverId", status);
		return (OrdersInfoVO)dao.findForObject("OrdersInfoMapper.findByOrderIdAndStatu", map);
	}
	
	/**
	 * 通过用户ID查询订单类型条数
	 */
	public PageData findUserOrderTypeCount(String userId) throws Exception {
		return (PageData)dao.findForObject("OrdersInfoMapper.findUserOrderTypeCount", userId);
	}

}

