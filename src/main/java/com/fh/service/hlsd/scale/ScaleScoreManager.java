package com.fh.service.hlsd.scale;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

@SuppressWarnings("all")
public interface ScaleScoreManager {

	/**
	 * @Title: getScaleScoreByScaleId
	 * @Description: 根据等级id查询等级信息
	 * @param @param scaleId
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getScaleScoreByScaleId(String scaleId) throws Exception;
	
	/**
	 * @Title: getScaleScoreByScaleName
	 * @Description: 根据等级名称获取等级信息
	 * @param @param scaleName
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	public PageData getScaleScoreByScaleName(String scaleName) throws Exception;

	/**
	 * @Title: addScaleScore
	 * @Description: 添加等级分数
	 * @param @param pageData
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void addScaleScore(PageData pageData) throws Exception;
	
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
	 * @Title: getScaleIdByScaleScore
	 * @Description: 根据等级分数查询等级id
	 * @param @param scaleScore
	 * @param @return
	 * @param @throws Exception    
	 * @return Object    
	 * @throws
	 */
	public String getScaleIdByScaleScore(Integer scaleScore)throws Exception;
	
	/**
	 * @Title: getMaxScaleScore
	 * @Description: 获取最大等级积分
	 * @param @return
	 * @param @throws Exception    
	 * @return Integer    
	 * @throws
	 */
	public Integer getMaxScaleScore()throws Exception;
}
