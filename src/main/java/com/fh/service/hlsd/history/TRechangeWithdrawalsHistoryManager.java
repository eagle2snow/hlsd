package com.fh.service.hlsd.history;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;
@SuppressWarnings("all")
public interface TRechangeWithdrawalsHistoryManager {

	/**
	 * @Title: saveHistory
	 * @Description: 保存流水记录
	 * @param @param history    
	 * @return void    
	 * @throws
	 */
	void saveHistory(PageData history) throws Exception ;
	
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
	 * @Title: datalistPageUserMoney
	 * @Description: 获取用户的统计数据
	 * @param @param page
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	List<PageData> datalistPageUserMoney(Page page)throws Exception;
}
