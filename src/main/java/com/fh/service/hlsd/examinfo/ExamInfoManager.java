package com.fh.service.hlsd.examinfo;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：在线考试管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 * @version
 */
public interface ExamInfoManager{

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
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	/**列表(部分)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listPart(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	
	/**批量加入考试题库
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void updateJoinExam(String[] ArrayDATA_IDS) throws Exception;
	
	/**批量移除考试题库
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void updateJoinExamExit(String[] ArrayDATA_IDS) throws Exception;
	
}

