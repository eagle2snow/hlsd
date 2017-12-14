package com.fh.service.hlsd.config;

import com.fh.util.PageData;

public interface ConfigDomainManager {

	/**
	 * @Title: selectByPrimaryKey
	 * @Description: 根据主键查询信息
	 * @param @param key
	 * @param @return
	 * @param @throws Exception    
	 * @return PageData    
	 * @throws
	 */
	PageData selectByPrimaryKey(String key) throws Exception;
	
	/**
	 * @Title: savaCongfig
	 * @Description: 保存信息
	 * @param @param pageData
	 * @param @throws Exception    
	 * @return void    
	 * @throws
	 */
	public void savaCongfig(PageData pageData) throws Exception;

	/**
	 * @Title: updateConfig
	 * @Description: 修改信息
	 * @param @param config    
	 * @return String    
	 * @throws
	 */
	public String updateConfig(PageData config) throws Exception;

}
