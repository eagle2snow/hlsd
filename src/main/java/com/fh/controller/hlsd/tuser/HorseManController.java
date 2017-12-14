package com.fh.controller.hlsd.tuser;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.fh.service.hlsd.common.CommonManager;
import com.fh.service.hlsd.scale.ScaleScoreManager;
import com.fh.service.hlsd.tcommonscore.TCommonScoreManager;
import com.fh.service.hlsd.tuser.HorseManManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.util.Tools;

import net.sf.json.JSONObject;

/** 
 * 说明：在线考试管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-08-16 11:36
 */
@SuppressWarnings("all")
@Controller
@RequestMapping(value="/hourseman")
public class HorseManController extends BaseController {
	
	String menuUrl = "hourseman/horsemanList.do"; //菜单地址(权限用)
	
	@Resource(name="horseManService")
	private HorseManManager horseManService;
	
	@Resource(name="commonService")
	private CommonManager commonService;
	
	@Resource(name = "scaleScoreService")
	private ScaleScoreManager scaleScoreService;
	
	@Resource(name = "tcommonscoreService")
	private TCommonScoreManager tCommonScoreService;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/horsemanList")
	public ModelAndView horsemanList(Page page) throws Exception{
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
		List<PageData>	varList = horseManService.horseManListPage(page);
		mv.setViewName("hlsd/horseman/horseman_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**
	 * @Title: list
	 * @Description: 气候信息列表
	 * @param @param page
	 * @param @return
	 * @param @throws Exception    
	 * @return ModelAndView    
	 * @throws
	 */
	@RequestMapping(value="/horsemanMessageList")
	public ModelAndView horsemanMessageList(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Horseman");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> commons = tCommonScoreService.listAll(pd);
		List<PageData> scales = scaleScoreService.listAll(pd);
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = horseManService.horsemanMessageListPage(page);	//列出Horseman列表
		pd.put("commons", commons);
		pd.put("scales", scales);
		pd.put("scale", scaleScoreService.findById(pd));
		pd.put("common", tCommonScoreService.findById(pd));
		mv.setViewName("hlsd/horseman/horsemanMessage_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	 /**去审核页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goThrough")
	public ModelAndView goThrough()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = horseManService.findById(pd);	//根据ID读取
		mv.setViewName("hlsd/horseman/horseman_view");
		mv.addObject("pd", pd);
		
		PageData fjxxpd = new PageData();
		fjxxpd.put("REF_ID", pd.getString("userId"));
		fjxxpd.put("FILE_TYPE", "SMRZ");//实名认证类型
		mv.addObject("fjxxList",commonService.listFile(fjxxpd));
		return mv;
	}
	
	
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = horseManService.findById(pd);	//根据ID读取
		mv.setViewName("hlsd/horseman/horseman_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "edit");
		
		PageData fjxxpd = new PageData();
		fjxxpd.put("REF_ID", pd.getString("userId"));
		fjxxpd.put("FILE_TYPE", "SMRZ");//实名认证类型
		mv.addObject("fjxxList",commonService.listFile(fjxxpd));
		return mv;
	}
	/**
	 * @Title: goEditHorsemanMessage
	 * @Description: 调到编辑骑手信息页面
	 * @param @return
	 * @param @throws Exception    
	 * @return ModelAndView    
	 * @throws
	 */
	@RequestMapping(value="/goEditHorsemanMessage")
	public ModelAndView goEditHorsemanMessage()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = horseManService.findById(pd);	//根据ID读取
		mv.setViewName("hlsd/horseman/horsemanMessage_edit");
		mv.addObject("pd", pd);
		mv.addObject("msg", "editHorsemanMessage");
		
		return mv;
	}
	
	
	/**
	 * 更新审核状态
	 * @throws Exception
	 */
	@RequestMapping(value="/updateStatu")
	@ResponseBody
	public void updateStatu() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("updateTime", Tools.date2Str(new Date()));	//修改时间
		pd.put("updater", Jurisdiction.getUsername());	//修改人
		JSONObject json = new JSONObject();
		int row = horseManService.updateUserStatu(pd);
		if(row==1){
			json.put("result", true);
			json.put("msg", "审核成功");
		}else{
			json.put("result", false);
			json.put("msg", "审核失败，请刷新重试");
		}
		this.writeJson(json.toString());
	}
	
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		String loginUser = Jurisdiction.getUsername();
		logBefore(logger, loginUser+"修改骑手信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("updateTime", Tools.date2Str(new Date()));	//修改时间
		pd.put("updater", loginUser);	//修改人
		horseManService.edit(pd);
		return goEdit();
	}
	/**
	 * @Title: editHorsemanMessage
	 * @Description: 修改骑手信息
	 * @param @return
	 * @param @throws Exception    
	 * @return ModelAndView    
	 * @throws
	 */
	@RequestMapping(value="/editHorsemanMessage")
	public ModelAndView editHorsemanMessage() throws Exception{
		String loginUser = Jurisdiction.getUsername();
		logBefore(logger, loginUser+"修改骑手信息");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("updateTime", Tools.date2Str(new Date()));	//修改时间
		pd.put("updater", loginUser);	//修改人
		
		Object scaleScore = pd.get("scaleScore");
		Integer horsemanScaleScore = 0;
		if(scaleScore != null){
			horsemanScaleScore = (int) Double.parseDouble(scaleScore.toString());
			if(horsemanScaleScore < 0){
				horsemanScaleScore = 0;
			}
		}else{
			pd.put("scaleScore", horsemanScaleScore);
		}
		if(pd.get("commentScore") != null){
			Double commentScore = Double.parseDouble(pd.get("commentScore").toString());
			
			if(commentScore <= 0){
				
				commentScore = 0D;
				
				pd.put("isUse", "1");
			}
			pd.put("commonId", tCommonScoreService.getCommonIdByCommonScore(commentScore));
		}else{
			pd.put("commonId", tCommonScoreService.getCommonIdByCommonScore(100D));
			pd.put("commentScore", 100D);
		}
		
		pd.put("scaleId", scaleScoreService.getScaleIdByScaleScore(horsemanScaleScore));
		
		horseManService.updateByPrimaryKeySelective(pd);
		return goEditHorsemanMessage();
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
