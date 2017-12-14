package com.fh.service.hlsd.tcommonscore;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：服务分模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-11 18:40
 * @version
 */
@SuppressWarnings("all")
public interface TCommonScoreManager{

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
	public List<PageData> list( Page page)throws Exception;
	
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
	 * @Title: getCommonIdByCommonScore
	 * @Description: 根基服务分获取服务编号
	 * @param @param commonScore
	 * @param @return
	 * @param @throws Exption    
	 * @return Object    
	 * @throws
	 */
	public String getCommonIdByCommonScore(Double commonScore)throws Exception;

}

