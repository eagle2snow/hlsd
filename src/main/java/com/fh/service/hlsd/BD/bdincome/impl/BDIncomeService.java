package com.fh.service.hlsd.BD.bdincome.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.BD.bdincome.BDIncomeManager;
import com.fh.util.PageData;

/** 
 * 说明：BD收入模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-21 11:04
 * @version
 */
@SuppressWarnings("all")
@Service("bdincomeService")
public class BDIncomeService implements BDIncomeManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BDIncomeMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BDIncomeMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("BDIncomeMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BDIncomeMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BDIncomeMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BDIncomeMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BDIncomeMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> getBDIncomeByBDUserId(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("BDIncomeMapper.getBDIncomeByBDUserId", param);
	}

	@Override
	public List<PageData> getBDIncomeByBDUserIdAndUserId(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("BDIncomeMapper.getBDIncomeByBDUserIdAndUserId", param);
	}
	@Override
	public List<PageData> getBDIncomeIdByBDUserId(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("BDIncomeMapper.getBDIncomeIdByBDUserId", param);
	}

	@Override
	public PageData getBDIncomeAllMoney(PageData param) throws Exception {
		return (PageData) dao.findForObject("BDIncomeMapper.getBDIncomeAllMoney", param);
	}

	@Override
	public void deleteAll(List<PageData> param) throws Exception {
		dao.delete("BDIncomeMapper.deleteAllByCondition", param);
	}

	@Override
	public PageData getIncomeCount(PageData selectParam) throws Exception {
		return (PageData) dao.findForObject("BDIncomeMapper.getIncomeCount", selectParam);
	}
	
	
	
}

