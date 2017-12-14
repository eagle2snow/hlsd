package com.fh.service.hlsd.examinfo.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.examinfo.ExamInfoManager;
import com.fh.util.PageData;

/** 
 * 说明：在线考试管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 * @version
 */
@Service("examinfoService")
public class ExamInfoService implements ExamInfoManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ExamInfoMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ExamInfoMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("ExamInfoMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ExamInfoMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExamInfoMapper.listAll", pd);
	}
	/**列表(部分)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listPart(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ExamInfoMapper.listPart", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ExamInfoMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ExamInfoMapper.deleteAll", ArrayDATA_IDS);
	}

	public void updateJoinExam(String[] ArrayDATA_IDS) throws Exception {
		dao.update("ExamInfoMapper.updateJoinExam", ArrayDATA_IDS);
	}
	
	public void updateJoinExamExit(String[] ArrayDATA_IDS) throws Exception {
		dao.update("ExamInfoMapper.updateJoinExamExit", ArrayDATA_IDS);
	}
	
}

