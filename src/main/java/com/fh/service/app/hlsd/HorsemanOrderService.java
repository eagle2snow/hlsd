package com.fh.service.app.hlsd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fh.service.app.IApiService;
import com.fh.service.hlsd.ordersinfo.TOrdersInfoManager;
import com.fh.service.hlsd.systemContent.TSystemContentManager;
import com.fh.util.PageData;

public class HorsemanOrderService implements IApiService{

	@Override
	public Map<String, Object> handle(HttpServletRequest request, PageData data, String method) {
		Map<String, Object> responseResult = null;
		if("horsemanOrderList".equals(method)){
			responseResult = horsemanOrderList(data);
		}else if("".equals(method)){
			responseResult = horsemanForOrderList(data);
		}
		return responseResult;
	}
	
	@Resource(name = "tOrdersInfoSevice")
	private TOrdersInfoManager tOrdersInfoSevice;
	
	@Resource(name = "tSystemContentService")
	private TSystemContentManager tSystemContentService;
	
	/**
	 * @Title: horsemanOrderList
	 * @Description: 骑手订单列表
	 * @param @param pageData
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> horsemanOrderList(PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		try{
			PageData selectParam = new PageData();
			
			String horsemanId = pageData.getString("userId");
			
			selectParam.put("driverId", horsemanId);
			
			orderSelectParameMap(selectParam, pageData);
			
			List<String> statusOrderList = new ArrayList<String>();
			
			statusOrderList.add("8");
			statusOrderList.add("9");
			statusOrderList.add("13");
			
			selectParam.put("statusOrderList", statusOrderList);
			
			List<PageData> orderList = tOrdersInfoSevice.getOrderByDriverIdAbdCondition(selectParam);
			
			writeResponseMessage(responseResult, 0, "订单列表", orderList);
		}catch (Exception e) {
			writeResponseMessage(responseResult, 1, "操作失败", null);
		}
		
		return responseResult;
	}
	
	/**
	 * @Title: horsemanForOrder
	 * @Description: 骑手可接订单列表
	 * @param @param pageData
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> horsemanForOrderList(PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		
		try{
			PageData selectParam = new PageData();
			
			orderSelectParameMap(selectParam, pageData);
			
			selectParam.put("lat", pageData.getString("lat"));
			selectParam.put("lng", pageData.getString("lng"));
			
			Integer distance = tSystemContentService.getDistanceById(1);
			
			selectParam.put("distance", distance);
			
			List<PageData> orderList = tOrdersInfoSevice.selectForOrderByLatLng(selectParam);
		}catch (Exception e) {
			
		}
		
		return responseResult;
	}
	
	/**
	 * @Title: selectParameMap
	 * @Description: 订单查询参数列表
	 * @param     
	 * @return void    
	 * @throws
	 */
	@SuppressWarnings("all")
	private void orderSelectParameMap(PageData selectParam,PageData pageData){
		
		Integer pageSize = 15;
		
		if(pageData.get("pageSize") != null){
			
			pageSize = (Integer) pageData.get("pageSize");
		}
		
		Integer currentPage  = 1;
		
		if(pageData.get("currentPage") != null){
			
			currentPage = (Integer) pageData.get("currentPage");
		}
		
		selectParam.put("begin", (currentPage - 1) * pageSize);
		selectParam.put("end", pageSize);
	}
	
	@SuppressWarnings("all")
	private static void writeResponseMessage(Map<String,Object> responseResult,Integer responseCode,String responseMessage,Object responseContent){
		responseResult.put("responseCode", responseCode);
		responseResult.put("responseMessage", responseMessage);
		responseResult.put("responseContent", responseContent);
	}

}
