package com.fh.service.app.hlsd.BD;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fh.service.app.APPService;
import com.fh.service.app.IApiService;
import com.fh.service.hlsd.BD.bdincome.BDIncomeManager;
import com.fh.service.hlsd.BD.bduser.BDUserManager;
import com.fh.service.hlsd.userInfo.AppUserManager;
import com.fh.util.PageData;
import com.fh.util.hlsd.ContentManagerUtils;

public class BDIncomeService extends APPService implements IApiService{

	@Resource(name = "bduserService")
	private BDUserManager bduserService;
	
	@Resource(name = "bdincomeService")
	private BDIncomeManager bdincomeService;
	
	@Resource(name = "appUserService")
	private AppUserManager appUserService;
	/**
	 * @Title: getUserIncomeMessageByUserId
	 * @Description: 根据客户id和BD专员id查询BD专员的收入信息
	 * @param @param pd
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String, Object> getUserIncomeMessageByUserIdAndBDUserId(PageData pd){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		Map<String,Object> responseContent = null;
		try{
			responseContent = new HashMap<String,Object>();
			
			Object USERID = pd.get("customerId");
			
			PageData customer = appUserService.getUserByUserId(USERID.toString());
			
			Object BDUSERID = pd.get("userId");
			
			PageData param = new PageData();
			
			param.put("BDUSERID", BDUSERID);
			
			PageData BDUSER = bduserService.findById(param);
			
			PageData selectParam = new PageData();
			
			orderSelectParameMap(selectParam, pd);
			
			selectParam.put("USERID", USERID);
			selectParam.put("BDUSERID", BDUSERID);
			selectParam.put("USERTYPE", customer.getString("userType"));
			
			PageData counts = bdincomeService.getIncomeCount(selectParam);
			
			List<PageData> BDIncome = bdincomeService.getBDIncomeByBDUserIdAndUserId(selectParam);
			
			responseContent.put("BDIncome", BDIncome);
			responseContent.put("pageSize",    pageSize);
			responseContent.put("currentPage", currentPage);
			responseContent.put("userName", customer.getString("userName"));
			responseContent.put("userMobileNo", customer.getString("userMobileNo"));
			responseContent.put("ShopPicture", BDUSER.getString("ShopPicture"));
			responseContent.put("totalPage", (Integer.parseInt(counts.get("count").toString())-1)/pageSize+1);
			
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "收入信息", responseContent);
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}
		return responseResult;
	}
	
	/**
	 * @Title: getUserIncomeMessageByUserId
	 * @Description: 根据专员id查询BD专员的收入信息
	 * @param @param pd
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String, Object> getUserIncomeMessageByBDUserId(PageData pd){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		Map<String,Object> responseContent = null;
		try{
			responseContent = new HashMap<String,Object>();
			
			Object BDUSERID = pd.get("userId");
			
			PageData selectParam = new PageData();
			
			orderSelectParameMap(selectParam, pd);
			
			selectParam.put("BDUSERID", BDUSERID);
			
			PageData counts = bdincomeService.getIncomeCount(selectParam);
			
			PageData allMoney = bdincomeService.getBDIncomeAllMoney(selectParam);
			
			List<PageData> BDIncome = bdincomeService.getBDIncomeByBDUserId(selectParam);
			
			responseContent.put("BDIncome", BDIncome);
			responseContent.put("allMoney", allMoney.get("ALLMONEY"));
			responseContent.put("pageSize", pageSize);
			responseContent.put("currentPage", currentPage);
			responseContent.put("totalPage", (Integer.parseInt(counts.get("count").toString())-1)/this.pageSize+1);
			
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "收入信息", responseContent);
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}
		return responseResult;
	}
	
	
	

	@Override
	public Map<String, Object> handle(HttpServletRequest request, PageData data, String method) {
		Map<String, Object> responseResult = null;
		if("getUserIncomeMessageByBDUserId".equals(method)){
			responseResult = getUserIncomeMessageByBDUserId(data);
		}else if("getUserIncomeMessageByUserIdAndBDUserId".equals(method)){
			responseResult = getUserIncomeMessageByUserIdAndBDUserId(data);
		}
		return responseResult;
	}

}
