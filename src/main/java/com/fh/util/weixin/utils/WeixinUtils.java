package com.fh.util.weixin.utils;

import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

public class WeixinUtils {

	public static boolean query(String out_trade_no) {
		String appid = MPConfigUtils.APPID1;
		String appsecret = "";
		String mch_id = MPConfigUtils.MCH_ID1;//邮件里给的
		String pkey =  MPConfigUtils.API_KEY1;//商户平台里自己设的密钥
		String url="https://api.mch.weixin.qq.com/pay/orderquery";
		String currTime = TenpayUtil.getCurrTime();
		// 8位日期
		String strTime = currTime.substring(8, currTime.length());
		// 四位随机数
		String strRandom = TenpayUtil.buildRandom(4) + "";
		// 10位序列号,可以自行调整。
		String nonce_str = strTime + strRandom;
		Map map=new HashMap();
		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", appid);
		packageParams.put("mch_id", mch_id);
		packageParams.put("nonce_str", nonce_str);
		packageParams.put("out_trade_no", out_trade_no);
		RequestHandler reqHandler = new RequestHandler(
				null, null);
		reqHandler.init(appid, appsecret, pkey);
		String sign = reqHandler.createSign(packageParams);
		String xmlParam = "<xml>" + "<appid>" + appid + "</appid>" + "<mch_id>"
				+ mch_id + "</mch_id>" + "<nonce_str>" + nonce_str
				+ "</nonce_str>" + "<sign><![CDATA[" + sign + "]]></sign>"
				+ "<out_trade_no>" + out_trade_no + "</out_trade_no>"
				+ "</xml>";
//		log.info(xmlParam);
			map=GetWxOrderno.doXML(url, xmlParam);
			
			String string = (String) map.get("trade_state");

			if ("SUCCESS".equalsIgnoreCase(string)) {
				return true;
			}else{
				return false;
			}
			
	}
	
}
