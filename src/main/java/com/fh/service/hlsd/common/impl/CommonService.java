package com.fh.service.hlsd.common.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.common.CommonManager;
import com.fh.util.PageData;

/** 
 * 说明：公共服务管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 * @version
 */
@Service("commonService")
public class CommonService implements CommonManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	@SuppressWarnings("unchecked")
	public List<PageData> listFile(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("FileInfoMapper.listFile", pd);
	}
	
	/**
	 * @Title: savaFile
	 * @Description: 保存文件
	 * @param @param pd
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void savaFile(PageData pd) throws Exception {
		dao.save("FileInfoMapper.savaFile", pd);
	}

	/* (non-Javadoc)
	 * <p>Title: deleteByRefId</p>
	 * <p>Description: 根据id删除文件</p>
	 * @param REF_ID
	 * @throws Exception
	 * @see com.fh.service.hlsd.common.CommonManager#deleteByRefId(java.lang.String)
	 */
	@Override
	public void deleteByRefId(String REF_ID) throws Exception {
		dao.delete("FileInfoMapper.deleteFileByRefId", REF_ID);
	}

	/* (non-Javadoc)
	 * <p>Title: selectFileListByRefId</p>
	 * <p>Description: </p>
	 * @param REF_ID
	 * @return
	 * @see com.fh.service.hlsd.common.CommonManager#selectFileListByRefId(java.lang.String)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> selectFileListByRefId(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("FileInfoMapper.selectFileByCondition", pd);
	}

	@Override
	public void saveMessage(PageData pd) throws Exception {
		dao.save("FileInfoMapper.savaFile", pd);
	}

	@SuppressWarnings("unchecked")
	public List<PageData> datalistPageForSms(Page page) throws Exception {
		return (List<PageData>)dao.findForList("HorseManMapper.datalistPageForSms", page);
	}
	
	
}

