package com.fh.service.hlsd.ordersinfo.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.ordersinfo.HlsdOrdersManager;
import com.fh.util.PageData;

/** 
 * 说明：订单模块管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-06-28 17:53
 * @version
 */
@Service("hlsdOrdersService")
public class HlsdOrdersService implements HlsdOrdersManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("HlsdOrdersMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("HlsdOrdersMapper.listAll", pd);
	}
	
	/**骑手列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> horseListPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("HlsdOrdersMapper.datalistPageForHorse", page);
	}

	/**通过用户id和时间查询用户的订单金额和数量
	 * @param pd
	 * @throws Exception
	 */
	public PageData findOrderCount(PageData pd) throws Exception {
		return (PageData)dao.findForObject("HlsdOrdersMapper.findOrderCount", pd);
	}

	public void editUserMoney(PageData pd) throws Exception {
		dao.update("HlsdOrdersMapper.editUserMoney", pd);
	}

	public void saveTransactionHistory(PageData pd) throws Exception {
		dao.save("HlsdOrdersMapper.saveTransactionHistory", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findTodayOrder() throws Exception {
		return (List<PageData>)dao.findForList("HlsdOrdersMapper.findTodayOrder",null);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findTomorrowOrder() throws Exception {
		return (List<PageData>)dao.findForList("HlsdOrdersMapper.findTomorrowOrder",null);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> findAllOrder() throws Exception {
		return (List<PageData>)dao.findForList("HlsdOrdersMapper.findAllOrder",null);
	}
	
}

