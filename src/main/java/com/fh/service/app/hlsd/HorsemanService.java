package com.fh.service.app.hlsd;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.fh.controller.weixin.pay.util.PayCommonUtil;
import com.fh.controller.weixin.pay.util.XMLUtil;
import com.fh.entity.appPay.UnifiedOrderSend;
import com.fh.service.app.APPService;
import com.fh.service.app.IApiService;
import com.fh.service.hlsd.common.CommonManager;
import com.fh.service.hlsd.config.ConfigDomainManager;
import com.fh.service.hlsd.examinfo.ExamInfoManager;
import com.fh.service.hlsd.examopt.ExamOptManager;
import com.fh.service.hlsd.history.TRechangeWithdrawalsHistoryManager;
import com.fh.service.hlsd.userInfo.AppUserManager;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;
import com.fh.util.express.util.HttpUtil;
import com.fh.util.hlsd.AlipayConfig;
import com.fh.util.hlsd.ContentManagerUtils;
import com.fh.util.hlsd.DateUtils;
import com.fh.util.hlsd.Md5Util;
import com.fh.util.hlsd.ObjectUtils;

public class HorsemanService extends APPService implements IApiService{
	
	Logger log = Logger.getLogger(HorsemanService.class);

	@Resource(name = "examinfoService")
	private ExamInfoManager examinfoService;
	
	@Resource(name = "examOptService")
	private ExamOptManager examOptService;
	
	@Resource(name = "appUserService")
	private AppUserManager appUserService;
	
	@Resource(name = "commonService")
	private CommonManager commonService;
	
	@Resource(name = "tRechangeWithdrawalsHistoryService")
	private TRechangeWithdrawalsHistoryManager tRechangeWithdrawalsHistoryService;
	
	@Resource(name = "configDomainService")
	private ConfigDomainManager configDomainService;
	//horsemanExamineSubject
	/* (non-Javadoc)
	 * <p>Title: handle</p>
	 * <p>Description: 骑手考试题目</p>
	 * @param pageData
	 * @return
	 * @see com.fh.service.app.IApiService#handle(com.fh.util.PageData)
	 */
	public Map<String,Object> horsemanExamineSubject(PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		try {
			PageData pd = new PageData();
			
			pd.put("JOIN_EXAM", ContentManagerUtils.JOIN_EXAM);//加入考试的题目
			List<PageData> examineSubjectList = examinfoService.listPart(pd);
			
			if(ObjectUtils.isCollectionNotEmpty(examineSubjectList)){
				
				for (PageData examOpt : examineSubjectList) {
					
					String QUESTION_ID = (String) examOpt.get("QUESTION_ID");
					
					List<PageData> examOptList = examOptService.SelectByQuestionId(QUESTION_ID);
					
					examOpt.put("examOptList", examOptList);
				}
			}
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "考试题目", examineSubjectList);
		} catch (Exception e) {
			e.printStackTrace();
			//e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "获取考试题目失败", null);
		}
		
