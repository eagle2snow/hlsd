/**
 * Title: 订单步骤信息详情表实体类 (t_hlsd_orders_steps)
 * fileName: OrdersStepsVO.java
 * @author zhangWenChao 张文超
 * @Created on 2017年7月03日 下午14:05:22
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.entity.hlsd;

import java.io.Serializable;
import java.util.Date;

public class OrdersStepsVO implements Serializable {

	private static final long serialVersionUID = -8655671304713591993L;

	private String xh; //序号
	
	private String orderId; //订单号
	
	private String stepName; //步骤名称
	
	private String stepDescribe; //步骤描述
	
	private String orderStatusCode;//订单状态码
	
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

	public String getStepName() {
		return stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	public String getStepDescribe() {
		return stepDescribe;
	}

	public void setStepDescribe(String stepDescribe) {
		this.stepDescribe = stepDescribe;
	}

	public String getOrderStatusCode() {
		return orderStatusCode;
	}

	public void setOrderStatusCode(String orderStatusCode) {
		this.orderStatusCode = orderStatusCode;
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
