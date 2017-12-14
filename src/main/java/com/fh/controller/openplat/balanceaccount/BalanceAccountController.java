package com.fh.controller.openplat.balanceaccount;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.dao.redis.RedisDao;
import com.fh.entity.Page;
import com.fh.service.openplat.balanceaccount.BalanceAccountManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.MessageUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Tools;

/** 
 * 说明：账号信息管理
 * 创建人：Administrator
 * 创建时间：2017-06-20
 */
@Controller
@RequestMapping(value="/balanceaccount")
public class BalanceAccountController extends BaseController {
	
	String menuUrl = "balanceaccount/list.do"; //菜单地址(权限用)
	@Resource(name="balanceaccountService")
	private BalanceAccountManager balanceaccountService;
	
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		String loginUser = Jurisdiction.getUsername();
		logBefore(logger, loginUser+"新增BalanceAccount");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("XH", this.get32UUID());	//序号--主键
		pd.put("STATUS", "1");	//状态
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("CREATEUSER", loginUser);	//创建人
		pd.put("UPDATETIME", Tools.date2Str(new Date()));	//修改时间
		pd.put("UPDATEUSER", loginUser);	//修改人
		balanceaccountService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除BalanceAccount");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		balanceaccountService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		String loginUser = Jurisdiction.getUsername();
		logBefore(logger, loginUser+"修改BalanceAccount");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("UPDATETIME", Tools.date2Str(new Date()));	//修改时间
		pd.put("UPDATEUSER", loginUser);	//修改人
		balanceaccountService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表BalanceAccount");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		if(!"admin".equals(Jurisdiction.getUsername())){//如果登录的角色不是超级管理员，就需要进行条件筛选
			pd.put("loginUser", Jurisdiction.getUsername());
		}
		page.setPd(pd);
		List<PageData>	varList = balanceaccountService.list(page);	//列出BalanceAccount列表
		mv.setViewName("openplat/balanceaccount/balanceaccount_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("openplat/balanceaccount/balanceaccount_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = balanceaccountService.findById(pd);	//根据ID读取
		mv.setViewName("openplat/balanceaccount/balanceaccount_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除BalanceAccount");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			balanceaccountService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出BalanceAccount到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("序号");	//1
		titles.add("手机号");	//2
		titles.add("用户id");	//3
		titles.add("余额");	//4
		titles.add("状态");	//5
		titles.add("创建时间");	//6
		titles.add("创建人");	//7
		titles.add("修改时间");	//8
		titles.add("修改人");	//9
		dataMap.put("titles", titles);
		List<PageData> varOList = balanceaccountService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("XH"));	    //1
			vpd.put("var2", varOList.get(i).getString("MOBILENO"));	    //2
			vpd.put("var3", varOList.get(i).getString("USERID"));	    //3
			vpd.put("var4", varOList.get(i).getString("BALANCE"));	    //4
			vpd.put("var5", varOList.get(i).getString("STATUS"));	    //5
			vpd.put("var6", varOList.get(i).getString("CREATETIME"));	    //6
			vpd.put("var7", varOList.get(i).getString("CREATEUSER"));	    //7
			vpd.put("var8", varOList.get(i).getString("UPDATETIME"));	    //8
			vpd.put("var9", varOList.get(i).getString("UPDATEUSER"));	    //9
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	/**
	 * 获取6位数验证码
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/getSixYzm")
	public void getSixYzm(PrintWriter out) throws Exception{
		String mobileNo = this.getRequest().getParameter("mobileNo");
		logBefore(logger, Jurisdiction.getUsername()+" 获取验证码");
		PageData pd = new PageData();
		pd.put("MOBILENO", mobileNo);
		PageData pageData = balanceaccountService.findByMobileNo(pd);
		String result = "1";
		if(pageData!=null && pageData.size()>0){
			result = "2";
		}else{
			try {
				int yzm = (int)((Math.random()*9+1)*100000);
				MessageUtil.sendMessge1(mobileNo,"您正在获取 账号管理功能 的手机认证 \n本次验证码为: "+yzm+"  ,验证码30分钟内有效");
				redisDaoImpl.addString(mobileNo, yzm+"",60*30);
			} catch (Exception e) {
				result = "0";
			}
		}
		out.write(result);
		out.close();
	}
	
	/**
	 * 验证验证码
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/sginSixYzm")
	public void sginSixYzm(PrintWriter out) throws Exception{
		String mobileNo = this.getRequest().getParameter("mobileNo");
		String yzm = this.getRequest().getParameter("yzm");
		logBefore(logger, Jurisdiction.getUsername()+" 认证验证码");
		String result = "1";
		try {
			String str = redisDaoImpl.get(mobileNo);
			if(!"".equals(str) || str !=null){
				if(!yzm.equals(str)){
					result = "0";
				}
			}else{
				result = "0";
			}
		} catch (Exception e) {
			result = "0";
		}
		out.write(result);
		out.close();
	}
	
	 /**
	  * 跳转到充值的页面
	  * @param
	  * @throws Exception
	  */
	@RequestMapping(value="/gotoPay")
	public ModelAndView gotoPay()throws Exception{
		String mobileNo = this.getRequest().getParameter("mobileNo");
		String xh = this.getRequest().getParameter("xh");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd.put("chargeMobile", mobileNo);
		pd.put("xh", xh);
		mv.setViewName("openplat/balanceaccount/recharge");
		mv.addObject("pd", pd);
		redisDaoImpl.addString("recharge_"+mobileNo, mobileNo, 10*60);// 10分钟内支付有效
		return mv;
	}

}
