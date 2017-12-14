package com.fh.service.hlsd.expressorderprice.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.hlsd.expressorderprice.ExpressOrderPriceManager;

/** 
 * 说明：里程费模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-14 11:53
 * @version
 */
@SuppressWarnings("all")
@Service("expressorderpriceService")
public class ExpressOrderPriceService implements ExpressOrderPriceManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public Integer save(PageData pd)throws Exception{
		return (Integer) dao.save("ExpressOrderPriceMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ExpressOrderPriceMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ExpressOrderPriceMapper.edit", pd);
	}
	
	/**分页查询里程计价规则信息
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ExpressOrderPriceMapper.datalistPage", page);
	}
	
	/**查询所有的里程计价规则信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExpressOrderPriceMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ExpressOrderPriceMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ExpressOrderPriceMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public PageData getPriceById(Integer ID) throws Exception {
		return (PageData) dao.findForObject("ExpressOrderPriceMapper.getPriceById", ID);
	}
	
}

