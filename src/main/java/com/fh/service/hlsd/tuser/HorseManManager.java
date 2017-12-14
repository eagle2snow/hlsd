package com.fh.service.hlsd.tuser;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;
@SuppressWarnings("all")
public interface HorseManManager {
	
	/**骑手分页列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> horseManListPage(Page page)throws Exception;
	
	
	/**骑手考试结果分页列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> horseManExamListPage(Page page)throws Exception;
	
	/**骑手信息分页列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> horsemanMessageListPage(Page page)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**审核用户状态
	 * @param pd
	 * @throws Exception
	 */
	public int updateUserStatu(PageData pd)throws Exception;
	
	
	/**
	 * 修改骑手信息
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;


	/**修改骑手信息
	 * @Title: updateByPrimaryKeySelective
	 * @Description: TODO
	 * @param @param pd
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void updateByPrimaryKeySelective(PageData pd)throws Exception;
	
}
