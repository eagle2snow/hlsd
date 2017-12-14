package com.fh.service.hlsd.systemContent.impt;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.systemContent.TSystemContentManager;
import com.fh.util.PageData;

@Service("tSystemContentService")
public class TSystemContentService implements TSystemContentManager {

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/* (non-Javadoc)
	 * <p>Title: getDistanceById</p>
	 * <p>Description: </p>
	 * @return
	 * @throws Exception
	 * @see com.fh.service.hlsd.systemContent.TSystemContentManager#getDistanceById()
	 */
	@Override
	public Integer getDistanceById(Integer id) throws Exception{
		return null;
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("SystemContentMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("SystemContentMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("SystemContentMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("SystemContentMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("SystemContentMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("SystemContentMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("SystemContentMapper.deleteAll", ArrayDATA_IDS);
	}

}
