package com.fh.service.hlsd.common;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明：公共的Service（如：文件的查询）
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 * @version
 */
public interface CommonManager{

	/**根据关联编号和文件类型查询文件信息列表
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listFile(PageData pd)throws Exception;
	
	/**
	 * @Title: savaFile
	 * @Description: 保存文件
	 * @param @param pd
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void savaFile(PageData pd) throws Exception;

	/**
	 * @Title: deleteByRefId
	 * @Description: TODO
	 * @param @param horsemanId    
	 * @return void    
	 * @throws
	 */
	public void deleteByRefId(String REF_ID) throws Exception;

	/**
	 * @Title: selectFileListByRefId
	 * @Description: 根据条件查询文件
	 * @param @param horsemanId
	 * @param @return    
	 * @return List<PageData>    
	 * @throws
	 */
	public List<PageData> selectFileListByRefId(PageData pd) throws Exception;
	
	/**
	 * 保存短信发送记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveMessage(PageData pd) throws Exception;
	
	
	/**
	 * 查询短信发送记录
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> datalistPageForSms(Page page)throws Exception;
	
	
}

