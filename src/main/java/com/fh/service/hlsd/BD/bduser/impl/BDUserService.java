package com.fh.service.hlsd.BD.bduser.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport2;
import com.fh.entity.Page;
import com.fh.service.hlsd.BD.bduser.BDUserManager;
import com.fh.util.PageData;

/** 
 * 说明：BD专员模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-21 11:52
 * @version
 */
@Service("bduserService")
@SuppressWarnings("all") 
public class BDUserService implements BDUserManager{

	@Resource(name = "daoSupport2")
	private DaoSupport2 dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("BDUserMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("BDUserMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public Integer edit(PageData pd)throws Exception{
		return (Integer) dao.update("BDUserMapper.edit", pd);
	}
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void updateBDUserWXMessage(PageData pd)throws Exception{
		dao.update("BDUserMapper.updateBDUserWXMessage", pd);
	}
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void updateBDUserAlipayMessage(PageData pd)throws Exception{
		dao.update("BDUserMapper.updateBDUserAlipayMessage", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BDUserMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BDUserMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("BDUserMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("BDUserMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public int findUserBDCode(String BDCODE) throws Exception {
		return (int) dao.findForObject("BDUserMapper.findUserCountBDCode", BDCODE);
	}

	@Override
	public PageData getUserByMobileNo(String BDMOBILENO) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.getUserByMobileNo", BDMOBILENO);
	}

	@Override
	public PageData findByBDUSERID(PageData param) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.findByBDUSERID", param);
	}
	@Override
	public PageData getBDUserMessageByBDUSERID(PageData param) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.getBDUserMessageByBDUSERID", param);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getUserOrderNumberMessage(PageData param) throws Exception {
		return (List<PageData>) dao.findForList("BDUserMapper.getUserOrderNumberMessage", param);
	}

	@Override
	public PageData getBDUserNumberByOpenId(PageData selectParam) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.getBDUserNumberByOpenId", selectParam);
	}

	@Override
	public PageData findBySTATE(PageData param) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.findBySTATE", param);
	}

	@Override
	public Long updateBDUserMessge(PageData param) throws Exception {
		return (Long) dao.update("BDUserMapper.updateBDUserMessge", param);
	}

	@Override
	public PageData getUserCountByBDCODE(PageData selectParam) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.getUserCountByBDCODE", selectParam);
	}
	/**
	 * 根据BD码获取合伙人信息
	 * */
	@Override
	public List<PageData> getPartnerMessageByBdCode(PageData bDUSER) throws Exception {
		return (List<PageData>) dao.findForList("BDUserMapper.getPartnerMessageByBdCode", bDUSER);
	}
	/**
	 * 根据BD码获取合伙人数量
	 * */
	@Override
	public PageData getPartnerCountByBDCODE(PageData bDUSER) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.getPartnerCountByBDCODE", bDUSER);
	}
	/**
	 * 根据用户id获取用户信息
	 * */
	@Override
	public PageData getPartnerDetailMessageByBDUserId(PageData param) throws Exception {
		return (PageData) dao.findForObject("BDUserMapper.getPartnerDetailMessageByBDUserId", param);
	}
	
}

