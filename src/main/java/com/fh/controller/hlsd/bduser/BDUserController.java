package com.fh.controller.hlsd.bduser;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.service.hlsd.BD.bdincome.BDIncomeManager;
import com.fh.service.hlsd.BD.bduser.BDUserManager;
import com.fh.service.hlsd.area.AreaManager;
import com.fh.service.hlsd.city.CityManager;
import com.fh.service.hlsd.province.ProvinceManager;
import com.fh.service.hlsd.stand.StandManager;
import com.fh.service.hlsd.userInfo.AppUserManager;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.google.gson.Gson;

import com.fh.util.Jurisdiction;

/**
 * 说明：BD专员模块 创建人：ZhangWenchao 创建时间：2017-09-21 11:52
 */
@Controller
@RequestMapping(value = "/bduser")
@SuppressWarnings("all")
public class BDUserController extends BaseController {

	String menuUrl = "bduser/list.do"; // 菜单地址(权限用)
	@Resource(name = "bduserService")
	private BDUserManager bduserService;

	@Resource(name = "bdincomeService")
	private BDIncomeManager bdincomeService;
	
	@Resource(name = "provinceService")
	private ProvinceManager provinceService;

	@Resource(name = "cityService")
	private CityManager cityService;

	@Resource(name = "areaService")
	private AreaManager areaService;

	@Resource(name = "standService")
	private StandManager standService;

	@Resource(name = "appUserService")
	private AppUserManager appUserService;
	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增BDUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String BDMOBILENO = pd.getString("BDMOBILENO");

		pd.put("BDUSERID", this.get32UUID()); // 主键
		pd.put("MONEY", "0"); // 余额
		pd.put("AVAILABLEBALANCE", "0"); // 可用余额
		pd.put("BDCODE", this.getCodeByRandam(5)); // BD码
		pd.put("CREATETIME", new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date())); // 创建时间
		pd.put("CREATER", ((User) this.getRequest().getSession().getAttribute(Const.SESSION_USER)).getUSERNAME());
		bduserService.save(pd);

		mv.addObject("msg", "success");
		mv.addObject("pd", bduserService.findById(pd));
		mv.setViewName("hlsd/bduser/bduser_view");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除BDUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		
		PageData BDUSER = bduserService.findById(pd);
		
		List<String> userIds = appUserService.getUserByBeInvitedCode(BDUSER.get("BDCODE").toString());
		if(userIds.size()>0){
			appUserService.updateBeInvitedCodeByUserId(userIds);
		}
		
		List<PageData> param = bdincomeService.getBDIncomeIdByBDUserId(pd);
		if(param.size()>0){
			bdincomeService.deleteAll(param);
		}
		
		bduserService.delete(pd);
		out.write("success");
		out.close();
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "修改BDUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		bduserService.edit(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表BDUser");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = bduserService.list(page); // 列出BDUser列表
		mv.setViewName("hlsd/bduser/bduser_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> provinces = provinceService.listAll(pd);
		pd.put("provinces", provinces);
		mv.setViewName("hlsd/bduser/bduser_add");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> provinces = provinceService.listAll(pd);
		pd = bduserService.findById(pd); // 根据ID读取
		pd.put("provinces", provinces);
		mv.setViewName("hlsd/bduser/bduser_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "批量删除BDUser");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			bduserService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出BDUser到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("bd专员id"); // 1
		titles.add("电话"); // 2
		titles.add("头像"); // 3
		titles.add("bd码"); // 4
		titles.add("区编号"); // 5
		titles.add("创建时间"); // 6
		titles.add("创建者"); // 7
		titles.add("修改时间"); // 8
		titles.add("修改者"); // 9
		titles.add("BD专员名称"); // 10
		titles.add("余额"); // 11
		titles.add("支付宝账号"); // 12
		titles.add("支付宝名称"); // 13
		titles.add("微信账号"); // 14
		titles.add("微信名称"); // 15
		titles.add("可提现余额"); // 16
		titles.add("站id"); // 17
		titles.add("省id"); // 18
		titles.add("市id"); // 19
		titles.add("微信头像"); // 20
		dataMap.put("titles", titles);
		List<PageData> varOList = bduserService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("BDUSERID")); // 1
			vpd.put("var2", varOList.get(i).get("BDMOBILENO").toString()); // 2
			vpd.put("var3", varOList.get(i).getString("BDPICTURE")); // 3
			vpd.put("var4", varOList.get(i).get("BDCODE").toString()); // 4
			vpd.put("var5", varOList.get(i).getString("AREAID")); // 5
			vpd.put("var6", varOList.get(i).getString("CREATETIME")); // 6
			vpd.put("var7", varOList.get(i).getString("CREATER")); // 7
			vpd.put("var8", varOList.get(i).getString("UPDATETIME")); // 8
			vpd.put("var9", varOList.get(i).getString("UPDATER")); // 9
			vpd.put("var10", varOList.get(i).getString("BDUSERNAME")); // 10
			vpd.put("var11", varOList.get(i).getString("MONEY")); // 11
			vpd.put("var12", varOList.get(i).getString("ALIPAYACCOUNT")); // 12
			vpd.put("var13", varOList.get(i).getString("ALIPAYREALNAME")); // 13
			vpd.put("var14", varOList.get(i).getString("OPENID")); // 14
			vpd.put("var15", varOList.get(i).getString("WXREALNAME")); // 15
			vpd.put("var16", varOList.get(i).getString("ACAILABLEBALANCE")); // 16
			vpd.put("var17", varOList.get(i).getString("STANDID")); // 17
			vpd.put("var18", varOList.get(i).getString("PROVINCEID")); // 18
			vpd.put("var19", varOList.get(i).getString("CITYID")); // 19
			vpd.put("var20", varOList.get(i).getString("WXIMAGE")); // 20
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv, dataMap);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/city")
	public List<PageData> city() {
		try {
			PageData pd = new PageData();
			pd = this.getPageData();

			List<PageData> cities = cityService.getCitiesByProvinceId(pd);

			return cities;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@ResponseBody
	@RequestMapping(value = "/area")
	public List<PageData> area() {
		try {
			PageData pd = new PageData();
			pd = this.getPageData();

			List<PageData> areas = areaService.getAreaesByCityId(pd);

			return areas;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@ResponseBody
	@RequestMapping(value = "/stand")
	public List<PageData> stand() {
		try {
			PageData pd = new PageData();
			pd = this.getPageData();

			List<PageData> stands = standService.getStandsByAreaId(pd);

			return stands;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	@ResponseBody
	@RequestMapping(value = "/checkMobileNo")
	public String checkMobileNo(){
		try{
			
			PageData pd = new PageData();
			pd = this.getPageData();
			
			String BDMOBILENO = pd.getString("BDMOBILENO");

			if(StringUtils.isBlank(BDMOBILENO)){
				
				this.getResponse().getWriter().write("2");
				
				return null;
			}
			
			PageData BDUSER = bduserService.getUserByMobileNo(BDMOBILENO);
			
			if(BDUSER != null ){
				
				this.getResponse().getWriter().write("0");

			}else{
				
				this.getResponse().getWriter().write("1");

			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
}
