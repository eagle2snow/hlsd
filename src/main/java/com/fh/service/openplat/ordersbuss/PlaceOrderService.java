/**
 * Title: 用户下单业务处理类
 * fileName: PlaceOrder.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月28日 下午5:40:39
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.service.openplat.ordersbuss;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.fh.controller.openplat.openapi.authen.Contants;
import com.fh.entity.hlsd.OrderDetailListVO;
import com.fh.entity.hlsd.OrdersDetailVO;
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.openplat.OrderUtils;
import com.fh.service.openplat.coupon.CouponManager;
import com.fh.service.openplat.ordersdetail.OrdersDetailManager;
import com.fh.service.openplat.ordersinfo.OrdersInfoManager;
import com.fh.service.openplat.ordersteps.OrderStepsManager;
import com.fh.service.openplat.website.OrderToHlsdService;
import com.fh.util.Constants;
import com.fh.util.Logger;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;

import net.sf.json.JSONObject;

@Service("placeOrderService")
public class PlaceOrderService {
	
	protected Logger logger = Logger.getLogger(PlaceOrderService.class);
	
	@Resource(name="ordersinfoService")
	private OrdersInfoManager ordersinfoService;
	
	@Resource(name="ordersdetailService")
	private OrdersDetailManager ordersdetailService;
	
	@Resource(name="orderStepsService")
	private OrderStepsManager orderStepsService;
	
	//优惠券
	@Resource(name="couponService")
	private CouponManager couponService;
	
	/**
	 * 用户下单(一车一单、一车多单都是调用这个方法)
	 * @param orderInfo        主订单
	 * @param ordersDetailList 子订单集合
	 * @param map couponXh:优惠价id  userXh:用户表主键
	 * @return JSONObject (包括3个参数 result--true或false, orderId--如果result为true才有orderId, msg--返回的消息)
	 * @throws Exception 
	 */
	public JSONObject createOrder(OrdersInfoVO orderInfo,OrderDetailListVO orderDetailList,Map<String,String> map) throws Exception{
		JSONObject result = new JSONObject();
		try {
			//第一步 判断是否重复提交
			String oldOrderId = orderInfo.getOldOrderId();
			OrdersInfoVO infoVO = ordersinfoService.findByOrderId(oldOrderId);
			if(infoVO!=null && infoVO.getStatus()==0){//如果为0已取消状态，就更新为 1已提交 状态，表示重新发布
				//状态修改为已提交就行了
				ordersinfoService.updateOrderStatus(oldOrderId, 1);
				result.put("result", true);
				result.put(Constants.RESP_MSG, "订单重新提交成功");
				result.put("orderId", oldOrderId);
			}else if(infoVO!=null && infoVO.getStatus()==1){//判断不重复提交
				result.put("result", false);
				result.put(Constants.RESP_MSG, "订单已经提交，无需重复提交");
			}else{
				//设置主订单的一些默认值和计算值
				orderInfo = packageOrdersInfo(orderInfo,orderDetailList);
				//第1步：保存主订单
				ordersinfoService.save(orderInfo);
				//第2步：循环保存子订单
				for (OrdersDetailVO vo: orderDetailList.getOrderDetailList()) {
					//设置子订单的一些默认值
					vo = packageOrdersDetail(vo, orderInfo.getOrderId(), orderInfo.getUserId());
					ordersdetailService.save(vo);
				}
				
				//第3步：保存订单步骤信息表
				OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderInfo.getOrderId(), "1", "订单已提交", "用户提交了订单", orderInfo.getUserId());
				orderStepsService.save(stepsVo);
				
				//第4步：更新优惠券的状态为已使用
				if(null!=map&& !Tools.isEmpty(map.get("couponXh")) && map.get("couponXh").length()!=6){
					couponService.updateCoupon(map.get("couponXh"));
					OrderToHlsdService.updateCoupon(map.get("userXh"));
				}
				result.put("result", true);
				result.put(Constants.RESP_MSG, "订单提交成功");
				result.put("orderId", orderInfo.getOrderId());
				
				//第5步：把订单下到互联速递那边
				boolean isOk = OrderToHlsdService.createOneOrderToHlsd(orderInfo, orderDetailList);
				if(!isOk){
					logger.error("下单到互联速递系统失败!");
					throw new Exception(orderInfo.getOrderId()+"  下单到互联速递系统失败!");
				}
			}
		} catch (Exception e) {
			logger.error(orderInfo.getUserId() +" 下单失败, "+e.getLocalizedMessage());
			result.put("result", false);
			result.put(Constants.RESP_MSG, "订单提交失败,请检查你的参数是否正确");
			//手动回滚，这样上层就无需去处理异常
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();    
		}
		return result;
	}
	
	
	/**
	 * 用户取消订单
	 * @param orderInfo        封装的订单号
	 * @return JSONObject (包括result--true或false,msg--返回的消息)
	 * @throws Exception 
	 */
	public JSONObject cancelOrder(OrdersInfoVO orderInfo) throws Exception{
		JSONObject result = new JSONObject();
		String orderId = orderInfo.getOrderId();
		OrdersInfoVO orderVO = ordersinfoService.findByOrderId(orderId);
		if(orderVO.getStatus()==1){
			ordersinfoService.updateOrderStatus(orderId, 0);//0表示取消订单
			result.put("result", true);
			result.put(Constants.RESP_MSG, "取消成功");
			OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderId, "0", "订单已取消", "用户取消了订单", orderInfo.getUserId());
			orderStepsService.save(stepsVo);
		}else{
			result.put("result", false);
			result.put(Constants.RESP_MSG, "当前订单状态不允许取消");
		}
		return result;
	}
	
	/**
	 * 更新订单状态
	 * @param orderInfo
	 * @return
	 * @throws Exception
	 */
	public JSONObject updateOrderStatu(OrdersInfoVO orderInfo,OrdersStepsVO stepsVO) throws Exception{
		JSONObject result = new JSONObject();
		try {
			//第一步：更新主订单状态
			ordersinfoService.updateOrderStatus(orderInfo.getOrderId(), Integer.parseInt(stepsVO.getOrderStatusCode()));
			//第二步：更新订单步骤表
			OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderInfo.getOrderId(), stepsVO.getOrderStatusCode(), 
									stepsVO.getStepName(), stepsVO.getStepDescribe(), orderInfo.getUserId());
			orderStepsService.save(stepsVo);
			result.put("result", true);
			result.put(Constants.RESP_MSG, "状态更新成功");
		} catch (Exception e) {
			logger.error("订单状态更新失败, "+e.getLocalizedMessage());
			result.put("result", false);
			result.put(Constants.RESP_MSG, "订单状态更新失败");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 更新订单支付状态
	 * @param orderInfo
	 * @return
	 * @throws Exception
	 */
	public JSONObject updateOrderPayStatu(OrdersInfoVO orderInfo) throws Exception{
		JSONObject result = new JSONObject();
		try {
			//第一步：更新主订单支付状态
			ordersinfoService.updateOrderPayStatus(orderInfo.getOrderId(),orderInfo.getPayType(),orderInfo.getPayStatus(),orderInfo.getTransaction_id());
			result.put("result", true);
			result.put(Constants.RESP_MSG, "支付状态更新成功");
		} catch (Exception e) {
			logger.error("订单状态更新失败, "+e.getLocalizedMessage());
			result.put("result", false);
			result.put(Constants.RESP_MSG, "订单状态更新失败");
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 更新订单承运司机(即抢单的时候调用)
	 * @param orderInfo
	 * @return
	 * @throws Exception
	 */
	public JSONObject updateOrderDriver(OrdersInfoVO orderInfo) throws Exception{
		JSONObject result = new JSONObject();
		try {
			//第一步：查询是否已经被人抢了
			OrdersInfoVO infoVO = ordersinfoService.findByOrderIdAndStatu(orderInfo.getOrderId(), String.valueOf(orderInfo.getStatus()));
			if(infoVO!=null){
				result.put("result", false);
				result.put("code", Contants.HASGRABED);
				result.put(Constants.RESP_MSG, "晚了一点点,该订单已被其他司机抢了");
			}else{
				//第二步：更新主订单状态
				ordersinfoService.updateOrderDriver(orderInfo.getOrderId(), orderInfo.getDriverId());
				//第三步：更新订单步骤表
				OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderInfo.getOrderId(), "2", "司机已接单","司机已接单", orderInfo.getUserId());
				orderStepsService.save(stepsVo);
				result.put("result", true);
				result.put(Constants.RESP_MSG, "抢单成功");
			}
		} catch (Exception e) {
			logger.error("抢单异常,请返回重试 "+e.getLocalizedMessage());
			result.put("result", false);
			result.put(Constants.RESP_MSG, "抢单异常,请返回重试");
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 更新订单状态
	 * @param orderInfo
	 * @return
	 * @throws Exception
	 */
	public JSONObject sureSendGoods(OrdersInfoVO orderInfo,OrdersStepsVO stepsVO) throws Exception{
		JSONObject result = new JSONObject();
		try {
			//第一步：更新主订单状态
			ordersinfoService.updateOrderStatus(orderInfo.getOrderId(), Integer.parseInt(stepsVO.getOrderStatusCode()));
			//第二步：更新订单步骤表
			OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderInfo.getOrderId(), stepsVO.getOrderStatusCode(), 
									stepsVO.getStepName(), stepsVO.getStepDescribe(), orderInfo.getUserId());
			orderStepsService.save(stepsVo);
			//第三步：更新调用互联速递接口
			boolean isOk = OrderToHlsdService.sureSendGoodsToHlsd(orderInfo.getOrderId(),orderInfo.getUserId());
			if(!isOk){
				logger.error("确认发货到互联速递系统失败!");
				throw new Exception(orderInfo.getOrderId()+"  确认发货到互联速递系统失败!");
			}
			result.put("result", true);
			result.put(Constants.RESP_MSG, "状态更新成功");
		} catch (Exception e) {
			logger.error("确认发货失败, "+e.getLocalizedMessage());
			result.put("result", false);
			result.put(Constants.RESP_MSG, "确认发货失败");
			e.printStackTrace();
			//手动回滚，这样上层就无需去处理异常
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();   
		}
		return result;
	}
	
//--------------------------------------------------------以下是封装的一些内部方法--------------------------------------------
	/**
	 * 封装主订单的信息
	 * @param orderInfo
	 * @param date
	 * @return
	 * @throws Exception
	 */
	private OrdersInfoVO packageOrdersInfo(OrdersInfoVO orderInfo,OrderDetailListVO orderDetailList) throws Exception{
		Date date = new Date();
		orderInfo.setXh(UuidUtil.get32UUID());
		orderInfo.setOrderId(OrderUtils.generateOrderId());
		orderInfo.setStatus(1);//创建订单的时候设置为 1已提交 状态
		orderInfo.setPayStatus("0");//未支付
		orderInfo.setOrderTime(date);
		//设置发货省市区
		JSONObject json = OrderUtils.getAddressByJson(orderInfo.getLng()+","+orderInfo.getLat());
		if(json!=null){
			orderInfo.setSendProvance(json.getString("province"));
			orderInfo.setSendCity(json.getString("city"));
			orderInfo.setSendArea(json.getString("township"));
		}
		//计算订单起步价、总价、总里程
		PriceListVO priceList = new PriceListVO();
		String from_lng = "";
		String from_lat = "";
		List<PriceVO> listPrice = new ArrayList<PriceVO>();
		for(int i=0;i<orderDetailList.getOrderDetailList().size();i++){
			OrdersDetailVO vo = orderDetailList.getOrderDetailList().get(i);
			PriceVO pricevo = new PriceVO();
			if(i==0){//如果是第一条数据，就多设置 是否上面取货pickUp 速运类型expressType 预约时间appointmentTime
				pricevo.setAppointmentTime(orderInfo.getAppointmentTime());
				pricevo.setPickUp(orderInfo.getPickUp());
				pricevo.setExpressType(orderInfo.getExpressType());
				//如果是第一单开始就是默认发货位置的经纬度
				from_lng = orderInfo.getLng();
				from_lat = orderInfo.getLat();
			}
			pricevo.setFrom_lng(from_lng);
			pricevo.setFrom_lat(from_lat);
			pricevo.setTo_lng(vo.getLng());
			pricevo.setTo_lat(vo.getLat());
			pricevo.setGoodsName(vo.getGoodsName());
			pricevo.setGoodsVolume(Integer.parseInt(vo.getGoodsVolume()));
			pricevo.setWeight(Integer.parseInt(vo.getGoodsWeight()));
			//add到集合里面用于计算
			listPrice.add(pricevo);
			
			//为后面单里程段没有开始经度就以上一单的结束的经纬度为开始经纬度
			from_lng = vo.getLng();
			from_lat = vo.getLat();
		}
		priceList.setPriceList(listPrice);
		JSONObject res = OrderPriceService.calcOrderFee(priceList,orderDetailList);
		if(res!=null && "true".equals(res.getString("result"))){
			orderInfo.setStartPrice((int)res.getDouble("startPrice"));
			orderInfo.setOrderPrice((float)res.getDouble("fee") - orderInfo.getPreferentialAmount()); //减去优惠的金额
			orderInfo.setOrderMileage((float)res.getDouble("distance"));
			orderInfo.setServiceCharge((float)res.getDouble("serviceCharge"));
		}
		
		orderInfo.setCreateTime(date);
		orderInfo.setCreateUser(orderInfo.getUserId());
		orderInfo.setUpdateTime(date);
		orderInfo.setUpdateUser(orderInfo.getUserId());
		return orderInfo;
	}
	
	
	/**
	 * 封装子订单的实体
	 * @param vo
	 * @param orderId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	private OrdersDetailVO packageOrdersDetail(OrdersDetailVO vo,String orderId,String userId) throws Exception{
		vo.setXh(UuidUtil.get32UUID());
		vo.setOrderId(orderId);
		JSONObject json = OrderUtils.getAddressByJson(vo.getLng()+","+vo.getLat());
		if(json!=null){
			vo.setConsigneeProvance(json.getString("province"));
			vo.setConsigneeCity(json.getString("city"));
			vo.setConsigneeArea(json.getString("township"));
		}
		Date date = new Date();
		vo.setCreateTime(date);
		vo.setCreateUser(userId);
		vo.setUpdateTime(date);
		vo.setUpdateUser(userId);
		return vo;
	}
}
