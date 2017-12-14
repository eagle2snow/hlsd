package com.fh.service.hlsd.history.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.history.TRechangeWithdrawalsHistoryManager;
import com.fh.util.PageData;
@SuppressWarnings("all")
@Service("tRechangeWithdrawalsHistoryService")
public class TRechangeWithdrawalsHistoryService implements TRechangeWithdrawalsHistoryManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/* (non-Javadoc)
	 * <p>Title: saveHistory</p>
	 * <p>Description: 保存流水记录</p>
	 * @param history
	 * @throws Exception
	 * @see com.fh.service.hlsd.history.TRechangeWithdrawalsHistoryManager#saveHistory(com.fh.util.PageData)
	 */
	@Override
	public void saveHistory(PageData history) throws Exception {
		
		dao.save("WithdrawalsHistoryMapper.insertSelective", history);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("WithdrawalsHistoryMapper.insertSelective", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("WithdrawalsHistoryMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("WithdrawalsHistoryMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("WithdrawalsHistoryMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("WithdrawalsHistoryMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("WithdrawalsHistoryMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("WithdrawalsHistoryMapper.deleteAll", ArrayDATA_IDS);
	}

	/**分页查询用户统计数据
	 * @param page
	 * @throws Exception
	 */
	@Override
	public List<PageData> datalistPageUserMoney(Page page) throws Exception {
		return (List<PageData>)dao.findForList("WithdrawalsHistoryMapper.datalistPageUserMoney", page);
	}
	

}
