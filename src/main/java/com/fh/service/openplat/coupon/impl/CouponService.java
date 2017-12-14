package com.fh.service.openplat.coupon.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.service.openplat.coupon.CouponManager;
import com.fh.util.PageData;

/** 
 * 说明： 我的应用管理
 * 创建人：Administrator
 * 创建时间：2017-06-19
 * @version
 */
@Service("couponService")
public class CouponService implements CouponManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CouponMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CouponMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CouponMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CouponMapper.datalistPage", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(String xh)throws Exception{
		return (PageData)dao.findForObject("CouponMapper.findById", xh);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<PageData> findByUserId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CouponMapper.findByUserId", pd);
	}

	/**
	 * 更新优惠券为已使用
	 */
	public void updateCoupon(String couponXh) throws Exception {
		dao.update("CouponMapper.updateCoupon", couponXh);
	}
	
}