		return responseResult;
	}
	
	/**
	 * @Title: horsemanExamine
	 * @Description: 骑手考试接口
	 * @param @param request
	 * @param @return    
	 * @return ModelAndView    
	 * @throws
	 */
	public Map<String,Object> horsemanExamineAnswer(PageData pageData){
		Map<String,Object> responseResult = new HashMap<String,Object>();
		Map<String,Object> responseContent = null;
		try {
			
			responseContent = new HashMap<String,Object>();
			
			String horsemanId = (String) pageData.get("userId");
			
			String deliverymanConsequence = (String) pageData.get("deliverymanConsequence");
			
			PageData horseman = appUserService.getUserByUserId(horsemanId);
			
			String message = "";
			if(horseman != null){
				PageData updateParams = new PageData();
				
				updateParams.put("userId", horsemanId);
				
				if(ContentManagerUtils.HORSEMAN_EXAMINE_SUCCESS.equals(deliverymanConsequence)){
					updateParams.put("status", ContentManagerUtils.HORSEMAN_EXAMINE_SUCCESS_STATUS);
					message = "考试通过";
					responseContent.put("status", ContentManagerUtils.HORSEMAN_EXAMINE_SUCCESS_STATUS);
					
				}else{
					updateParams.put("status", ContentManagerUtils.HORSEMAN_EXAMINE_FAIL_STATUS);
					message = "考试未通过";
					responseContent.put("status", ContentManagerUtils.HORSEMAN_EXAMINE_FAIL_STATUS);
				}
				String updateStatus = appUserService.updateUserByCondition(updateParams);
				if(ContentManagerUtils.UPDATE_SUCCESS.equals(updateStatus)){
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, message, responseContent);
				}else{
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
				}
			}else{
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户id错误", null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		return responseResult;
	}
	
	/**
	 * @Title: horsemanInviteFriend
	 * @Description: 骑手邀请好友
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> horsemanInviteFriend(PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		
		try{
			
			String horsemanId = (String) pageData.get("userId");
			
			if(StringUtils.isNotBlank(horsemanId)){
				
				PageData horseman = appUserService.getUserByUserId(horsemanId);
				
				if(horseman != null){
					
					Map<String,Object> responseContent = new HashMap<String,Object>();
					
					responseContent.put("userName", horseman.getString("userName"));
					responseContent.put("userPhoto", ContentManagerUtils.HORSEMAN_INVITE_USERPHOTO);
					
					responseContent.put("userMobileNo", horseman.getString("userMobileNo"));
					
					responseContent.put("horsemanInviteUrl",ContentManagerUtils.HORSEMAN_INVITE_HTML_URL);
					
					responseContent.put("horsemanInvitePicture", ContentManagerUtils.HORSEMAN_INVITE_PICTURE_URL);
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "邀请信息", responseContent);
				}else{
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户id错误", null);
				}
			}else{
				
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户id为空", null);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		
		return responseResult;
	}
	
	/**
	 * @Title: getHorsemanMoney
	 * @Description: 获取骑手金额
	 * @param @param pageData
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> getHorsemanMoney(PageData pageData){
		
 		Map<String,Object> responseResult = new HashMap<String,Object>();
		
		Map<String,Object> responseContent = null;
		
		try{
			String horsemanId = (String) pageData.get("userId");
			
			if(StringUtils.isNotBlank(horsemanId)){
				
				PageData horseman = appUserService.getUserByUserId(horsemanId);
				
				if(horseman != null){
					
					if(DateUtils.isWeekFlag()){
						
						PageData pd = new PageData();
						
						pd.put("userId", horseman.getString("userId"));
						
						pd.put("availableBalance", horseman.get("money"));
						
						appUserService.updateUserByCondition(pd);
					}
					
					responseContent = new HashMap<String,Object>();
					
					String cashPledgeMessage = ContentManagerUtils.CASH_PLEDGE_MESSAGE;
					
					responseContent.put("hoesemanMoney",  horseman.get("money"));
					
					Double cashPledge = (Double) horseman.get("cashPledge") ;
					
					if(ObjectUtils.isDoubleNotEmptyAndZero(cashPledge)){
						
						cashPledgeMessage = "已交押金"+cashPledge+"元";
					}
					
					responseContent.put("cashPledgeMessage", cashPledgeMessage);
					
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "账户余额", responseContent);
				}else{
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户id错误", responseContent);
				}
			}else{
				
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户id为空", responseContent);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		
		return responseResult;
	}
	

	/**
	 * @Title: horsemanMoneyList
	 * @Description: 骑手余额列表
	 * @param @param pageData
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> horsemanMoneyList(PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		
		Map<String,Object> responseContent = null;
		
		try{
			String horsemanId = (String) pageData.get("userId");
			
			if(StringUtils.isNotBlank(horsemanId)){
				
				PageData horseman = appUserService.getUserByUserId(horsemanId);
				
				if(horseman != null){
					
					if(DateUtils.isWeekFlag()){
						
						PageData pd = new PageData();
						
						pd.put("userId", horseman.getString("userId"));
						
						pd.put("availableBalance", horseman.get("money"));
						
						appUserService.updateUserByCondition(pd);
					}
					
					responseContent = new HashMap<String,Object>();
					
					responseContent.put("hoesemanMoney",  horseman.get("money"));
					
					responseContent.put("openId", horseman.getString("openId"));
					
					responseContent.put("alipayAccount", horseman.getString("alipayAccount"));
					
					responseContent.put("wxNickName", horseman.getString("wxNickName"));
					
					responseContent.put("alipayAccount", horseman.getString("alipayAccount"));
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "账户余额", responseContent);
				}else{
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户id错误", responseContent);
				}
			}else{
				
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户id为空", responseContent);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}
		
		return responseResult;
	}
	
	/**
	 * @param request 
	 * @Title: horsemanPayCashPledge
	 * @Description: 骑手支付押金
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> horsemanPayCashPledge(HttpServletRequest request, PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		Map<Object,Object> responseConstent = null;
		try{
			responseConstent = new HashMap<Object,Object>();
			
			String payType = pageData.getString("payType");//支付类型
			String cashPledge = pageData.getString("cashPledge");//押金
			String horsemanId = pageData.getString("userId");
			
			String devMode = Tools.getProperty("devMode", "false");
			
			if(Boolean.parseBoolean(devMode)){
				
				cashPledge = "0.01";
			}
			
			if(ContentManagerUtils.ALIPAY_CODE.equals(payType)){//支付宝
				
				responseConstent = alipayPayCashPledge(responseConstent,Float.parseFloat(cashPledge),horsemanId);
				
			}else if(ContentManagerUtils.WEIXIN_CODE.equals(payType)){//微信
				
				responseConstent = weixinPayCashPledge(responseConstent,Float.parseFloat(cashPledge),horsemanId,request.getRemoteAddr());
			}
			
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "充值信息", responseConstent);
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseConstent);
		}
		
		return responseResult;
	}
	
	/**
	 * @return 
	 * @param responseConstent 
	 * @Title: weixinPayCashPledge
	 * @Description: 微信支付押金
	 * @param @param cashPledge
	 * @param @param horsemanId    
	 * @return void    
	 * @throws
	 */
	private Map<Object, Object> weixinPayCashPledge(Map<Object, Object> responseConstent, Float cashPledge, String horsemanId,String clientIP) {
		Map<Object,Object> responseContent = null;
		
		try {
			
			responseContent = new HashMap<Object,Object>();
			
			PageData history = createApliyHistory(cashPledge, ContentManagerUtils.WEIXIN, ContentManagerUtils.CASH_PLEDGE_TRANSACTIONTYPE, horsemanId);
			
			tRechangeWithdrawalsHistoryService.saveHistory(history);
			
			UnifiedOrderSend unifiedOrderSend = new UnifiedOrderSend();
			
			unifiedOrderSend.setBody("互联充值");
			unifiedOrderSend.setTotal_fee((int)(cashPledge*100));
			unifiedOrderSend.setSpbill_create_ip(clientIP);
			unifiedOrderSend.setOut_trade_no(history.getString("Id"));
			unifiedOrderSend.setTrade_type("APP");
			
			responseContent = getPayData(unifiedOrderSend);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return responseContent;
	}
	
	/**
	 * 获取
	 * @param body 订单描述
	 * @param money 订单金额,单位分
	 * @param clientIP 客户端ip
	 * @param orderNumber 订单号
	 * @return
	 */
	public SortedMap<Object,Object> getPayData(UnifiedOrderSend unifiedOrderSend){
		SortedMap<Object,Object> orderSend = getUnifiedOrderSend(unifiedOrderSend);//
		Map<String,Object> orderResult =unifiedOrder(orderSend);
		return signOrderResult4App(orderResult);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,Object> unifiedOrder(SortedMap<Object,Object> unifiedOrderSend){
		String redPacketSendMessageToXml = PayCommonUtil.getRequestXml(unifiedOrderSend);
		Map<String,Object> xmlToUnifiedOrderResult = null;
		try {
			 xmlToUnifiedOrderResult = XMLUtil.doXMLParse(HttpUtil.getRequestString(ContentManagerUtils.HTTP_POST,ContentManagerUtils.UFDODER_URL, null, null, redPacketSendMessageToXml));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return xmlToUnifiedOrderResult;
	}
	
	public SortedMap<Object,Object> getUnifiedOrderSend(UnifiedOrderSend unifiedOrderSend) {
		SortedMap<Object,Object> orderSend = new TreeMap<Object,Object>();
		orderSend.put("appid",ContentManagerUtils.WEIXIN_APPID);//附加数据
		orderSend.put("attach","type_pay");//附加数据
		orderSend.put("body",unifiedOrderSend.getBody());//描述
		orderSend.put("mch_id",ContentManagerUtils.WEIXIN_MCH_ID);
		orderSend.put("nonce_str",UuidUtil.get32UUID());
		orderSend.put("notify_url",ContentManagerUtils.WEIXIN_NOTIFY_URL);//回调地址
		orderSend.put("out_trade_no",unifiedOrderSend.getOut_trade_no());//商品订单号
		orderSend.put("spbill_create_ip",unifiedOrderSend.getSpbill_create_ip());//终端ip
		orderSend.put("total_fee",unifiedOrderSend.getTotal_fee().toString());//支付金额
		orderSend.put("trade_type",unifiedOrderSend.getTrade_type());//交易类型("APP")
		String sign = PayCommonUtil.createSign(ContentManagerUtils.CHARACTER_ENCODING, orderSend, ContentManagerUtils.WEIXIN_API_KEY);
		orderSend.put("sign", sign);
		//orderSend.put("openid",ContentManagerUtils.WEIXIN_APP_SECRET);//应用id
		return orderSend;
	}
	
	public SortedMap<Object,Object> signOrderResult4App(Map<String,Object> unifiedOrder) {
    	SortedMap<Object,Object> map = new TreeMap<Object,Object>();
    	map.put("appid", ContentManagerUtils.WEIXIN_APPID);
    	map.put("partnerid", ContentManagerUtils.WEIXIN_MCH_ID);
    	map.put("package", ContentManagerUtils.WEIXIN_PACKAGE);
    	Long value = (Long)(new Date().getTime()/1000);
    	map.put("noncestr", Md5Util.Md5Digest("sted"+value));
    	map.put("timestamp", value+"");
    	map.put("prepayid", unifiedOrder.get("prepay_id"));
    	map.put("sign", PayCommonUtil.createSign(ContentManagerUtils.CHARACTER_ENCODING, map, ContentManagerUtils.WEIXIN_API_KEY));
    	return map;
    }

	/**
	 * @return 
	 * @param responseConstent 
	 * @Title: alipayPayCashPledge
	 * @Description:支付宝支付押金
	 * @param @param cashPledge
	 * @param @param horsemanId    
	 * @return void    
	 * @throws
	 */
	private Map<Object, Object> alipayPayCashPledge(Map<Object, Object> responseConstent, Float cashPledge, String horsemanId) {
		
		Map<Object,Object> responseContent = null;
		
		try {
			
			responseContent = new HashMap<Object,Object>();
			
			PageData history = createApliyHistory(cashPledge, ContentManagerUtils.ALIPAY, ContentManagerUtils.CASH_PLEDGE_TRANSACTIONTYPE, horsemanId);
			
			tRechangeWithdrawalsHistoryService.saveHistory(history);
			
			String orderInfo = AlipayConfig.getOrderInfo("互联充值", "互联充值", cashPledge.toString(), history.getString("Id"));
			/**
			 * 特别注意，这里的签名逻辑需要放在服务端，切勿将私钥泄露在代码中！
			 */
			String sign = AlipayConfig.sign(orderInfo);
				sign = URLEncoder.encode(sign, ContentManagerUtils.CHARACTER_ENCODING);

			/**
			 * 完整的符合支付宝参数规范的订单信息
			 */
			final String payInfo = orderInfo + "&sign=\"" + sign + "\"&" + "sign_type=\"RSA\"";
			
			responseContent.put("payInfo", payInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return responseContent;
	}
	
	/**
	 * @Title: createApliyHistory
	 * @Description: 创建流水记录
	 * @param @param amount
	 * @param @param str
	 * @param @param transactionType
	 * @param @param horsemanId
	 * @param @return    
	 * @return PageData    
	 * @throws
	 */
	@SuppressWarnings("all")
	private PageData createApliyHistory(Float amount,String str,String transactionType ,String horsemanId){
		PageData history = new PageData();
		String orderid =getFlowString(3);
		history.put("Id", orderid);
		history.put("transactionAmount",amount);
		history.put("userId",horsemanId);
		history.put("transactionType",transactionType);
		history.put("payWay",str);
		history.put("status","0");
		history.put("createTime",new Date(System.currentTimeMillis()));
		return history;
		
	}
	/**
	 * @Title: horsemanDealCashPledge
	 * @Description: 骑手处理押金
	 * @param @param pageData
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> horsemanDealCashPledge(PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		Map<String,Object> responseContent = null;
		
		try{
			
			String horsemanId = pageData.getString("userId");
			
			if(StringUtils.isNotBlank(horsemanId)){
				
				PageData horseman = appUserService.getUserByUserId(horsemanId);
				
				if(horseman != null){
					
					responseContent = new HashMap<String,Object>();
					
					String cashPledgeMessages = Tools.getProperty("cashPledgeMessage", "true");
					
					List<Map<String,Object>> MapList  = null;
					
					if(Tools.notEmpty(cashPledgeMessages)){
						MapList = new ArrayList<Map<String,Object>>();
						String[] cashPledgeMessagesArr = cashPledgeMessages.split(",");
						
						for (String cashPledgeMessage : cashPledgeMessagesArr) {
							
							Map<String,Object> cashPledgeMessageMap = new HashMap<String,Object>();
							
							String[] cashPledgeMessageArr = cashPledgeMessage.split("-");
							
							cashPledgeMessageMap.put("cashPledge", cashPledgeMessageArr[0]);
							cashPledgeMessageMap.put("cashPledgeContent", cashPledgeMessageArr[1]);
							
							MapList.add(cashPledgeMessageMap);
								
						}
					}
					
					responseContent.put("cashPledgeMessageList", MapList);
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "押金信息", responseContent);
				}else{
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户编号错误", responseContent);
				}
			}else{
				
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "用户编号为空", responseContent);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作错误", responseContent);
		}
		return responseResult;
	}
	
	/**
	 * @param request 
	 * @Title: submitFileAudit
	 * @Description: 提交文件审核
	 * @param @param pageData
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String,Object> submitFileAudit(HttpServletRequest request, PageData pageData){
		
		Map<String,Object> responseResult = new HashMap<String,Object>();
		try{
			
			String horsemanId = pageData.getString("userId");
			String identityCardFrontalView = pageData.getString("identityCardFrontalView");
			String backOfIdCard = pageData.getString("backOfIdCard");
			String handIdentityCard = pageData.getString("handIdentityCard");
			
			PageData updateParams = new PageData();
			
			updateParams.put("userId", horsemanId);
			updateParams.put("areaId", pageData.getString("areaId"));
			updateParams.put("cityId", pageData.getString("cityId"));
			updateParams.put("provinceId", pageData.getString("provinceId"));
			updateParams.put("userName", pageData.getString("userName"));
			updateParams.put("userCardNo", pageData.getString("userCardNo"));
			
			String updateFlag = appUserService.updateUserByCondition(updateParams);
			
			if(ContentManagerUtils.UPDATE_FILE.equals(updateFlag)){
				
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
				
				return responseResult;
			}
			
			if(StringUtils.isNotBlank(identityCardFrontalView) && StringUtils.isNotBlank(backOfIdCard) && StringUtils.isNotBlank(handIdentityCard)){
				
				deleteFileByDefIdAndFileType(horsemanId,"SMRZ");
				
				commonService.deleteByRefId(horsemanId);
				
				makeSavaFileParam(request, horsemanId, identityCardFrontalView,"身份证正面照","身份证正面照");
				makeSavaFileParam(request, horsemanId, backOfIdCard,"身份证反面照","身份证反面照");
				makeSavaFileParam(request, horsemanId, handIdentityCard,"手持身份证免冠照片","手持身份证免冠照片");
				
				PageData pd = new PageData();
				
				pd.put("status", ContentManagerUtils.HORSEMAN_APPROVE_DISPOSE_STATUS);
				pd.put("userId", horsemanId);
				
				String updateUser = appUserService.updateUserByCondition(pd);
				
				if(ContentManagerUtils.UPDATE_SUCCESS.equals(updateUser)){
					
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "提交成功", null);
				}
				
			}else{
				
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "有照片为空", null);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		
		
		return responseResult;
	}

	/**
	 * @Title: deleteFileByDefIdAndFileType
	 * @Description: 删除文件
	 * @param @param horsemanId
	 * @param @param FILE_TYPE
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	private void deleteFileByDefIdAndFileType(String horsemanId,String FILE_TYPE) throws Exception {
		PageData selectParam = new PageData();
		selectParam.put("REF_ID", horsemanId);
		selectParam.put("FILE_TYPE", FILE_TYPE);
		
		List<PageData> fileList = commonService.selectFileListByRefId(selectParam);
		
		if(ObjectUtils.isCollectionNotEmpty(fileList)){
			
			for(int i=0 ; i<fileList.size() ; i++){
				
				PageData files = fileList.get(i);
				
				deleteFile(files.getString("FILE_TYPE"));
			}
		}
	}
	
	public boolean deleteFile(String sPath) {  
	    boolean flag = false;  
	    File file = new File(sPath);  
	    // 路径为文件且不为空则进行删除  
	    if (file.isFile() && file.exists()) {  
	        file.delete();  
	        flag = true;  
	    }  
	    return flag;  
	}  

	/**
	 * @Title: makeSavaFileParam
	 * @Description: 上传文件保存参数
	 * @param @param request
	 * @param @param horsemanId
	 * @param @param identityCardFrontalView
	 * @param @param fileName
	 * @param @param fileDes
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	private void makeSavaFileParam(HttpServletRequest request, String horsemanId, String identityCardFrontalView, String fileName,String fileDes)
			throws Exception {
		String path = request.getSession().getServletContext().getRealPath(identityCardFrontalView);
		
		File file = new File(path);
		
		PageData addParams = new PageData();
		
		addParams.put("REF_ID", horsemanId);
		addParams.put("FILE_ID", UuidUtil.get32UUID());
		addParams.put("FILE_TYPE", "SMRZ");
		addParams.put("FILE_NAME", fileName);
		addParams.put("FILE_SIZE", file.length());
		addParams.put("FILE_DES", fileDes);
		addParams.put("FILE_PATH", identityCardFrontalView);
		addParams.put("CREATETIME", new Date(System.currentTimeMillis()));
		addParams.put("CREATEUSER", "admin");
		addParams.put("UPDATETIME", new Date(System.currentTimeMillis()));
		addParams.put("UPDATEUSER", "admin");
		
		commonService.savaFile(addParams);
	}
	
	@SuppressWarnings("all")
	@Override
	public Map<String, Object> handle(HttpServletRequest request,PageData data, String methodName) {
		Map<String, Object> responseResult = null;
		if("horsemanExamineSubject".equals(methodName)){//骑手考试题目
			responseResult = horsemanExamineSubject(data);
		}else if("horsemanExamineAnswer".equals(methodName)){//骑手考试结果
			responseResult = horsemanExamineAnswer(data);
		}else if("submitFileAudit".equals(methodName)){//提交认证文件
			responseResult = submitFileAudit(request,data);
		}else if("horsemanInviteFriend".equals(methodName)){//邀请好友
			responseResult = horsemanInviteFriend(data);
		}else if("horsemanDealCashPledge".equals(methodName)){//骑手押金
			responseResult = horsemanDealCashPledge(data);
		}else if("getHorsemanMoney".equals(methodName)){//骑手账户余额
			responseResult = getHorsemanMoney(data);
		}else if("horsemanPayCashPledge".equals(methodName)){//骑手支付押金
			responseResult = horsemanPayCashPledge(request,data);
		}else if("horsemanMoneyList".equals(methodName)){//骑手余额页面
			responseResult = horsemanMoneyList(data);
		}
		
	        /*Class formatter=HorsemanService.class;  
	        HorsemanService t1=new HorsemanService();  
	        Method cMethod;  
	        try {  
	            cMethod = formatter.getMethod(methodName, new Class[]{HttpServletRequest.class,PageData.class});  
	            responseResult =  (Map<String, Object>) cMethod.invoke(t1, new Object[]{request,data});  
	        }  
	        catch (Exception e) {  
	            e.printStackTrace();  
	        }   */
		return responseResult;
	}  
}
