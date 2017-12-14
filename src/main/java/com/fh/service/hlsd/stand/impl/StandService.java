package com.fh.service.hlsd.stand.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.hlsd.stand.StandManager;

/** 
 * 说明：站
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-26 13:32
 * @version
 */
@SuppressWarnings("all")
@Service("standService")
public class StandService implements StandManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("StandMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("StandMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("StandMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("StandMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("StandMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("StandMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StandMapper.deleteAll", ArrayDATA_IDS);
	}
	/**
	 * 根据区id获取站集合
	 * */
	@Override
	public List<PageData> getStandsByAreaId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("StandMapper.getStandsByAreaId", pd);
	}
	
}

