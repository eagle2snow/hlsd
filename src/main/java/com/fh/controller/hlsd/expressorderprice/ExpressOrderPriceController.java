package com.fh.controller.hlsd.expressorderprice;

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
import com.fh.service.hlsd.city.CityManager;
import com.fh.service.hlsd.expressorderprice.ExpressOrderPriceManager;
import com.fh.service.hlsd.province.ProvinceManager;

/** 
 * 说明：里程费模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-14 11:53
 */
@SuppressWarnings("all") 
@Controller
@RequestMapping(value="/expressorderprice")
public class ExpressOrderPriceController extends BaseController {
	
	String menuUrl = "expressorderprice/list.do"; //菜单地址(权限用)
	@Resource(name="expressorderpriceService")
	private ExpressOrderPriceManager expressorderpriceService;
	
	@Resource(name = "provinceService")
	private ProvinceManager provinceService;

	@Resource(name = "cityService")
	private CityManager cityService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增ExpressOrderPrice");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/*pd.put("ID", this.get32UUID());	//主键
*/		 expressorderpriceService.save(pd);
		mv.addObject("msg","success");
		mv.addObject("pd", expressorderpriceService.getPriceById(Integer.parseInt(pd.get("ID").toString())));
		mv.setViewName("hlsd/expressorderprice/expressorderprice_view");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除ExpressOrderPrice");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		expressorderpriceService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ExpressOrderPrice");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		expressorderpriceService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ExpressOrderPrice");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = expressorderpriceService.list(page);	//列出ExpressOrderPrice列表
		mv.setViewName("hlsd/expressorderprice/expressorderprice_list");
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
		List<PageData> provinces = provinceService.listAll(pd);
		pd.put("provinces", provinces);
		mv.setViewName("hlsd/expressorderprice/expressorderprice_edit");
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
		pd = expressorderpriceService.findById(pd);	//根据ID读取
		List<PageData> provinces = provinceService.listAll(pd);
		pd.put("provinces", provinces);
		mv.setViewName("hlsd/expressorderprice/expressorderprice_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ExpressOrderPrice");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			expressorderpriceService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出ExpressOrderPrice到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("编号");	//1
		titles.add("城市id");	//2
		titles.add("终点");	//3
		titles.add("里程费");	//4
		titles.add("省id");	//5
		titles.add("起点");	//6
		titles.add("司机类型");	//7
		titles.add("ip");	//8
		titles.add("订单类型");	//9
		titles.add("费用类型");	//10
		titles.add("修改时间");	//11
		titles.add("修改者");	//12
		titles.add("夜间费开始计费时间");	//13
		titles.add("夜间费结束计费时间");	//14
		dataMap.put("titles", titles);
		List<PageData> varOList = expressorderpriceService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("CITYID"));	    //2
			vpd.put("var3", varOList.get(i).get("ENDMILEAGE").toString());	//3
			vpd.put("var4", varOList.get(i).get("MILEAGEPRICE").toString());	//4
			vpd.put("var5", varOList.get(i).getString("PROVINCEID"));	    //5
			vpd.put("var6", varOList.get(i).get("STARTMILEAGE").toString());	//6
			vpd.put("var7", varOList.get(i).getString("DRIVERTYPE"));	    //7
			vpd.put("var8", varOList.get(i).getString("IP"));	    //8
			vpd.put("var9", varOList.get(i).getString("ORDERTYPE"));	    //9
			vpd.put("var10", varOList.get(i).getString("PRICETYPE"));	    //10
			vpd.put("var11", varOList.get(i).getString("UPDATETIME"));	    //11
			vpd.put("var12", varOList.get(i).getString("UPDATER"));	    //12
			vpd.put("var13", varOList.get(i).get("STARTTIME").toString());	//13
			vpd.put("var14", varOList.get(i).get("ENDTIME").toString());	//14
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
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
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
