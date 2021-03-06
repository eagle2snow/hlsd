package com.fh.service.hlsd.stand;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：站
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-26 13:32
 * @version
 */
public interface StandManager{

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

	/**
	 * @Title: getStandsByAreaId
	 * @Description: 根据区id获取站集合
	 * @param @param pd
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getStandsByAreaId(PageData pd)throws Exception;
	
}

