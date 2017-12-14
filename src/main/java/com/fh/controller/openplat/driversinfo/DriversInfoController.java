package com.fh.controller.openplat.driversinfo;

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
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.openplat.driversinfo.DriversInfoManager;

/** 
 * 说明：司机信息管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-07-27 11:37
 */
@Controller
@RequestMapping(value="/driversinfo")
public class DriversInfoController extends BaseController {
	
	String menuUrl = "driversinfo/list.do"; //菜单地址(权限用)
	@Resource(name="driversinfoService")
	private DriversInfoManager driversinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增DriversInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DRIVERSINFO_ID", this.get32UUID());	//主键
		pd.put("XH", "");	//序号
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("CREATEUSER", "");	//创建人
		pd.put("UPDATETIME", Tools.date2Str(new Date()));	//修改时间
		pd.put("UPDATEUSER", "");	//修改人
		driversinfoService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除DriversInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		driversinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改DriversInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		driversinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表DriversInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = driversinfoService.list(page);	//列出DriversInfo列表
		mv.setViewName("openplat/driversinfo/driversinfo_list");
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
		mv.setViewName("openplat/driversinfo/driversinfo_edit");
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
		pd = driversinfoService.findById(pd);	//根据ID读取
		mv.setViewName("openplat/driversinfo/driversinfo_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除DriversInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			driversinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出DriversInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("序号");	//1
		titles.add("用户ID");	//2
		titles.add("真实姓名");	//3
		titles.add("手机号");	//4
		titles.add("性别(1男 0女)");	//5
		titles.add("出生日期");	//6
		titles.add("身份证号");	//7
		titles.add("所在省份");	//8
		titles.add("所在地市");	//9
		titles.add("所在乡镇");	//10
		titles.add("详细居住地址");	//11
		titles.add("余额");	//12
		titles.add("平均评分");	//13
		titles.add("注册时间");	//14
		titles.add("驾驶证");	//15
		titles.add("行驶证");	//16
		titles.add("审核状态(1通过  0不通过)");	//17
		titles.add("不通过原因");	//18
		titles.add("创建时间");	//19
		titles.add("创建人");	//20
		titles.add("修改时间");	//21
		titles.add("修改人");	//22
		dataMap.put("titles", titles);
		List<PageData> varOList = driversinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("XH"));	    //1
			vpd.put("var2", varOList.get(i).getString("USERID"));	    //2
			vpd.put("var3", varOList.get(i).getString("REALNAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("MOBILENO"));	    //4
			vpd.put("var5", varOList.get(i).get("DRIVERSEX").toString());	//5
			vpd.put("var6", varOList.get(i).getString("BIRTHDAY"));	    //6
			vpd.put("var7", varOList.get(i).getString("IDENTITYCARDNO"));	    //7
			vpd.put("var8", varOList.get(i).getString("PROVINCE"));	    //8
			vpd.put("var9", varOList.get(i).getString("CITY"));	    //9
			vpd.put("var10", varOList.get(i).getString("TOWN"));	    //10
			vpd.put("var11", varOList.get(i).getString("DETAILADDRESS"));	    //11
			vpd.put("var12", varOList.get(i).getString("BALANCE"));	    //12
			vpd.put("var13", varOList.get(i).getString("AVGSCORE"));	    //13
			vpd.put("var14", varOList.get(i).getString("REGDATE"));	    //14
			vpd.put("var15", varOList.get(i).getString("DRIVERSLICENSE"));	    //15
			vpd.put("var16", varOList.get(i).getString("DRIVINGLICENSE"));	    //16
			vpd.put("var17", varOList.get(i).get("AUDITSTATUS").toString());	//17
			vpd.put("var18", varOList.get(i).getString("NOPASSREASONS"));	    //18
			vpd.put("var19", varOList.get(i).getString("CREATETIME"));	    //19
			vpd.put("var20", varOList.get(i).getString("CREATEUSER"));	    //20
			vpd.put("var21", varOList.get(i).getString("UPDATETIME"));	    //21
			vpd.put("var22", varOList.get(i).getString("UPDATEUSER"));	    //22
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
}
