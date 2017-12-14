package com.fh.service.openplat.balanceaccount.impl;

import java.util.List;
import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.openplat.balanceaccount.BalanceAccountManager;

/** 
 * 说明： 账号信息管理
 * 创建人：Administrator
 * 创建时间：2017-06-20
 * @version
 */
@Service("balanceaccountService")
public class BalanceAccountService implements BalanceAccountManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BalanceAccountMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BalanceAccountMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BalanceAccountMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BalanceAccountMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BalanceAccountMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BalanceAccountMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BalanceAccountMapper.deleteAll", ArrayDATA_IDS);
	}

	/**更新充值金额
	 * @param pd
	 * @throws Exception
	 */
	public Object updateBalance(PageData pd) throws Exception {
		return dao.update("BalanceAccountMapper.updateBalance", pd);
	}

	/**通过手机号获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByMobileNo(PageData pd) throws Exception {
		return (PageData)dao.findForObject("BalanceAccountMapper.findByMobileNo", pd);
	}

	/**通过登录的用户ID获取数据
	 * @param mobieNo
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> findByUserId(String userId) throws Exception {
		return (List<PageData>)dao.findForList("BalanceAccountMapper.findByUserId", userId);
	}
	
}

