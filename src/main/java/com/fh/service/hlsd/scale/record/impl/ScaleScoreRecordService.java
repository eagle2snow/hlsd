package com.fh.service.hlsd.scale.record.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.service.hlsd.scale.record.ScaleScoreRecordManager;
import com.fh.util.PageData;

@SuppressWarnings("all")
@Service("scaleScoreRecordService")
public class ScaleScoreRecordService implements ScaleScoreRecordManager {
	
	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;

	/* (non-Javadoc)
	 * <p>Title: getRecordCountByUserId</p>
	 * <p>Description: 根据用户id查询用户等级分数记录</p>
	 * @param userId
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.scale.record.ScaleScoreRecordManager#getRecordCountByUserId(java.lang.String)
	 */
	@Override
	public Long getRecordCountByUserId(String userId) throws Exception {
		return (Long) dao.findForObject("TScaleScoreRecordMapper.selectCountByUserId", userId);
	}

	/* (non-Javadoc)
	 * <p>Title: getScaleRecardListByUserId</p>
	 * <p>Description: 根据用户id分页查询用户的灯具分数记录</p>
	 * @param selectParam
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.scale.record.ScaleScoreRecordManager#getScaleRecardListByUserId(com.fh.util.PageData)
	 */
	@Override
	public List<PageData> getScaleRecardListByUserId(PageData selectParam) throws Exception {
		return (List<PageData>) dao.findForList("TScaleScoreRecordMapper.selectScoreRecordByUserId", selectParam);
	}

}
