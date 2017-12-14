package com.fh.service.hlsd.tuser.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.tuser.HorseManManager;
import com.fh.util.PageData;

@SuppressWarnings("all")
@Service("horseManService")
public class HorseManService implements HorseManManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;

	public List<PageData> horseManListPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("HorseManMapper.datalistPageHorseMan", page);
	}
	
	public List<PageData> horseManExamListPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("HorseManMapper.datalistPageExamResult", page);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HorseManMapper.findById", pd);
	}


	@Override
	public int updateUserStatu(PageData pd) throws Exception {
		Object resCnt = 0;
		if("7".equals(pd.getString("userStatu"))){
			resCnt = dao.update("HorseManMapper.updateUserStatuFor7", pd);
		}else{
			resCnt = dao.update("HorseManMapper.updateUserStatu", pd);
		}
		if(resCnt!=null){
			return Integer.parseInt(resCnt.toString());
		}else{
			return 0;
		}
	}

	@Override
	public void edit(PageData pd) throws Exception {
		dao.update("HorseManMapper.edit", pd);
	}

	@Override
	public List<PageData> horsemanMessageListPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("HorseManMapper.datalistPageHorsemanMessage", page);
	}

	/* (non-Javadoc)
	 * <p>Title: updateByPrimaryKeySelective</p>
	 * <p>Description: 修改骑手信息</p>
	 * @param pd
	 * @throws Exception
	 * @see com.fh.service.hlsd.tuser.HorseManManager#updateByPrimaryKeySelective(com.fh.util.PageData)
	 */
	@Override
	public void updateByPrimaryKeySelective(PageData pd) throws Exception {
		dao.update("HorseManMapper.updateByPrimaryKeySelective", pd);
	}
}
