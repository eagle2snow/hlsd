package com.fh.service.hlsd.examopt;

import java.util.List;

import com.fh.util.PageData;

/** 
 * 说明：在线考试管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 * @version
 */
public interface ExamOptManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	
	/**列表(通过 question_id 查询子选项)
	 * @param questionId
	 * @throws Exception
	 */
	public List<PageData> listByQuestionId(String questionId)throws Exception;
	
	/**
	 * @Title: SelectByPrimaryKey
	 * @Description: 
	 * @param @param questionId
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> SelectByQuestionId(String questionId) throws Exception;
}

