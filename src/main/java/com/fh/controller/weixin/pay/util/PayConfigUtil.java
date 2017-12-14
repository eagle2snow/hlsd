package com.fh.controller.weixin.pay.util;

import com.fh.util.Tools;

public class PayConfigUtil {

	// 以下相关参数需要根据自己实际情况进行配置（appid、appsecret 公众号平台里面找）
	public static String APP_ID = Tools.getProperty("APP_ID", "");
	public static String APP_SECRET = Tools.getProperty("APP_SECRET","");// appsecret
	
	public static String MCH_ID = Tools.getProperty("MCH_ID","");// 你的商业号
	public static String API_KEY = Tools.getProperty("API_KEY","");// API key

	public static String CREATE_IP = Tools.getProperty("CREATE_IP","");// key
	public static String UFDODER_URL = Tools.getProperty("UFDODER_URL","");// 统一下单接口
	public static String NOTIFY_URL = Tools.getProperty("NOTIFY_URL","");// 回调地址
	public static String WEIXIN_SCAN_NOTIFY_URL = Tools.getProperty("WEIXIN_SCAN_NOTIFY_URL","");// 微信后台下单扫码回调地址
}
