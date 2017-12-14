package com.fh.util.alipay.util;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.fh.util.alipay.config.AlipayConfig;

public class AlipayUtils {

public static boolean chickOrderIsAplayPay(String ID) {
		
		String serverUrl = "https://openapi.alipay.com/gateway.do";
		String appId = "2016110402544515";
		String privateKey = AlipayConfig.RSA_PRIVATE;
		String format = "json";
		String charset = "utf-8";
		String alipayPulicKey = AlipayConfig.RSA_PUBLIC;
		AlipayClient alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, alipayPulicKey);
		/*AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipay.com/gateway.do", "2016110402544515",
				AlipayConfig.RSA_PRIVATE, "json", "utf-8", AlipayConfig.RSA_PUBLIC, "RSA");*/
		AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
		request.setBizContent("{" + "    \"out_trade_no\":\"" + ID + "\"" + "  }");
		AlipayTradeQueryResponse response;
		try {
			response = alipayClient.execute(request);
			if (response.isSuccess() && response.getTradeStatus() .equals("TRADE_SUCCESS")) {
				return true;
			} else {
				return false;
			}
		} catch (AlipayApiException e) {
			e.printStackTrace();
			return false ; 
		}
	}
}
