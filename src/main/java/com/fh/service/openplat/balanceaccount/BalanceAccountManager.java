package com.fh.service.openplat.balanceaccount;

import java.util.List;


import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 账号信息管理接口
 * 创建人：Administrator
 * 创建时间：2017-06-20
 * @version
 */
public interface BalanceAccountManager{

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
	
	
	/**修改充值金额
	 * @param pd
	 * @throws Exception
	 */
	public Object updateBalance(PageData pd)throws Exception;
	
	/**通过手机号获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByMobileNo(PageData pd)throws Exception;
	
	/**通过登录的用户ID获取数据
	 * @param mobieNo
	 * @throws Exception
	 */
	public List<PageData> findByUserId(String userId)throws Exception;
}

