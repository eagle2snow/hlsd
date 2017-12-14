/**
 * Title: 订单详细信息List实体集合
 * fileName: OrderDetailListVO.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月29日 下午5:44:39
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.entity.hlsd;

import java.io.Serializable;
import java.util.List;

public class OrderDetailListVO implements Serializable {

	private static final long serialVersionUID = -609911183921529697L;
	
	private List<OrdersDetailVO> orderDetailList;

	public List<OrdersDetailVO> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrdersDetailVO> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	
}
