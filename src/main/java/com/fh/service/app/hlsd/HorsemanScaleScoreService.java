package com.fh.service.app.hlsd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.fh.service.app.IApiService;
import com.fh.service.hlsd.scale.ScaleScoreManager;
import com.fh.service.hlsd.scale.record.ScaleScoreRecordManager;
import com.fh.service.hlsd.userInfo.AppUserManager;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;
import com.fh.util.hlsd.ContentManagerUtils;


public class HorsemanScaleScoreService implements IApiService{

	@Resource(name = "appUserService")
	private AppUserManager appUserService;
	@Resource(name = "scaleScoreRecordService")
	private ScaleScoreRecordManager scaleScoreRecordService;
	@Resource(name = "scaleScoreService")
	private ScaleScoreManager scaleScoreService;
	/**
	 * @Title: userScaleScoreRecordList
	 * @Description: 用户等级分数记录集合
	 * @param @return    
	 * @return String    
	 * @throws
	 */
	public Map<String,Object> userScaleScoreRecordList(PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		
		try{
			String userId = pageData.getString("userId");
			
			
			PageData selectParam = new PageData();
			
			selectParam.put("userId", userId);
			
			Long recordCount = scaleScoreRecordService.getRecordCountByUserId(userId);
			
			orderSelectParameMap(selectParam, pageData);
			
			List<PageData> scaleScoreRecordList = scaleScoreRecordService.getScaleRecardListByUserId(selectParam);
			
			Map<String, Object> responseContent = new HashMap<String, Object>();
			
			responseContent.put("recordList", scaleScoreRecordList);
			responseContent.put("currentPage", pageData.get("currentPage") == null ? 1 : pageData.get("currentPage"));
			responseContent.put("pageSize", pageData.get("pageSize") == null ? 15 : pageData.get("pageSize"));
			responseContent.put("totalPage", (recordCount-1)/Integer.parseInt(responseContent.get("pageSize").toString())+1);
			writeResponseMessage(responseResult,ContentManagerUtils.RESPONSE_CODE_SUCCESS, "余额明细", responseContent);
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult,ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		
		return responseResult;
	}
	
	public Map<String,Object> addScaleScore(){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		try{
			PageData pageData = new PageData();
			
			pageData.put("scaleId", UuidUtil.get32UUID());
			
			pageData.put("scaleName", ContentManagerUtils.PRACTICE_HORSEMAN);
			
			pageData.put("scaleScoreMax", 10);
			pageData.put("scaleScoreMin", 0);
			pageData.put("scalePicture", ContentManagerUtils.PRACTICE_HORSEMAN_PICTURE);
			
			scaleScoreService.addScaleScore(pageData);
			
		}catch (Exception e) {
		}
		
		return responseResult;
	}
	
	@SuppressWarnings("all")
	private static void writeResponseMessage(Map<String,Object> responseResult,Integer responseCode,String responseMessage,Object responseContent){
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
	@SuppressWarnings("all")
	private void orderSelectParameMap(PageData selectParam,PageData pageData){
		
		Integer pageSize = 15;
		
		if(pageData.get("pageSize") != null){
			
			pageSize = Integer.parseInt(pageData.get("pageSize").toString());
		}
		
		Integer currentPage  = 1;
		
		if(pageData.get("currentPage") != null){
			
			currentPage = Integer.parseInt(pageData.get("currentPage").toString());
		}
		
		selectParam.put("begin", (currentPage - 1) * pageSize);
		selectParam.put("end", pageSize);
	}
	
	/**
	 * @Title: scaleScoreMessage
	 * @Description: 等级分数信息
	 * @param @return    
	 * @return String    
	 * @throws
	 */
	public Map<String,Object> scaleScoreMessage(PageData pageData){
		Map<String,Object> responseResult = new HashMap<String,Object>();
		try{
			String horsemanId = pageData.getString("userId");
			
			PageData horseman = appUserService.getUserByUserId(horsemanId);
			
			Map<String,Object> responseContent = new HashMap<String,Object>();
			
			String scaleId = horseman.getString("scaleId");
			
			if(StringUtils.isNotBlank(scaleId)){
				
				
				PageData tScaleScore = scaleScoreService.getScaleScoreByScaleId(scaleId);
				
				responseContent.put("scaleName", tScaleScore.getString("scaleName"));//等级名称
				responseContent.put("scalePicture", tScaleScore.getString("scalePicture"));//等级图片
				responseContent.put("scaleScoreMax", tScaleScore.get("scaleScoreMax"));//等级最大分数
				responseContent.put("scaleScoreMin", tScaleScore.get("scaleScoreMin"));//等级最小分数
				
			}else{
				
				PageData tScaleScore = scaleScoreService.getScaleScoreByScaleName(ContentManagerUtils.PRACTICE_HORSEMAN);
				
				PageData updateHorsemanParam = new PageData();
				
				updateHorsemanParam.put("userId", horseman.getString("userId"));
				updateHorsemanParam.put("scaleId", tScaleScore.getString("scaleId"));
				updateHorsemanParam.put("scaleScore", ContentManagerUtils.START_SCALE_SCORE);
				
				appUserService.updateUserByCondition(updateHorsemanParam);
				
				responseContent.put("scaleName", tScaleScore.getString("scaleName"));//等级名称
				responseContent.put("scalePicture", tScaleScore.getString("scalePicture"));//等级图片
				responseContent.put("scaleScoreMax", tScaleScore.get("scaleScoreMax"));//等级最大分数
				responseContent.put("scaleScoreMin", tScaleScore.get("scaleScoreMin"));//等级最小分数
			}
			
			responseContent.put("scaleScore", horseman.get("scaleScore"));//等级分
			responseContent.put("commentScore", horseman.get("commentScore"));//服务分
			
			
			writeResponseMessage(responseResult,ContentManagerUtils.RESPONSE_CODE_SUCCESS, "等级分数信息", responseContent);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult,ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		return responseResult;
	}

	@Override
	public Map<String, Object> handle(HttpServletRequest request, PageData data, String method) {
		Map<String, Object> responseResult = null;
		if("scaleScoreMessage".equals(method)){//等级信息
			responseResult = scaleScoreMessage(data);
		}else if("userScaleScoreRecordList".equals(method)){//等级分数记录信息
			responseResult = userScaleScoreRecordList(data);
		}else if("addScaleScore".equals(method)){
			responseResult = addScaleScore();
		}
		return responseResult;
	}
}
