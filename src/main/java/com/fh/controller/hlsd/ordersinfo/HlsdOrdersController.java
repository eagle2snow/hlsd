package com.fh.controller.hlsd.ordersinfo;

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
import com.fh.service.hlsd.ordersinfo.HlsdOrdersManager;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
 * 说明：订单信息管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-07-06 17:04
 */
@Controller
@RequestMapping(value="/hlsdorders")
public class HlsdOrdersController extends BaseController {
	
	String menuUrl = "hlsdorders/list.do"; //菜单地址(权限用)
	@Resource(name="hlsdOrdersService") //主订单信息
	private HlsdOrdersManager hlsdOrdersService;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 列表OrdersInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//关键词检索条件
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = hlsdOrdersService.list(page);	//列出OrdersInfo列表
		/**
		 * 计算订单数量和订单价格
		 */
		PageData pd1 = new PageData();
		pd1.put("userId", pd.get("userId"));
		pd1.put("lastStart", pd.get("lastStart"));
		pd1.put("lastEnd", pd.get("lastEnd"));
		pd1.put("province", pd.get("province"));
		pd1.put("city", pd.get("city"));
		pd1.put("orderStatus", pd.get("orderStatus"));
		pd1.put("keywords", pd.getString("keywords"));
		PageData data = hlsdOrdersService.findOrderCount(pd1);
		Object allMoney = data.get("allMoney");
		if(allMoney==null)allMoney = 0;
		mv.addObject("allMoney", allMoney);
		mv.addObject("orderCnt", data.get("orderCnt"));
		
		mv.setViewName("hlsd/ordersinfo/ordersinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());//按钮权限
		return mv;
	}
	
	
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出OrdersInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//关键词检索条件
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单号");
		titles.add("下单时间");
		titles.add("配送员姓名");
		titles.add("配送员手机");
		titles.add("订单状态");
		titles.add("订单总价");
		titles.add("订单里程(km)");
		titles.add("下单用户");
		titles.add("发货地");
		titles.add("收货地");
		
