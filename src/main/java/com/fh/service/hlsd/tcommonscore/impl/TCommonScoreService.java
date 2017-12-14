package com.fh.service.hlsd.tcommonscore.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.hlsd.tcommonscore.TCommonScoreManager;

/** 
 * 说明：服务分模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-11 18:40
 * @version
 */
@Service("tcommonscoreService")
public class TCommonScoreService implements TCommonScoreManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("TCommonScoreMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TCommonScoreMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TCommonScoreMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("all")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TCommonScoreMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TCommonScoreMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TCommonScoreMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TCommonScoreMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 根据服务分获取服务编号
	 * */
	@Override
	public String getCommonIdByCommonScore(Double commonScore) throws Exception {
		return (String) dao.findForObject("TCommonScoreMapper.getCommonIdByCommonScore", commonScore);
	}
	
}

