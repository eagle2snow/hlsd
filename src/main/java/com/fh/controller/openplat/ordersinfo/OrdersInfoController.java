package com.fh.controller.openplat.ordersinfo;

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
import com.fh.service.openplat.ordersdetail.OrdersDetailManager;
import com.fh.service.openplat.ordersinfo.OrdersInfoManager;
import com.fh.service.openplat.orderstatus.OrderStatusManager;
import com.fh.service.openplat.ordersteps.OrderStepsManager;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

import net.sf.json.JSONArray;

/** 
 * 说明：订单信息管理
 * 创建人：ZhangWenchao
 * 创建时间：2017-07-06 17:04
 */
@Controller
@RequestMapping(value="/ordersinfo")
public class OrdersInfoController extends BaseController {
	
	String menuUrl = "ordersinfo/list.do"; //菜单地址(权限用)
	@Resource(name="ordersinfoService") //主订单信息
	private OrdersInfoManager ordersinfoService;
	
	@Resource(name="orderstatusService")//订单状态
	private OrderStatusManager orderstatusService;
	
	@Resource(name="orderStepsService")//订单步骤
	private OrderStepsManager orderStepsService;
	
	//子订单信息
	@Resource(name="ordersdetailService")
	private OrdersDetailManager ordersdetailService;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表OrdersInfo");
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
		List<PageData>	varList = ordersinfoService.list(page);	//列出OrdersInfo列表
		List<PageData> statusList = orderstatusService.listAll(null);//列出所有的订单状态码
		mv.setViewName("openplat/ordersinfo/ordersinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("statusList", statusList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());//按钮权限
		return mv;
	}
	
	 /**去详情页面tab页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goView")
	public ModelAndView goView()throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("openplat/ordersinfo/ordersinfo_tab");
		mv.addObject("XH", pd.getString("XH"));
		mv.addObject("orderId", pd.getString("orderId"));
		return mv;
	}
	
	@RequestMapping(value="/goJbxx")
	public ModelAndView goJbxx()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if("jbxx".equals(pd.getString("pageTab"))){
			pd = this.getPageData();
			pd = ordersinfoService.findById(pd);
			mv.addObject("pd", pd);
			mv.setViewName("openplat/ordersinfo/ordersinfo_view");
		}else if("detail".equals(pd.getString("pageTab"))){
			String orderId = pd.getString("orderId");
			List<PageData> detailList = ordersdetailService.findByOrderId(orderId);
			mv.addObject("detailList", detailList);
			mv.setViewName("openplat/ordersinfo/ordersinfo_detail");
		}
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
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("订单号");		//1
		titles.add("下单用户");	//2
		titles.add("下单时间");	//3
		titles.add("发货人姓名");	//4
		titles.add("发货人电话");	//5
		titles.add("承运司机编号");//6
		titles.add("速运类型");	//7
		titles.add("订单状态");	//8
		titles.add("订单总价");	//9
		titles.add("订单总里程");	//10
		titles.add("支付状态");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = ordersinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ORDERID"));	        //1
			vpd.put("var2", varOList.get(i).getString("USERID"));	        //2
			vpd.put("var3", varOList.get(i).get("ORDERTIME").toString());	//3
			vpd.put("var4", varOList.get(i).getString("SENDERNAME"));	    //4
			vpd.put("var5", varOList.get(i).getString("SENDERPHONE"));	    //5
			vpd.put("var6", varOList.get(i).getString("DRIVERID"));	        //6
			String expressType = varOList.get(i).getString("EXPRESSTYPE");
			if("1".equals(expressType)){
				expressType = "汽车";
			}else{
				expressType = "骑手";
			}
			vpd.put("var7", expressType);	                                //7
			vpd.put("var8", varOList.get(i).get("STATUNAME").toString());	//8
			vpd.put("var9", varOList.get(i).get("ORDERPRICE").toString());	//9
			vpd.put("var10", varOList.get(i).get("ORDERMILEAGE").toString());//10
			String payStatu = varOList.get(i).getString("PAYSTATUS");
			if("1".equals(payStatu)){
				payStatu = "已支付";
			}else{
				payStatu = "未支付";
			}
			vpd.put("var11", payStatu);	    //11
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	/**
	 * 获取订单步骤
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/getOrderSteps")
	@ResponseBody
	public void getOrderSteps() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"获取订单步骤");
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> orderSteps = orderStepsService.findByOrderId(pd);
		this.writeJson(JSONArray.fromObject(orderSteps).toString());
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