		dataMap.put("titles", titles);
		List<PageData> varOList = hlsdOrdersService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("orderId"));
			vpd.put("var2", varOList.get(i).getString("createTime"));
			vpd.put("var3", varOList.get(i).getString("username"));
			vpd.put("var4", varOList.get(i).getString("driverMobileNo"));
			String orderStatus = varOList.get(i).getString("orderStatus");
			if("8".equals(orderStatus)){
				orderStatus = "已签收";
			}else if("9".equals(orderStatus)){
				orderStatus = "已评价";
			}else if("13".equals(orderStatus)){
				orderStatus = "已完成";
			}
			vpd.put("var5", orderStatus);
			vpd.put("var6", varOList.get(i).get("allPrice").toString());
			vpd.put("var7", varOList.get(i).get("mileage").toString());
			vpd.put("var8", varOList.get(i).getString("nickName"));
			vpd.put("var9", varOList.get(i).getString("sendAddress"));
			vpd.put("var10", varOList.get(i).getString("receiverAddress"));
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	
	/**
	 * 跳转到财务结算页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/horseListPage")
	public ModelAndView horseListPage(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 财务结算");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = hlsdOrdersService.horseListPage(page);
		mv.setViewName("hlsd/ordersinfo/financial_list");
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		mv.addObject("QX",Jurisdiction.getHC());//按钮权限
		return mv;
	}
	
	
	/**
	 * 跳转到结算页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goSettleAccount")
	public ModelAndView goSettleAccount()throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("hlsd/ordersinfo/financial_edit");
		mv.addObject("money", pd.getString("money"));
		mv.addObject("userId", pd.getString("userId"));
		return mv;
	}
	
	
	/**
	 * 通过骑手id和时间段查询订单数量和订单金额
	 * @throws Exception
	 */
	@RequestMapping(value="/findOrderCount")
	@ResponseBody
	public void findOrderCount() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData data = hlsdOrdersService.findOrderCount(pd);
		JSONObject json = new JSONObject();
		Object allMoney = data.get("allMoney");
		if(allMoney==null)allMoney = 0;
		json.put("allMoney", allMoney);
		json.put("orderCnt", data.get("orderCnt"));
		this.writeJson(json.toString());
	}
	
	
	@RequestMapping(value="/updateUserMoney")
	@ResponseBody
	public void updateUserMoney() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = new JSONObject();
		try {
			//更新金额
			PageData pd1 = new PageData();
			String userId = pd.getString("userId");
			String settlementMoney = pd.getString("settlementMoney");
			pd1.put("settlementMoney", settlementMoney);
			pd1.put("userId", userId);
			hlsdOrdersService.editUserMoney(pd1);
			
			//保存交易记录
			PageData pd2 = new PageData();
			pd2.put("Id", this.get32UUID());
			pd2.put("userId", userId);
			pd2.put("transactionAmount", settlementMoney);
			pd2.put("creater", Jurisdiction.getUsername());
			hlsdOrdersService.saveTransactionHistory(pd2);
			
			json.put("result", true);
		} catch (Exception e) {
			this.logger.error("结算出错 "+e.getLocalizedMessage());
			json.put("result", false);
		}
		this.writeJson(json.toString());
	}
	
	
	
	/**
	 * 查询今天、昨天、和历史以来所有的订单数量和金额
	 * @throws Exception
	 */
	@RequestMapping(value="/findOrderAllCountAndMoney")
	@ResponseBody
	public void findOrderAllCountAndMoney() throws Exception{
		List<PageData> today = hlsdOrdersService.findTodayOrder();
		List<PageData> tomm = hlsdOrdersService.findTomorrowOrder();
		List<PageData> all = hlsdOrdersService.findAllOrder();
		JSONObject json = new JSONObject();
		
		JSONArray today_arr = new JSONArray();
		for (int i = 0; i < today.size(); i++) {
			PageData pd = today.get(i);
			JSONObject js = new JSONObject();
			String province = pd.getString("province");
			if(province.length()==3){
				province = province.substring(0, 2);
			}else if(province.contains("新疆")){
				province = "新疆";
			} else if(province.length()>3){
				province = province.substring(0, 3);
			}
			js.put("name", province);
			js.put("value", "订单量  "+pd.get("orderCnt")+"，金额 "+pd.get("orderMoney")+"元");
			js.put("selected", true);
			today_arr.add(js);
		}
		
		JSONArray tomm_arr = new JSONArray();
		for (int i = 0; i < tomm.size(); i++) {
			PageData pd = tomm.get(i);
			JSONObject js = new JSONObject();
			String province = pd.getString("province");
			if(province.length()==3){
				province = province.substring(0, 2);
			}else if(province.contains("新疆")){
				province = "新疆";
			} else if(province.length()>3){
				province = province.substring(0, 3);
			}
			js.put("name", province);
			js.put("value", "订单量  "+pd.get("orderCnt")+"，金额 "+pd.get("orderMoney")+"元");
			js.put("selected", true);
			tomm_arr.add(js);
		}
		
		JSONArray all_arr = new JSONArray();
		for (int i = 0; i < all.size(); i++) {
			PageData pd = all.get(i);
			JSONObject js = new JSONObject();
			String province = pd.getString("province");
			if(province.length()==3){
				province = province.substring(0, 2);
			}else if(province.contains("新疆")){
				province = "新疆";
			} else if(province.length()>3){
				province = province.substring(0, 3);
			}
			js.put("name", province);
			js.put("value", "订单量  "+pd.get("orderCnt")+"，金额 "+pd.get("orderMoney")+"元");
			js.put("selected", true);
			all_arr.add(js);
		}
		
		json.put("today", today_arr);
		json.put("tomm", tomm_arr);
		json.put("all", all_arr);
		this.writeJson(json.toString());
	}
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
