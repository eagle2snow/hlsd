package com.fh.util.weixin.utils;

public class MPConfigUtils {
	
	/*public static String APPID = "wxd225550ca5fc04db";
	
	public static String APPSECRET = "680990ae9ba761ffa09fd93f55cc3c61";
	
	public static String MCH_ID = "1254635501"; //商户号
	
	public static String API_KEY = "87F6C49ACBC3F8F253633014208F7756"; //API密钥
	
	public static String CERT_PATH = "C://apiclient_cert.p12"; //请求证书绝对地址
*/	
	public static String APPID = "wx08cbd8c363e5525c";//wx5120312feee8cc5e
	public static String APPID1 = "wx5120312feee8cc5e";//wx5120312feee8cc5e
	
	public static String APPSECRET = "ec800c9863cd1cb92aacfa589d5ce371";
	
	public static String MCH_ID = "1413387902"; //商户号
	public static String MCH_ID1 = "1413578102"; //商户号
	
	public static String API_KEY = "OSIFJ23OIRNF34OIJ9J8FH23FNIDSOFF"; //API密钥
	public static String API_KEY1 = "OSIFJ66OIRNF52OIJ9J8FH23HLSDERWQ"; //API密钥
	//网页授权地址
	public static String OAUTH2_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	//获取code的URL
	public static String GETCODEURL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
	
	public static String UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder"; //统一下单地址
	//企业付款的URL
	public static String TRANSFERS_URL = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
	//查询订单的URL
	public static String TRANSFERS_URL1 = "https://api.mch.weixin.qq.com/pay/orderquery";
}
