package com.fh.service.hlsd.pricing.rule.tminPrice.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fh.entity.Page;
import com.fh.service.hlsd.pricing.rule.tminPrice.TMinPriceManager;
import com.fh.util.PageData;

/**
 * @ClassName: TMinPriceService
 * @Description: 起步价的业务成
 * @author JDW
 * @date 2017年9月6日 上午10:37:44
 * @version
 */
@SuppressWarnings("all")
@Service(value = "tMinPriceService")
public class TMinPriceService implements TMinPriceManager {

	/**
	 * 分页查询起步价
	 * */
	@Override
	public List<PageData> list(Page page) throws Exception {
		return null;
	}

}
