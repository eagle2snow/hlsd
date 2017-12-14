package com.fh.controller.app.invoke;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.service.test.dept.DeptManager;
import com.fh.service.test.tuser.TuserManager;
import com.fh.util.AppUtil;
import com.fh.util.PageData;
import com.fh.util.Tools;


/**@author ZhangWenchao
  * 会员-接口类 
  * 相关参数协议：
  * 00	请求失败
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整    
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value="/appuser")
public class IntAppuserController extends BaseController {
    
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	
	@Resource(name="deptService")
	private DeptManager deptService;
	
	@Resource(name="tuserService")
	private TuserManager tuserService;
	
	/**根据用户名获取会员信息
	 * @return 
	 */
	@RequestMapping(value="/getAppuserByUm")
	@ResponseBody
	public Object getAppuserByUsernmae(){
		logBefore(logger, "根据用户名获取会员信息");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			if(Tools.checkKey("USERNAME", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("getAppuserByUsernmae", pd)){	//检查参数
					pd = appuserService.findByUsername(pd);
					map.put("pd", pd);
					result = (null == pd) ?  "02" :  "01";
				}else {
					result = "03";
				}
			}else{
				result = "05";
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**
	 * 以下是压力测试调用的方法
	 */
	@RequestMapping(value="/listDept")
	@ResponseBody
	public Object list(Page page) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			String keywords = pd.getString("keywords");				//关键词检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<PageData>	varList = deptService.list(page);	//列出Dept列表
			map.put("result", varList);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	
	/**保存用户信息--压力测试
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveUser")
	@ResponseBody
	public Object save() throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		try {
			PageData pd = new PageData();
			pd = this.getPageData();
			pd.put("TUSER_ID", this.get32UUID());	//主键
			tuserService.save(pd);
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", e.getMessage());
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
}
	
 