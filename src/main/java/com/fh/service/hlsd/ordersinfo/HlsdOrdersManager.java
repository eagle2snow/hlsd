package com.fh.service.hlsd.ordersinfo;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：订单模块管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:53
 * @version
 */
public interface HlsdOrdersManager{

	/**订单分页列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**订单列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	
	/**骑手分页列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> horseListPage(Page page)throws Exception;
	
	
	/**通过用户id和时间查询用户的订单金额和数量
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrderCount(PageData pd)throws Exception;
	
	/**修改用户余额
	 * @param pd
	 * @throws Exception
	 */
	public void editUserMoney(PageData pd)throws Exception;
	
	/**保存结算记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveTransactionHistory(PageData pd)throws Exception;
	
	
	/**查询今天的订单量和金额
	 * @param pd
	 * @throws Exception
	 */
	
	public List<PageData> findTodayOrder()throws Exception;
	
	/**查询昨天的订单量和金额
	 * @param pd
	 * @throws Exception
	 */
	
	public List<PageData> findTomorrowOrder()throws Exception;
	
	/**查询历史以来所有订单量和金额
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> findAllOrder()throws Exception;
	
	
}

