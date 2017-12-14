package com.fh.service.openplat.coupon;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 优惠券管理
 * 创建人：Administrator
 * 创建时间：2017-07-12
 * @version
 */
public interface CouponManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	
	/**通过id获取数据
	 * @param xh
	 * @throws Exception
	 */
	public PageData findById(String xh)throws Exception;
	
	/**通过userId获取数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findByUserId(PageData pd)throws Exception;
	
	
	/**通过id 更新优惠券为已使用
	 * @param xh
	 * @throws Exception
	 */
	public void updateCoupon(String couponXh)throws Exception;
	
	
}
