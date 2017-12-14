package com.fh.service.hlsd.pricing.rule.tminPrice;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

@SuppressWarnings("all")
public interface TMinPriceManager {

	/**
	 * @Title: list
	 * @Description: 分页查询起步价
	 * @param @param page
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	List<PageData> list(Page page) throws Exception;

}
