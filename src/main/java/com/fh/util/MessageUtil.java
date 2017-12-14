package com.fh.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import org.apache.log4j.Logger;

import com.fh.service.system.fhsms.FhsmsManager;
import com.fh.service.system.fhsms.impl.FhsmsService;
import com.fh.util.express.util.HttpUtil;
import com.ucpaas.restDemo.client.JsonReqClient;

import net.sf.json.JSONObject;

public class MessageUtil {
	
	private static Logger logger = Logger.getLogger(MessageUtil.class);
	
	private static final String smsUrl = "http://api.smsbao.com/sms?u=#USERNAME#&p=#PASSWORD#&m=#PHONE#&c=#CONTENT#";
	
	private static FhsmsManager smsService = (FhsmsManager) Tools.getSpringBean(FhsmsService.class);
	
	/**
	 * 发送短信工具类
	 * @param phoneNumber 手机号码
	 * @param content 短信内容
	 * @return 发送成功或失败
	 */
	public static boolean sendMessge(String phoneNumber,String content){
		String replaceAll;
		try {
			replaceAll = smsUrl.replaceAll("#PASSWORD#", Tools.getProperty("sms.password",""))
				.replaceAll("#USERNAME#", Tools.getProperty("sms.name",""))
				.replaceAll("#PHONE#", phoneNumber).replaceAll("#CONTENT#", URLEncoder.encode(content, "UTF-8"));
			return "0".equals(HttpUtil.getRequestString(1, replaceAll, null, null,null));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static String sendMessge1(String phoneNumber,String content){
		String replaceAll;
		try {
			replaceAll = smsUrl.replaceAll("#PASSWORD#", Tools.getProperty("sms.password",""))
					.replaceAll("#USERNAME#", Tools.getProperty("sms.name",""))
					.replaceAll("#PHONE#", phoneNumber).replaceAll("#CONTENT#", URLEncoder.encode(content, "UTF-8"));
			return HttpUtil.getRequestString(1, replaceAll, null, null,null);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "";
		}
	}
	

	//==========================================================云之迅短信接口=============================================================	
		/**
		 * 通过云之迅发送短信
		 * @param phoneNumber 接受短信手机号
		 * @param templateId  短信模板编号
		 * @param param       短信模板参数替换,多个用逗号分割(如:"何仙姑,445688")
		 * @description 
		 *  目前已配置的短信模板 <br/>
			132494	通知模板	订单签收通知	您的订单:{1}已被签收,详情请登录互联速递(该单为你服务的司机是:{2},电话:{3})  <br/>
			132492	通知模板	订单状态跟踪	亲爱的用户，您的订单{1},如有疑问请拨打客服热线:400-0755828             <br/>
			132504	通知模板	通知被签收	           尊敬的互联用户，您寄往{1}的{2}已被签收。详情请登录互联用户端查看。很高兴为您服务! <br/>
			132507	通知模板	邀请返50	           亲爱的用户，您邀请的骑手:{1}已完成首单,给您返现:{2}元已到账,如有疑问请拨打客服热线:400-0755828 <br/>
			132462	验证码模板	验证类验证码	互联速递提醒您本次验证码为: {1} ,验证码两小时有效   <br/>
			132466	验证码模板	邀请类验证码	您正在接受邀请 本次验证码为: {1} ,验证码两小时有效  <br/>
			132446	验证码模板	互联骑手登录	您正在登录互联骑手本次验证码为:{1} ,验证码两小时有效  <br/>
			132449	验证码模板	互联车主	           您正在登录互联车主本次验证码为:{1} ,验证码两小时有效  <br/>
			132452	验证码模板	互联速递登录	您正在登录互联速递本次验证码为:{1} ,验证码两小时有效  <br/>
		 * @return
		 */
		public static boolean sendMessgeByYunzhixun(String phoneNumber,String templateId,String param){
			try {
				logger.info(phoneNumber+" 获取短信验证码为： "+param);
				String accountSid = Tools.getProperty("yzx_Sid", "");
				String authToken = Tools.getProperty("yzx_token","");
				String appId = Tools.getProperty("yzx_appId","");
				String result= new JsonReqClient().templateSMS(accountSid, authToken, appId, templateId, phoneNumber, param);
				JSONObject json = JSONObject.fromObject(result);
				JSONObject resJson = json.getJSONObject("resp");
				String respCode = resJson.getString("respCode");
				//保存到数据库，方便后台可以查看
				try {
					if(param!=null && !param.contains(",")){
						//保存到短信发送记录表里面
						PageData pd = new PageData();
						pd.put("CONTENT",phoneNumber+" 请求获取的验证码是： "+ param);	
						pd.put("TYPE",3);
						pd.put("TO_USERNAME",phoneNumber);	
						pd.put("FROM_USERNAME","");
						pd.put("SEND_TIME",DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
						int status = 0;
						if("000000".equals(respCode)){
							status = 1;
						}
						pd.put("STATUS",status);
						pd.put("FHSMS_ID",UuidUtil.get32UUID());
						pd.put("SANME_ID",UuidUtil.get32UUID());
						smsService.save(pd);
					}
				} catch (Exception e) {
					logger.error("保存验证码失败 "+param);
				}
				if("000000".equals(respCode)){
					return true;
				}else{
					return false;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		}
		
		public static void main(String[] args) {
			String accountSid = "fdd0b3a16b35a0f538ff3fe3ba60e422";
			String authToken = "33362038387474cd02ccbc8f722cf920";
			String appId = "ab4561e94dfc4545a5dd531a1a12eb6a";
			String result= new JsonReqClient().templateSMS(accountSid, authToken, appId, "159871", "13349907019", null);
			JSONObject json = JSONObject.fromObject(result);
			JSONObject resJson = json.getJSONObject("resp");
			String respCode = resJson.getString("respCode");
			
			System.out.println(respCode);
		}
}
