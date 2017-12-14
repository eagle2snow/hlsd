package com.fh.service.hlsd.scale.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.scale.ScaleScoreManager;
import com.fh.util.PageData;

@Service("scaleScoreService")
public class ScaleScoreService implements ScaleScoreManager {

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	/* (non-Javadoc)
	 * <p>Title: getScaleScoreByScaleId</p>
	 * <p>Description: 根据等级id查询等级信息</p>
	 * @param scaleId
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.scale.ScaleScoreManager#getScaleScoreByScaleId(java.lang.String)
	 */
	@Override
	public PageData getScaleScoreByScaleId(String scaleId) throws Exception {
		return (PageData) dao.findForObject("TScaleScoreMapper.selectByPrimaryKey", scaleId);
	}

	/* (non-Javadoc)
	 * <p>Title: getScaleScoreByScaleName</p>
	 * <p>Description: 根据等级名称获取等级信息</p>
	 * @param scaleName
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.scale.ScaleScoreManager#getScaleScoreByScaleName(java.lang.String)
	 */
	@Override
	public PageData getScaleScoreByScaleName(String scaleName) throws Exception {
		return (PageData) dao.findForObject("TScaleScoreMapper.selectScaleByScaleName", scaleName);
	}

	/* (non-Javadoc)
	 * <p>Title: addScaleScore</p>
	 * <p>Description: 添加等级分数</p>
	 * @param pageData
	 * @throws Exception
	 * @see com.fh.service.hlsd.scale.ScaleScoreManager#addScaleScore(com.fh.util.PageData)
	 */
	@Override
	public void addScaleScore(PageData pageData) throws Exception {
		
		dao.save("TScaleScoreMapper.insertSelective", pageData);
	}

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("TScaleScoreControllerMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TScaleScoreControllerMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TScaleScoreControllerMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("all")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TScaleScoreControllerMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TScaleScoreControllerMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TScaleScoreControllerMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TScaleScoreControllerMapper.deleteAll", ArrayDATA_IDS);
	}

	/* (non-Javadoc)
	 * <p>Title: getScaleIdByScaleScore</p>
	 * <p>Description: 根据等级积分查询等级id</p>
	 * @param scaleScore
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.scale.ScaleScoreManager#getScaleIdByScaleScore(java.lang.Integer)
	 */
	@Override
	public String getScaleIdByScaleScore(Integer scaleScore) throws Exception {
		return (String) dao.findForObject("TScaleScoreMapper.getScaleByScaleScore", scaleScore);
	}

	/* (non-Javadoc)
	 * <p>Title: getMaxScaleScore</p>
	 * <p>Description: 获取最大等级积分</p>
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.scale.ScaleScoreManager#getMaxScaleScore()
	 */
	@Override
	public Integer getMaxScaleScore() throws Exception {
		return (Integer) dao.findForObject("TScaleScoreMapper.getMaxScaleScore", null);
	}
}
