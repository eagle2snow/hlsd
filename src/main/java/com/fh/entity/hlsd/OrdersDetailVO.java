/**
 * Title: 订单详情表实体类 (t_hlsd_orders_detail)
 * fileName: OrdersDetailVO.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月28日 下午4:09:48
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.entity.hlsd;

import java.io.Serializable;
import java.util.Date;

public class OrdersDetailVO implements Serializable {

	private static final long serialVersionUID = 7592957938150100983L;
	
	private String xh; //序号
	
	private String orderId; //订单号
	
	private double mileage;//里程
	
	private double milestonesPayment;//里程费
	
	private double floatingCharge;//浮动费
	
	private double nightFee;//夜间费
	
	private String consigneeName;//收货人姓名
	
	private String consigneePhone;//收货人电话
	
	private String consigneeProvance;//收货省
	
	private String consigneeCity;//收货市
	
	private String consigneeArea;//收货区
	
	private String consigneeDetailAddress;//收货详细地址
	
	private String lng;//收货位置经度
	
	private String lat;//收货位置纬度
	
	private String goodsName;//配送物品信息
	
	private String goodsWeight;//物品重量  重量(1-->0到20kg、2-->20到50kg、3-->50kg以上)
	
	private String goodsVolume;//物品体积 体积 (1代表重量轻，2代表重量中等，3代表重量很重)
	
	private String evaluateContent;//评价内容
	
	private int evaluateStar; //评价星级
	
	private int goodsPicture; //物品照片地址
	
	private int handwrittenSignature; //手写签名图片地址
	
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

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public double getMileage() {
		return mileage;
	}

	public void setMileage(double mileage) {
		this.mileage = mileage;
	}

	public double getMilestonesPayment() {
		return milestonesPayment;
	}

	public void setMilestonesPayment(double milestonesPayment) {
		this.milestonesPayment = milestonesPayment;
	}

	public double getFloatingCharge() {
		return floatingCharge;
	}

	public void setFloatingCharge(double floatingCharge) {
		this.floatingCharge = floatingCharge;
	}

	public double getNightFee() {
		return nightFee;
	}

	public void setNightFee(double nightFee) {
		this.nightFee = nightFee;
	}

	public String getConsigneeName() {
		return consigneeName;
	}

	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}

	public String getConsigneePhone() {
		return consigneePhone;
	}

	public void setConsigneePhone(String consigneePhone) {
		this.consigneePhone = consigneePhone;
	}

	public String getConsigneeProvance() {
		return consigneeProvance;
	}

	public void setConsigneeProvance(String consigneeProvance) {
		this.consigneeProvance = consigneeProvance;
	}

	public String getConsigneeCity() {
		return consigneeCity;
	}

	public void setConsigneeCity(String consigneeCity) {
		this.consigneeCity = consigneeCity;
	}

	public String getConsigneeArea() {
		return consigneeArea;
	}

	public void setConsigneeArea(String consigneeArea) {
		this.consigneeArea = consigneeArea;
	}

	public String getConsigneeDetailAddress() {
		return consigneeDetailAddress;
	}

	public void setConsigneeDetailAddress(String consigneeDetailAddress) {
		this.consigneeDetailAddress = consigneeDetailAddress;
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

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsWeight() {
		return goodsWeight;
	}

	public void setGoodsWeight(String goodsWeight) {
		this.goodsWeight = goodsWeight;
	}

	public String getGoodsVolume() {
		return goodsVolume;
	}

	public void setGoodsVolume(String goodsVolume) {
		this.goodsVolume = goodsVolume;
	}

	public String getEvaluateContent() {
		return evaluateContent;
	}

	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}

	public int getEvaluateStar() {
		return evaluateStar;
	}

	public void setEvaluateStar(int evaluateStar) {
		this.evaluateStar = evaluateStar;
	}

	public int getGoodsPicture() {
		return goodsPicture;
	}

	public void setGoodsPicture(int goodsPicture) {
		this.goodsPicture = goodsPicture;
	}

	public int getHandwrittenSignature() {
		return handwrittenSignature;
	}

	public void setHandwrittenSignature(int handwrittenSignature) {
		this.handwrittenSignature = handwrittenSignature;
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
