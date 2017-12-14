package com.fh.service.app;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.fh.util.PageData;
import com.fh.util.hlsd.ContentManagerUtils;

@SuppressWarnings("all")
public class APPService {
	
	public Integer pageSize ;
	public Integer currentPage;

	public static void writeResponseMessage(Map<String,Object> responseResult,Integer responseCode,String responseMessage,Object responseContent){
		responseResult.put(ContentManagerUtils.RESPONSE_CODE, responseCode);
		responseResult.put(ContentManagerUtils.RESPONSE_MESSAGE, responseMessage);
		responseResult.put(ContentManagerUtils.RESPONSE_CONTENT, responseContent);
	}
	
	/**
	 * @Title: selectParameMap
	 * @Description: 订单查询参数列表
	 * @param     
	 * @return void    
	 * @throws
	 */
	public void orderSelectParameMap(PageData selectParam,PageData pageData){
		
		if(pageData.get("pageSize") != null){
			
			pageSize = Integer.parseInt(pageData.get("pageSize").toString());
		}else{
			pageSize = 15;
		}
		
		if(pageData.get("currentPage") != null){
			
			currentPage = Integer.parseInt(pageData.get("currentPage").toString());
		}else{
			currentPage = 1;
		}
		
		selectParam.put("begin", (currentPage - 1) * pageSize);
		selectParam.put("end", pageSize);
	}
	
	public  String getFlowString(int flowLength) {

		Date time = new Date(System.currentTimeMillis());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

		String format = sdf.format(time);

		StringBuilder sb = new StringBuilder();
		
		for (int j = 0; j < flowLength; j++) {
			int m = (int) ((Math.random()) * 10);

			sb = sb.append(m);
		}

		return format.substring(2) + sb.toString();
				
	}
	
}
