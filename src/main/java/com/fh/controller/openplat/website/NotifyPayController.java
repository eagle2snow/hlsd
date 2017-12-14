/**
 * Title: 扫描支付回调的接口，给微信那边回调使用的
 * fileName: ScanPayController.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月21日 下午3:37:15
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.controller.openplat.website;

import java.io.BufferedOutputStream;
import java.util.SortedMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fh.controller.base.BaseController;
import com.fh.controller.weixin.pay.util.PayCommonUtil;
import com.fh.controller.weixin.pay.util.PayConfigUtil;
import com.fh.service.openplat.ordersinfo.OrdersInfoManager;
import com.fh.service.openplat.website.OrderToHlsdService;

@Controller
@RequestMapping(value = "/weixin")
public class NotifyPayController extends BaseController {
	
	@Resource(name="ordersinfoService")
	private OrdersInfoManager ordersinfoService;

	@RequestMapping(value = "/ScanPayNotifyByWebSite")
	public void Notify(HttpServletResponse response) throws Exception {
		SortedMap<Object, Object> packageParams = PayCommonUtil.surePaysetting(this.getRequest());
		// 账号信息
		String key = PayConfigUtil.API_KEY; // key
		// 判断签名是否正确
		if (PayCommonUtil.isTenpaySign("UTF-8", packageParams, key)) {
			// ------------------------------
			// 处理业务开始
			// ------------------------------
			String resXml = "";
			if ("SUCCESS".equals((String) packageParams.get("result_code"))) {
				// 这里是支付成功
				/*String mch_id = (String) packageParams.get("mch_id");
				String open_id = (String) packageParams.get("openid");
				String is_subscribe = (String) packageParams.get("is_subscribe");*/
				
				//String out_trade_no = (String)packageParams.get("out_trade_no"); //我们的订单号 
	            String wx_order_no = (String)packageParams.get("transaction_id"); //微信交易订单号
				//String total_fee = (String) packageParams.get("total_fee");//实际支付的总金额
				String orderId = (String) packageParams.get("attach");//主表的序号，更新充值金额用

				////// 执行自己的业务逻辑，更新充值金额，并且新增流水账单到数据库表里面///////
				//float payMoney = Float.parseFloat(total_fee)/100;// 分转成元
				logger.info("更新支付状态为已支付===>"+orderId);
				ordersinfoService.updateOrderPayStatus(orderId, "微信", "1",wx_order_no);
				//调用互联速递确定支付的状态
				OrderToHlsdService.sureSendGoods(orderId);
				logger.info("支付成功");
				resXml = "<xml><return_code><![CDATA[SUCCESS]]></return_code>"
						+ "<return_msg><![CDATA[OK]]></return_msg></xml> ";
			} else {
				logger.info("支付失败,错误信息：" + packageParams.get("err_code"));
				resXml = "<xml><return_code><![CDATA[FAIL]]></return_code>"
						+ "<return_msg><![CDATA[报文为空]]></return_msg></xml> ";
			}
			// ------------------------------
			// 处理业务完毕
			// 通知微信.异步确认成功.必写.不然会一直通知后台.八次之后就认为交易失败了.
			// ------------------------------
			BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
			out.write(resXml.getBytes());
			out.flush();
			out.close();
		}
	}
	
}
