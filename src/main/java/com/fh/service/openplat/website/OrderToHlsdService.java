/**
 * Title: 下载订单到互联速递系统里面
 * fileName: OrderToHlsd.java
 * @author zhangWenChao 张文超
 * @Created on 2017年7月12日 下午5:21:40
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.service.openplat.website;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fh.entity.hlsd.OrderDetailListVO;
import com.fh.entity.hlsd.OrdersDetailVO;
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.openplat.OrderUtils;
import com.fh.service.openplat.ordersdetail.OrdersDetailManager;
import com.fh.service.openplat.ordersdetail.impl.OrdersDetailService;
import com.fh.service.openplat.ordersteps.OrderStepsManager;
import com.fh.service.openplat.ordersteps.impl.OrderStepsService;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.express.util.HttpUtil;

import net.sf.json.JSONObject;

public class OrderToHlsdService {
	// 互联速递的接口地址
	private static String url = Tools.getProperty("HLSD_ORDER_URL", "");
	
	private static OrdersDetailManager ordersdetailService = (OrdersDetailService) Tools.getSpringBean(OrdersDetailService.class);
	private static OrderStepsManager orderStepsService = (OrderStepsService) Tools.getSpringBean(OrderStepsService.class);
	
	/**
	 * 下一单和两单
	 * @return
	 */
	public static boolean createOneOrderToHlsd(OrdersInfoVO orderInfo, OrderDetailListVO orderDetailList) {
		String suffix = "/website/createOrder.act"; // 接口后缀
		Map<String, String> params = new HashMap<String, String>();
		params.put("order.userId", orderInfo.getUserId());
		params.put("order.orderId", orderInfo.getOrderId());
		params.put("order.lng", orderInfo.getLng());
		params.put("order.lat", orderInfo.getLat());
		params.put("order.senderAddress", orderInfo.getSendDetailAddress());
		params.put("order.senderName", orderInfo.getSenderName());
		params.put("order.senderMobileNo", orderInfo.getSenderPhone());
		params.put("order.senderProvinceId", orderInfo.getSendProvance());
		params.put("order.senderCityId", orderInfo.getSendCity());
		params.put("order.senderAreaId", orderInfo.getSendArea());
		//params.put("order.sendDetailAddress", orderInfo.getSendDetailAddress());
		params.put("order.isCall", "true".equals(orderInfo.getPickUp()) ? "1" : "0");
		String expressTime = orderInfo.getAppointmentTime();
		if(Tools.isEmpty(expressTime)){
			expressTime = "";
		}
		params.put("expressTime", expressTime);
		params.put("order.driverType", "1".equals(orderInfo.getExpressType()) ? "2" : "5");
		params.put("order.orderType", orderInfo.getOrderCityType());
		params.put("order.allPrice", String.valueOf(orderInfo.getOrderPrice()));
		params.put("order.serviceCharge", String.valueOf(orderInfo.getServiceCharge()));
		params.put("order.startingPrice", String.valueOf(orderInfo.getStartPrice()));
		params.put("order.payType", "寄付".equals(orderInfo.getDonationType()) ? "0" : "1");

		// 第一单
		OrdersDetailVO detailOne = orderDetailList.getOrderDetailList().get(0);
		params.put("order.itemWeight", detailOne.getGoodsWeight());
		params.put("order.goodsVolume", detailOne.getGoodsVolume());
		params.put("order.goodsDescription", detailOne.getGoodsName());
		params.put("order.receiverAddress", detailOne.getConsigneeDetailAddress());
		params.put("order.receiverName", detailOne.getConsigneeName());
		params.put("order.receiverMobileNo", detailOne.getConsigneePhone());
		//params.put("order.receiveDetailAddress", detailOne.getConsigneeDetailAddress());
		params.put("order.endLng", detailOne.getLng());
		params.put("order.endLat", detailOne.getLat());

		params.put("order.startingPrice", String.valueOf(orderInfo.getStartPrice()));
		params.put("order.valueFee", String.valueOf(detailOne.getFloatingCharge()));
		params.put("order.nightChanger", String.valueOf(detailOne.getNightFee()));
		params.put("order.mileageFee", String.valueOf(detailOne.getMilestonesPayment()));
		params.put("order.mileage", String.valueOf(detailOne.getMileage()));
		double firstOrderPrice = detailOne.getFloatingCharge() + detailOne.getNightFee()
				+ detailOne.getMilestonesPayment() + orderInfo.getServiceCharge() + orderInfo.getStartPrice();
		params.put("order.orderPrice", String.valueOf(firstOrderPrice));

		// 第二单
		if (orderDetailList.getOrderDetailList().size() == 2) {
			OrdersDetailVO detailTwo = orderDetailList.getOrderDetailList().get(1);
			params.put("cargo.name", detailTwo.getConsigneeName());
			params.put("cargo.mobileNo", detailTwo.getConsigneePhone());
			params.put("cargo.address", detailTwo.getConsigneeDetailAddress());
			//params.put("cargo.cargoDetailAddress", detailTwo.getConsigneeDetailAddress());
			params.put("cargo.itemWeight", detailTwo.getGoodsWeight());
			params.put("cargo.goodsVolume", detailTwo.getGoodsVolume());
			params.put("cargo.goodsDescription", detailTwo.getGoodsName());
			params.put("cargo.lng", detailTwo.getLng());
			params.put("cargo.lat", detailTwo.getLat());
			params.put("cargo.mileage", String.valueOf(detailTwo.getMileage()));
			params.put("cargo.mileageFee", String.valueOf(detailTwo.getMilestonesPayment()));
			params.put("cargo.nightChanger", String.valueOf(detailTwo.getNightFee()));
			params.put("cargo.valueFee", String.valueOf(detailTwo.getFloatingCharge()));
			double secondOrderPrice = detailTwo.getMilestonesPayment() + detailTwo.getNightFee()
					+ detailTwo.getFloatingCharge();
			params.put("order.orderPrice", String.valueOf(secondOrderPrice));
			params.put("cargo.cargoPrice", String.valueOf(detailTwo.getFloatingCharge()));
			params.put("cargo.serviceCharge", "0");
		}

		String result = "{}";
		if(url.indexOf("https")==0){
			result = HttpUtil.sendPostHttps(url + suffix, params);
		}else{
			result = HttpUtil.sendPost(url + suffix, params);
		}
		JSONObject json = JSONObject.fromObject(result);
		int status = json.getInt("statusCode");
		if (status == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	/**
	 * 用户确认发货
	 * @param orderId  订单号
	 * @param userId   用户手机
	 * @return
	 */
	public static boolean sureSendGoodsToHlsd(String orderId,String userId) {
		String suffix = "/website/sureSendGoods.act?orderId="+orderId+"&mobileNo="+userId; // 接口后缀
		String result = "{}";
		if(url.indexOf("https")==0){
			result = HttpUtil.sendPostHttps(url + suffix, null);
		}else{
			result = HttpUtil.sendPost(url + suffix, null);
		}
		JSONObject json = JSONObject.fromObject(result);
		int status = json.getInt("statusCode");
		if (status == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	/**
	 * 为互联速递那边注册用户信息
	 * @param userId
	 * @param mobileNo
	 * @return
	 */
	public static int regNormalUser(String userId,String mobileNo) {
		String suffix = "/website/regNormalUser.act?tuser.userId="+userId+"&tuser.userMobileNo="+mobileNo; // 接口后缀
		String result = "{}";
		if(url.indexOf("https")==0){
			result = HttpUtil.sendPostHttps(url + suffix, null);
		}else{
			result = HttpUtil.sendPost(url + suffix, null);
		}
		JSONObject json = JSONObject.fromObject(result);
		int status = json.getInt("statusCode");
		if (status == 0) {
			return 0;
		}else if(status == 2){
			return 2;
		} else {
			return 1;
		}
	}
	
	/**
	 * 标注互连速递里面的优惠券为已使用
	 * @param userXh
	 * @return
	 */
	public static int updateCoupon(String userXh) {
		String suffix = "/website/updateCoupon.act?userId="+userXh; // 接口后缀
		String result = "{}";
		if(url.indexOf("https")==0){
			result = HttpUtil.sendPostHttps(url + suffix, null);
		}else{
			result = HttpUtil.sendPost(url + suffix, null);
		}
		JSONObject json = JSONObject.fromObject(result);
		int status = json.getInt("statusCode");
		if (status == 0) {
			return 0;
		}else if(status == 2){
			return 2;
		} else {
			return 1;
		}
	}
	
	
	/**
	 * 确认订单已支付
	 * @param orderId
	 * @return
	 * @throws Exception 
	 */
	public static boolean sureSendGoods(String orderId) throws Exception{
		String isTwoOrder = "0";//是否一车两单 
		List<PageData> list = ordersdetailService.findByOrderId(orderId);
		if(list.size()==2){
			isTwoOrder = "1";
		}
		//先调用自己系统的步骤表
		OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderId, "5", "用户已发货并支付", "用户已发货并支付", "系统调用");
		orderStepsService.save(stepsVo);
		
		String suffix = "/website/sureSendGoods.act?orderId="+orderId+"&isTwoOrder="+isTwoOrder; // 接口后缀
		String result = "{}";
		if(url.indexOf("https")==0){
			result = HttpUtil.sendPostHttps(url + suffix, null);
		}else{
			result = HttpUtil.sendPost(url + suffix, null);
		}
		JSONObject json = JSONObject.fromObject(result);
		int status = json.getInt("statusCode");
		if (status == 0) {
			return true;
		}else{
			return false;
		}
	}
	
}
