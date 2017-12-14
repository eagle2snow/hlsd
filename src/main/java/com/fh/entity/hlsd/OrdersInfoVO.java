/**
 * Title: 主订单表信息实体 (t_hlsd_orders_info)
 * fileName: OrdersInfo.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月28日 下午4:00:43
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.entity.hlsd;

import java.io.Serializable;
import java.util.Date;

public class OrdersInfoVO implements Serializable {

	private static final long serialVersionUID = 6763318666903460081L;
	
	private String xh; //序号
	
	private String orderId; //订单号
	
	private String appid; //认证的appid，只针对开放平台使用，其他系统可不用此字段判断 (不保存数据库)
	
	private String validToken; //认证token，只针对开放平台使用，其他系统可不用此字段判断 (不保存数据库)
	
	private String oldOrderId; //旧订单号,用户判断重复提交或更改订单状态 (不保存数据库)
	
	private String md5Key; //用户内部系统之间请求接口的判断 (不保存数据库)
	
	private String userId; //下单用户
	
	private String orderAppxh; //下单应用序号(t_op_app),开发平台里面会用到
	
	private Date orderTime; //下单时间
	
	private String senderName;//发货人姓名
	
	private String senderPhone;//发货人电话
	
	private String sendProvance;//发货省
	
	private String sendCity;//发货市
	
	private String sendArea;//发货区县
	
	private String sendDetailAddress;//发货详细地址
	
	private String driverId; //承运司机编号
	
	private String isShareBill; //是否拼单
	
	private String pickUp; //是否上门取货
	
	private float serviceCharge; //服务费
	
	private String expressType; //速运类型 (1小汽车  2骑手 )
	
	private String orderType; //订单类型(1实时订单 1预约订单)
	
	private String orderCityType; //订单城市类型(1同城  2跨城)
	
	private String appointmentTime; //预约时间
	
	// 0:已取消,1:订单已提交,2:司机已接单,3:司机到达发货地点,4用户确认发货,5:司机确认收货,(目前4、5为同一个状态5，确认支付并付款)
	// 6进行中,7:到达收货地点,8:已签收,9:已评价,10:到付,11:订单过期,
	//12:司机端删除--为了给司机看不到，13:用户端删除--为了给用户自己看不到
	private int status; //订单状态
	
	private String lng; //发货位置经度
	
	private String lat; //发货位置纬度
	
	private int startPrice; //起步价
	
	private float orderPrice; //订单总价
	
	private float orderMileage; //订单总里程
	
	private float awardAmount;//打赏金额
	
	private float preferentialAmount;//优惠金额
	
	private String preferentialType;//优惠方式
	
	private String payType; //支付方式
	
	private String payStatus; //支付状态(0未支付  1已支付)
	
	private String transaction_id; //第三方支付交易订单号(支付宝、微信的交易订单号)
	
	private String donationType; //寄付到付
	
	private Date createTime; //创建时间
	
	private String createUser; //创建人
	
	private Date updateTime; //修改时间
	
	private String updateUser; //修改人

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getOrderId() {
		return orderId;
	}
	
	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getValidToken() {
		return validToken;
	}

	public void setValidToken(String validToken) {
		this.validToken = validToken;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getOldOrderId() {
		return oldOrderId;
	}

	public void setOldOrderId(String oldOrderId) {
		this.oldOrderId = oldOrderId;
	}
	
	public String getMd5Key() {
		return md5Key;
	}

	public void setMd5Key(String md5Key) {
		this.md5Key = md5Key;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOrderAppxh() {
		return orderAppxh;
	}

	public void setOrderAppxh(String orderAppxh) {
		this.orderAppxh = orderAppxh;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	
	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderPhone() {
		return senderPhone;
	}

	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}

	public String getSendProvance() {
		return sendProvance;
	}

	public void setSendProvance(String sendProvance) {
		this.sendProvance = sendProvance;
	}

	public String getSendCity() {
		return sendCity;
	}

	public void setSendCity(String sendCity) {
		this.sendCity = sendCity;
	}

	public String getSendArea() {
		return sendArea;
	}

	public void setSendArea(String sendArea) {
		this.sendArea = sendArea;
	}

	public String getSendDetailAddress() {
		return sendDetailAddress;
	}

	public void setSendDetailAddress(String sendDetailAddress) {
		this.sendDetailAddress = sendDetailAddress;
	}

	public String getDriverId() {
		return driverId;
	}

	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}

	public String getIsShareBill() {
		return isShareBill;
	}

	public void setIsShareBill(String isShareBill) {
		this.isShareBill = isShareBill;
	}

	public String getPickUp() {
		return pickUp;
	}

	public void setPickUp(String pickUp) {
		this.pickUp = pickUp;
	}
	
	public float getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(float serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public String getExpressType() {
		return expressType;
	}

	public void setExpressType(String expressType) {
		this.expressType = expressType;
	}
	
	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	
	public String getOrderCityType() {
		return orderCityType;
	}

	public void setOrderCityType(String orderCityType) {
		this.orderCityType = orderCityType;
	}

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public int getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}

	public float getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(float orderPrice) {
		this.orderPrice = orderPrice;
	}

	public float getOrderMileage() {
		return orderMileage;
	}

	public void setOrderMileage(float orderMileage) {
		this.orderMileage = orderMileage;
	}
	
	public float getAwardAmount() {
		return awardAmount;
	}

	public void setAwardAmount(float awardAmount) {
		this.awardAmount = awardAmount;
	}

	public float getPreferentialAmount() {
		return preferentialAmount;
	}

	public void setPreferentialAmount(float preferentialAmount) {
		this.preferentialAmount = preferentialAmount;
	}

	public String getPreferentialType() {
		return preferentialType;
	}

	public void setPreferentialType(String preferentialType) {
		this.preferentialType = preferentialType;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getTransaction_id() {
		return transaction_id;
	}

	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}

	public String getDonationType() {
		return donationType;
	}

	public void setDonationType(String donationType) {
		this.donationType = donationType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	
}
