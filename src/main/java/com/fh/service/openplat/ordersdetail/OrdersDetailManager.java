package com.fh.service.openplat.ordersdetail;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.hlsd.OrdersDetailVO;
import com.fh.util.PageData;

/** 
 * 说明：订单详细信息管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:59
 * @version
 */
public interface OrdersDetailManager{

	/**新增
	 * @param OrdersDetailVO
	 * @throws Exception
	 */
	public void save(OrdersDetailVO vo)throws Exception;
	
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
	
	/**通过orderId获取订单详情数据
	 * @param orderId 订单号
	 * @throws Exception
	 */
	public List<PageData> findByOrderId(String orderId)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

