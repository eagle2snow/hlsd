package com.fh.service.openplat.ordersteps;

import java.util.List;

import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.util.PageData;

/** 
 * 说明：订单详细信息管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:59
 * @version
 */
public interface OrderStepsManager{

	/**新增
	 * @param OrdersStepsVO
	 * @throws Exception
	 */
	public void save(OrdersStepsVO vo)throws Exception;
	
	/**通过orderId查询订单步骤状态
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByOrderId(PageData pd)throws Exception;
	
}

