package com.fh.controller.weixin.pay;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.fh.controller.weixin.pay.util.PayCommonUtil;
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.service.openplat.ordersinfo.OrdersInfoManager;
import com.fh.service.openplat.ordersinfo.impl.OrdersInfoService;
import com.fh.util.DateUtil;
import com.fh.util.Tools;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
/**
 * 生成扫描支付二维码的功能<br/>
 * 该功能用于互联速递网站系统二维码支付
 * @author zhangwenchao
 * @createTime 2017-06-21 14:58
 *
 */
@WebServlet("/weixin/generateQRcode")
public class ScanPay extends HttpServlet {
	private static final long serialVersionUID = -1216297896522291144L;
	private static Logger logger = Logger.getLogger(ScanPay.class);
	//查询订单价格使用
	private static OrdersInfoManager ordersService = (OrdersInfoService) Tools.getSpringBean(OrdersInfoService.class);

	public ScanPay() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String orderId = request.getParameter("orderId");
			OrdersInfoVO ordersInfo = ordersService.findByOrderId(orderId);
			float order_price = ordersInfo.getOrderPrice(); //获取价格
			//用户后面微信返回获取微信附加数据更新充值金额
			OutputStream out = response.getOutputStream();
			//判断和开始跳转过来的支付的手机号是不是一致
			if(order_price>0){
				//订单号，年月日时分秒毫秒再加上6位随机数，这个充值这里只是为了微信那边区分唯一，并无实际意义
				String out_trade_no = DateUtil.formatDate(new Date(), "yyyyMMddHHmmssSSS")+(int)((Math.random()*9+1)*100000);
				int money = (int)(order_price * 100);//微信支付是以分为单位的，所以要乘以100
				String inv = Tools.getProperty("devMode", "true");
				if("true".equals(inv)){//如果为开发测试环境，支付设置为1分钱
					money = 1;
				}
				BitMatrix bitMatrix = PayCommonUtil.preScanPaySetings(String.valueOf(money), "互联速递下单支付", out_trade_no,orderId);
				MatrixToImageWriter.writeToStream(bitMatrix, "png", out);// 输出二维码
				out.flush();
				out.close();
			}else{
				logger.error("生成充值二维码错误,订单已过期 !");
				out.write(0);
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("生成充值二维码错误, "+e.getLocalizedMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
