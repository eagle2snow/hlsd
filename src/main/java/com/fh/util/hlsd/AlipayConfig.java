package com.fh.util.hlsd;

import com.fh.util.Tools;

public class AlipayConfig {
	// 商户PID
	//public static final String PARTNER = "2088701864485034";
	public static final String PARTNER = Tools.getProperty("PARTNER", "");
		// 商户收款账号
		//public static final String SELLER = "68503819@qq.com";
	public static final String SELLER = Tools.getProperty("SELLER", "");
		// 商户私钥，pkcs8格式
		public static final String RSA_PRIVATE = Tools.getProperty("RSA_PRIVATE", "");
		// 支付宝公钥
		//public static final String RSA_PUBLIC = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC719/fuiARUy3XDzfF16NymvG95GLEYfKVEhYY2kuOJyqb1qXffy7wTG90F6uabp1YNCOTuJm5sbAvlC0KzfFMJjXzpvAf8uY9bQ8KXDj5TO1TF40TpyOgwH8gjsyPkOFFficECKAnBwab4ipXscfnro4+/XeuE1WeE+oQJ9gUhwIDAQAB";
		public static final String RSA_PUBLIC = Tools.getProperty("RSA_PUBLIC", "");
		// 服务器异步通知页面路径
		public static final String notify_url = Tools.getProperty("NOTIFY_URL", "");
		//public static final String notify_url = "http://120.77.249.211:8080/steedFramework4web/alipay/wapPay/notify_url.act";
		public static String getOrderInfo(String subject, String body, String price,String orderid) {

			// 签约合作者身份ID
			String orderInfo = "partner=" + "\"" + PARTNER + "\"";

			// 签约卖家支付宝账号
			orderInfo += "&seller_id=" + "\"" + SELLER + "\"";  

			// 商户网站唯一订单号
			orderInfo += "&out_trade_no=" + "\"" + orderid + "\"";

			// 商品名称
			orderInfo += "&subject=" + "\"" + subject + "\"";

			// 商品详情
			orderInfo += "&body=" + "\"" + body + "\"";

			// 商品金额
			orderInfo += "&total_fee=" + "\"" + price + "\"";

			// 服务器异步通知页面路径
			//orderInfo += "&notify_url=" + "\"" + "http://notify.msp.hk/notify.htm" + "\"";
			orderInfo += "&notify_url=" + "\"" + notify_url + "\"";

			// 服务接口名称， 固定值
			orderInfo += "&service=\"mobile.securitypay.pay\"";

			// 支付类型， 固定值
			orderInfo += "&payment_type=\"1\"";

			// 参数编码， 固定值
			orderInfo += "&_input_charset=\"utf-8\"";

			// 设置未付款交易的超时时间
			// 默认30分钟，一旦超时，该笔交易就会自动被关闭。
			// 取值范围：1m～15d。
			// m-分钟，h-小时，d-天，1c-当天（无论交易何时创建，都在0点关闭）。
			// 该参数数值不接受小数点，如1.5h，可转换为90m。
			orderInfo += "&it_b_pay=\"30m\"";

			// extern_token为经过快登授权获取到的alipay_open_id,带上此参数用户将使用授权的账户进行支付
			// orderInfo += "&extern_token=" + "\"" + extern_token + "\"";

			// 支付宝处理完请求后，当前页面跳转到商户指定页面的路径，可空
			orderInfo += "&return_url=\"m.alipay.com\"";

			return orderInfo;
		}
		public static String getOrderInfo(String orderid, String format) {
			
			// 签约合作者身份ID
			String orderInfo = "app_id=" + "\"" + PARTNER + "\"";
			
			// 签约卖家支付宝账号
			//orderInfo += "&seller_id=" + "\"" + SELLER + "\"";  
			
			// 商品名称
			orderInfo += "&timestamp=" + "\"" + format + "\"";
			
			// 服务接口名称， 固定值
			orderInfo += "&method=\"alipay.trade.query\"";
			
			// 支付类型， 固定值
			orderInfo += "&version=\"1.0\"";
			
			// 参数编码， 固定值
			orderInfo += "&charset=\"utf-8\"";
			
			// 设置未付款交易的超时时间
			// 默认30分钟，一旦超时，该笔交易就会自动被关闭。
			// 取值范围：1m～15d。
			// m-分钟，h-小时，d-天，1c-当天（无论交易何时创建，都在0点关闭）。
			// 该参数数值不接受小数点，如1.5h，可转换为90m。
			//orderInfo += "&it_b_pay=\"30m\"";
			
			// extern_token为经过快登授权获取到的alipay_open_id,带上此参数用户将使用授权的账户进行支付
			// orderInfo += "&extern_token=" + "\"" + extern_token + "\"";
			
			// 支付宝处理完请求后，当前页面跳转到商户指定页面的路径，可空
			orderInfo += "&biz_content={\"out_trade_no\":" +"\""+ orderid + "\"}";
			
			return orderInfo;
		}
		public static String sign(String content) {
			return SignUtils.sign(content, RSA_PRIVATE);
		}
}