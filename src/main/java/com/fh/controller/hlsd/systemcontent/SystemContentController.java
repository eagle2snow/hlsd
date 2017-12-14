package com.fh.controller.hlsd.systemcontent;

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
import com.fh.service.hlsd.systemContent.TSystemContentManager;

/** 
 * 说明：系统文件模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-27 02:00
 */
@Controller
@RequestMapping(value="/systemcontent")
public class SystemContentController extends BaseController {
	
	String menuUrl = "systemcontent/list.do"; //菜单地址(权限用)
	@Resource(name="tSystemContentService")
	private TSystemContentManager systemcontentService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增SystemContent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSTEMCONTENT_ID", this.get32UUID());	//主键
		systemcontentService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除SystemContent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		systemcontentService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改SystemContent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		systemcontentService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表SystemContent");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = systemcontentService.list(page);	//列出SystemContent列表
		mv.setViewName("hlsd/systemcontent/systemcontent_list");
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
		mv.setViewName("hlsd/systemcontent/systemcontent_edit");
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
		pd = systemcontentService.findById(pd);	//根据ID读取
		mv.setViewName("hlsd/systemcontent/systemcontent_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除SystemContent");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			systemcontentService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出SystemContent到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("序号");	//1
		titles.add("每颗星加分");	//2
		titles.add("一个差评减去的分数");	//3
		titles.add("余额打折数");	//4
		titles.add("字段名5");	//5
		titles.add("字段名6");	//6
		titles.add("字段名7");	//7
		titles.add("字段名8");	//8
		titles.add("字段名9");	//9
		titles.add("字段名10");	//10
		titles.add("字段名11");	//11
		titles.add("字段名12");	//12
		titles.add("字段名13");	//13
		titles.add("字段名14");	//14
		titles.add("字段名15");	//15
		titles.add("字段名16");	//16
		titles.add("字段名17");	//17
		titles.add("字段名18");	//18
		titles.add("字段名19");	//19
		titles.add("字段名20");	//20
		titles.add("字段名21");	//21
		titles.add("字段名22");	//22
		titles.add("字段名23");	//23
		titles.add("字段名24");	//24
		titles.add("字段名25");	//25
		titles.add("字段名26");	//26
		titles.add("字段名27");	//27
		titles.add("字段名28");	//28
		titles.add("字段名29");	//29
		titles.add("字段名30");	//30
		titles.add("字段名31");	//31
		titles.add("字段名32");	//32
		titles.add("字段名33");	//33
		titles.add("字段名34");	//34
		titles.add("字段名35");	//35
		titles.add("字段名36");	//36
		titles.add("字段名37");	//37
		titles.add("字段名38");	//38
		titles.add("字段名39");	//39
		titles.add("字段名40");	//40
		titles.add("字段名41");	//41
		titles.add("字段名42");	//42
		titles.add("字段名43");	//43
		titles.add("字段名44");	//44
		titles.add("字段名45");	//45
		titles.add("字段名46");	//46
		titles.add("字段名47");	//47
		titles.add("字段名48");	//48
		titles.add("字段名49");	//49
		titles.add("骑手接单范围");	//50
		titles.add("字段名51");	//51
		titles.add("字段名52");	//52
		dataMap.put("titles", titles);
		List<PageData> varOList = systemcontentService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("ID").toString());	//1
			vpd.put("var2", varOList.get(i).get("ADDSCORE").toString());	//2
			vpd.put("var3", varOList.get(i).get("SUBTRACTSCORE").toString());	//3
			vpd.put("var4", varOList.get(i).get("DISCOUNTED").toString());	//4
			vpd.put("var5", varOList.get(i).get("MAXDIFFERENCETIME").toString());	//5
			vpd.put("var6", varOList.get(i).get("PATHPROPORTION").toString());	//6
			vpd.put("var7", varOList.get(i).get("SPEED").toString());	//7
			vpd.put("var8", varOList.get(i).get("BODYBEGIN1").toString());	//8
			vpd.put("var9", varOList.get(i).get("BODYBEGIN2").toString());	//9
			vpd.put("var10", varOList.get(i).get("BODYBEGIN3").toString());	//10
			vpd.put("var11", varOList.get(i).get("BODYEND1").toString());	//11
			vpd.put("var12", varOList.get(i).get("BODYEND2").toString());	//12
			vpd.put("var13", varOList.get(i).get("DEFAULTBMINPRICE").toString());	//13
			vpd.put("var14", varOList.get(i).get("DEFAULTPMINPRICE").toString());	//14
			vpd.put("var15", varOList.get(i).get("DOWNPERCENT").toString());	//15
			vpd.put("var16", varOList.get(i).get("SERVICECHARGE1").toString());	//16
			vpd.put("var17", varOList.get(i).get("SERVICECHARGE2").toString());	//17
			vpd.put("var18", varOList.get(i).get("SERVICECHARGE3").toString());	//18
			vpd.put("var19", varOList.get(i).get("SPLITDISTANT").toString());	//19
			vpd.put("var20", varOList.get(i).get("UPPERCENT").toString());	//20
			vpd.put("var21", varOList.get(i).get("WEIGHTBEGIN1").toString());	//21
			vpd.put("var22", varOList.get(i).get("WEIGHTBEGIN2").toString());	//22
			vpd.put("var23", varOList.get(i).get("WEIGHTBEGIN3").toString());	//23
			vpd.put("var24", varOList.get(i).get("WEIGHTEND1").toString());	//24
			vpd.put("var25", varOList.get(i).get("WEIGHTEND2").toString());	//25
			vpd.put("var26", varOList.get(i).get("DEFAULTMINPRICE").toString());	//26
			vpd.put("var27", varOList.get(i).get("DELIVERYDISTANCE").toString());	//27
			vpd.put("var28", varOList.get(i).get("FIRSTORDERBACKCASE").toString());	//28
			vpd.put("var29", varOList.get(i).get("INVITEDRIVERBACKCASE").toString());	//29
			vpd.put("var30", varOList.get(i).get("INVITEUSERBACKCASE").toString());	//30
			vpd.put("var31", varOList.get(i).get("DRIVERDISTANCE").toString());	//31
			vpd.put("var32", varOList.get(i).getString("QRCODEIMAGE"));	    //32
			vpd.put("var33", varOList.get(i).get("FOLLOWINGWINDBEGIN").toString());	//33
			vpd.put("var34", varOList.get(i).get("FOLLOWINGWINDEND").toString());	//34
			vpd.put("var35", varOList.get(i).get("FOLLOWINGWINDLIKE").toString());	//35
			vpd.put("var36", varOList.get(i).getString("DELIVERYORDERPERCENT"));	    //36
			vpd.put("var37", varOList.get(i).getString("DRIVERORDERPERCENT"));	    //37
			vpd.put("var38", varOList.get(i).getString("DRIVERORDERFEEPERCENT"));	    //38
			vpd.put("var39", varOList.get(i).getString("SERVICEFEE1"));	    //39
			vpd.put("var40", varOList.get(i).getString("SERVICEFEE2"));	    //40
			vpd.put("var41", varOList.get(i).getString("SERVICEFEE3"));	    //41
			vpd.put("var42", varOList.get(i).getString("HORSEMANORDERFEEPERCENT"));	    //42
			vpd.put("var43", varOList.get(i).getString("SERVICEFEE"));	    //43
			vpd.put("var44", varOList.get(i).get("CANCELNUMBER").toString());	//44
			vpd.put("var45", varOList.get(i).getString("CITYID"));	    //45
			vpd.put("var46", varOList.get(i).getString("PROVINCEID"));	    //46
			vpd.put("var47", varOList.get(i).getString("VOLUEFEE1"));	    //47
			vpd.put("var48", varOList.get(i).getString("VOLUEFEE2"));	    //48
			vpd.put("var49", varOList.get(i).getString("VOLUEFEE3"));	    //49
			vpd.put("var50", varOList.get(i).get("HORSEMANDISTANCE").toString());	//50
			vpd.put("var51", varOList.get(i).get("HORSEMANADDSCORE").toString());	//51
			vpd.put("var52", varOList.get(i).get("HORSEMANSUBTRACTSCORE").toString());	//52
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
