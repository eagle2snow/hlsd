/**
 * Title: 价格计算的实体类，用于方法里面传递参数
 * fileName: PriceVO.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月28日 下午3:13:11
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.service.openplat.ordersbuss;

import java.io.Serializable;

public class PriceVO implements Serializable {

	private static final long serialVersionUID = 9205657033083613197L;
	
	private String goodsName; //物品名称
	
	private String from_lng;//起点A经度
	
	private String from_lat;//起点A纬度
	
	private String to_lng; //终点A经度
	
	private String to_lat; //终点A纬度
	
	private int goodsVolume;//货物1体积(1小、2中、3大)
	
	private int weight; //货物1重量(1-0到20kg、2-20到50kg、3-50kg以上)
	
	private String expressType; //速运类型 1小汽车, 2骑手
	
	private String pickUp; //6公里内骑手默认上门取货并且不收费
	
	private String appointmentTime; //预约时间
	

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getFrom_lng() {
		return from_lng;
	}

	public void setFrom_lng(String from_lng) {
		this.from_lng = from_lng;
	}

	public String getFrom_lat() {
		return from_lat;
	}

	public void setFrom_lat(String from_lat) {
		this.from_lat = from_lat;
	}

	public String getTo_lng() {
		return to_lng;
	}

	public void setTo_lng(String to_lng) {
		this.to_lng = to_lng;
	}

	public String getTo_lat() {
		return to_lat;
	}

	public void setTo_lat(String to_lat) {
		this.to_lat = to_lat;
	}

	public int getGoodsVolume() {
		return goodsVolume;
	}

	public void setGoodsVolume(int goodsVolume) {
		this.goodsVolume = goodsVolume;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getExpressType() {
		return expressType;
	}

	public void setExpressType(String expressType) {
		this.expressType = expressType;
	}

	public String getPickUp() {
		return pickUp;
	}

	public void setPickUp(String pickUp) {
		this.pickUp = pickUp;
	}

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}
	
}
