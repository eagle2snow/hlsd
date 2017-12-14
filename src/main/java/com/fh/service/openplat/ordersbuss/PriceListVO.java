/**
 * Title: 价格查询需要使用到的实体list集合
 * fileName: PriceListVO.java
 * @author zhangWenChao 张文超
 * @Created on 2017年7月5日 上午10:17:29
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.service.openplat.ordersbuss;

import java.io.Serializable;
import java.util.List;

public class PriceListVO implements Serializable {

	private static final long serialVersionUID = 7794141618335064528L;
	
	private List<PriceVO> priceList;

	public List<PriceVO> getPriceList() {
		return priceList;
	}

	public void setPriceList(List<PriceVO> priceList) {
		this.priceList = priceList;
	}
	
}
