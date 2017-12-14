package com.fh.service.hlsd.ordersinfo;

import java.util.List;

import com.fh.util.PageData;

public interface TOrdersInfoManager {

	/**
	 * @Title: getOrderByHorsemanId
	 * @Description: 根据用户id和条件获取订单信息
	 * @param @param horsemanId
	 * @param @return    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getOrderByDriverIdAbdCondition(PageData pageData) throws Exception;

	/**
	 * @Title: selectForOrderByLatLng
	 * @Description: 查询可接订单
	 * @param @param selectParam
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> selectForOrderByLatLng(PageData selectParam) throws Exception;

}
