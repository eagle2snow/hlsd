package com.fh.service.hlsd.expressorderprice;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：里程费模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-14 11:53
 * @version
 */
public interface ExpressOrderPriceManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public Integer save(PageData pd)throws Exception;
	
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
	 * @Title: getPriceById
	 * @Description: 根据ID获取价格信息
	 * @param @param ID
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getPriceById(Integer ID)throws Exception;
	
}

