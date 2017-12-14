package com.fh.controller.hlsd.examinfo;

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
import com.fh.service.hlsd.examinfo.ExamInfoManager;
import com.fh.service.hlsd.examopt.ExamOptManager;
import com.fh.service.hlsd.tuser.HorseManManager;

/** 
 * 说明：在线考试管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 */
@Controller
@RequestMapping(value="/examinfo")
public class ExamInfoController extends BaseController {
	
	String menuUrl = "examinfo/list.do"; //菜单地址(权限用)
	
	@Resource(name="examinfoService")
	private ExamInfoManager examinfoService;
	
	@Resource(name="examOptService")
	private ExamOptManager examOptService;
	
	@Resource(name="horseManService")
	private HorseManManager horseManService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		String userName = Jurisdiction.getUsername();
		logBefore(logger, userName+" 新增ExamInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String questionId = this.get32UUID();
		pd.put("QUESTION_ID", questionId);	//主键
		pd.put("JOIN_EXAM", "1");	//加入考试(0否  1是)
		pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
		pd.put("CREATEUSER", userName);	//创建人
		pd.put("UPDATETIME", Tools.date2Str(new Date()));	//修改时间
		pd.put("UPDATEUSER", userName);	//修改人
		examinfoService.save(pd);
		
		//保存选项子表
		String opt_code = pd.getString("opt_code");
		String opt_content = pd.getString("opt_content");
		String [] bianma = opt_code.split(",");
		String [] contents = opt_content.split(",");
		for (int i = 0; i < bianma.length; i++) {
			PageData opt_pd = new PageData();
			opt_pd.put("OPTION_ID", this.get32UUID());
			opt_pd.put("QUESTION_ID", questionId);
			opt_pd.put("OPTION_CODE", bianma[i]);
			opt_pd.put("OPTION_CONTENT", contents[i]);
			opt_pd.put("SORT_NUM", i+1);
			opt_pd.put("CREATETIME",  Tools.date2Str(new Date()));
			opt_pd.put("CREATEUSER", userName);
			opt_pd.put("UPDATETIME",  Tools.date2Str(new Date()));
			opt_pd.put("UPDATEUSER", userName);
			examOptService.save(opt_pd);
		}
		mv.addObject("pd",pd);
		mv.addObject("optList",examOptService.listByQuestionId(questionId));
		mv.setViewName("hlsd/examinfo/examinfo_view");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 删除ExamInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		examOptService.delete(pd);
		examinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改ExamInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		examinfoService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表ExamInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = examinfoService.list(page);	//列出ExamInfo列表
		mv.setViewName("hlsd/examinfo/examinfo_list");
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
		mv.setViewName("hlsd/examinfo/examinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去详情页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goView")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = examinfoService.findById(pd);	//根据ID读取
		mv.setViewName("hlsd/examinfo/examinfo_view");
		mv.addObject("pd", pd);
		mv.addObject("optList",examOptService.listByQuestionId(pd.getString("QUESTION_ID")));
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除ExamInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			examinfoService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出ExamInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("编号");	//1
		titles.add("题型");	//2
		titles.add("题目描述");	//3
		titles.add("正确答案");	//4
		titles.add("加入考试(0否  1是)");	//5
		titles.add("创建时间");	//6
		titles.add("创建人");	//7
		titles.add("修改时间");	//8
		titles.add("修改人");	//9
		dataMap.put("titles", titles);
		List<PageData> varOList = examinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("QUESTION_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("QUESTION_TYPE"));	    //2
			vpd.put("var3", varOList.get(i).getString("QUESTION_NAME"));	    //3
			vpd.put("var4", varOList.get(i).getString("RIGHT_ANSWERS"));	    //4
			vpd.put("var5", varOList.get(i).get("JOIN_EXAM").toString());	//5
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
	
	
	/**
	 * 批量修改加入exam
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateJoinExam")
	@ResponseBody
	public Object updateJoinExam() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量设置加入题库 ExamInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		String joinStatu = pd.getString("joinStatu");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			if("0".equals(joinStatu)){
				examinfoService.updateJoinExamExit(ArrayDATA_IDS);
			}else{
				examinfoService.updateJoinExam(ArrayDATA_IDS);
			}
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	
	//=============================================查询考试结果========================================================
	
	@RequestMapping(value="/list_result")
	public ModelAndView list_result(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"考试结果 ExamInfo");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = horseManService.horseManExamListPage(page);
		mv.setViewName("hlsd/examinfo/examinfo_result");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	@RequestMapping(value="/goOperate")
	public ModelAndView goOperate()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = horseManService.findById(pd);	//根据ID读取
		mv.setViewName("hlsd/examinfo/examinfo_result_operate");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
