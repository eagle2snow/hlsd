package com.fh.service.hlsd.scale.record;

import java.util.List;

import com.fh.util.PageData;

public interface ScaleScoreRecordManager {

	/**
	 * @Title: getRecordCountByUserId
	 * @Description: 根据用户id查询等级记录数量
	 * @param @param userId
	 * @param @return
	 * @param @throws Exception    
	 * @return Long    
	 * @throws
	 */
	public Long getRecordCountByUserId(String userId) throws Exception;

	/**
	 * @Title: getScaleRecardListByUserId
	 * @Description: T分页查询用户的等级分数记录集合
	 * @param @param selectParam
	 * @param @return    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> getScaleRecardListByUserId(PageData selectParam) throws Exception;

}
