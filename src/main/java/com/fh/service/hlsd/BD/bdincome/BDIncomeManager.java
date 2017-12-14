package com.fh.service.hlsd.BD.bdincome;


import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：BD收入模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-21 11:04
 * @version
 */
@SuppressWarnings("all")
public interface BDIncomeManager{

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
	 * 批量删除
	 * */
	public void deleteAll(List<PageData> param)throws Exception;
	/**
	 * @Title: getBDIncomeByBDUserId
	 * @Description: 根据BD专员ID获取收入记录
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getBDIncomeByBDUserId(PageData param)throws Exception;
	
	/**
	 * @Title: getBDIncomeByBDUserId
	 * @Description: 根据BD专员ID获取收入记录
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getBDIncomeIdByBDUserId(PageData param)throws Exception;
	
	/**
	 * @Title: getBDIncomeByBDUserIdAndUserId
	 * @Description: T根据客户ID和BD专员ID获取收入记录
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getBDIncomeByBDUserIdAndUserId(PageData param)throws Exception;
	
	/**
	 * @Title: getBDIncomeAllMoney
	 * @Description: 获取BD专员总收入
	 * @param @param param
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getBDIncomeAllMoney(PageData param) throws Exception;

	/**
	 * @Title: getIncomeCount
	 * @Description: 获取收入总记录数
	 * @param @param selectParam
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getIncomeCount(PageData selectParam) throws Exception;

}

