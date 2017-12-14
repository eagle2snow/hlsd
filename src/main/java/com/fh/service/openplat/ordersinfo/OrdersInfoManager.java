package com.fh.service.openplat.ordersinfo;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.util.PageData;

/** 
 * 说明：订单模块管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:53
 * @version
 */
public interface OrdersInfoManager{

	/**新增保存订单
	 * @param ordersInfoVO      主订单
	 * @throws Exception
	 */
	public void save(OrdersInfoVO ordersInfo)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	
	/**列表--给网站平台上用户的我的订单的功能
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listForWebSite(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**列表(查询超过20分钟没配送员接单的数据)
	 * @throws Exception
	 */
	public List<PageData> listSecondMiniteData()throws Exception;
	
	/**通过XH获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**通过orderId获取数据
	 * @param orderId
	 * @throws Exception
	 */
	public OrdersInfoVO findByOrderId(String orderId)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**修改订单状态
	 * 
	 * @param orderId 订单号
	 * @param status  订单状态
	 * @throws Exception
	 */
	public void updateOrderStatus(String orderId,int status)throws Exception;
	
	
	/**修改订单支付状态
	 * 
	 * @param orderId 订单号
	 * @param payType  支付方式 (微信、支付宝)
	 * @param transaction_id  第三方支付交易订单号(支付宝、微信的交易订单号)
	 * @throws Exception
	 */
	public void updateOrderPayStatus(String orderId,String payType,String payStatus,String transaction_id)throws Exception;
	
	/**
	 * 抢单（即更新承运司机）
	 * @param orderId 订单号
	 * @param driverId   司机编号
	 * @throws Exception
	 */
	public void updateOrderDriver(String orderId,String driverId)throws Exception;
	
	
	/**通过orderId和订单状态获取数据
	 * @param orderId  订单号
	 * @param status   订单状态
	 * @throws Exception
	 */
	public OrdersInfoVO findByOrderIdAndStatu(String orderId,String status)throws Exception;
	
	/**查询订单类型条数
	 * @param userId
	 * @throws Exception
	 */
	public PageData findUserOrderTypeCount(String userId)throws Exception;

	
}

