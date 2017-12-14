package com.fh.service.hlsd.examopt.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.service.hlsd.examopt.ExamOptManager;
import com.fh.util.PageData;

/** 
 * 说明：在线考试管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 * @version
 */
@Service("examOptService")
public class ExamOptService implements ExamOptManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("ExamOptionMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("ExamOptionMapper.delete", pd);
	}

	
	/* (non-Javadoc)
	 * <p>Title: listByQuestionId</p>
	 * <p>Description: </p>
	 * @param questionId
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.examopt.ExamOptManager#listByQuestionId(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listByQuestionId(String questionId) throws Exception {
		return (List<PageData>)dao.findForList("ExamOptionMapper.listByQuestionId", questionId);
	}
	/**
	 * @Title: SelectByPrimaryKey
	 * @Description: \
	 * @param @param questionId
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> SelectByQuestionId(String questionId) throws Exception {
		return (List<PageData>)dao.findForList("ExamOptionMapper.selectByQuestionId", questionId);
	}
	
}

