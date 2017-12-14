package com.fh.service.hlsd.config.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport2;
import com.fh.service.hlsd.config.ConfigDomainManager;
import com.fh.util.PageData;
@Service("configDomainService")
public class ConfigDomainService implements ConfigDomainManager {

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	@Override
	public PageData selectByPrimaryKey(String key) throws Exception {
		return (PageData) dao.findForObject("ConfigDomainMapper.selectByPrimaryKey", key);
	}

	@Override
	public void savaCongfig(PageData pageData) throws Exception {
		dao.save("ConfigDomainMapper.insertSelective", pageData);
	}

	@Override
	public String updateConfig(PageData pageData) throws Exception {
		return (String) dao.update("ConfigDomainMapper.updateByPrimaryKeySelective", pageData);
	}

}
