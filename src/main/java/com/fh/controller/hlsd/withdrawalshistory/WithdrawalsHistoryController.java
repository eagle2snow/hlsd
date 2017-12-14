package com.fh.controller.hlsd.withdrawalshistory;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

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
import com.fh.util.alipay.config.AlipayConfig;
import com.fh.util.alipay.util.AlipayUtils;
import com.fh.util.hlsd.ContentManagerUtils;
import com.fh.util.weixin.utils.GetWxOrderno;
import com.fh.util.weixin.utils.MPConfigUtils;
import com.fh.util.weixin.utils.RequestHandler;
import com.fh.util.weixin.utils.TenpayUtil;
import com.fh.util.weixin.utils.WeixinUtils;
import com.fh.util.Jurisdiction;
import com.fh.service.hlsd.history.TRechangeWithdrawalsHistoryManager;

/** 
 * 说明：流水记录模块
 * 创建人：ZhangWenchao
 * 创建时间：2017-09-18 11:10
 */
@SuppressWarnings("all")
@Controller
@RequestMapping(value="/withdrawalshistory")
public class WithdrawalsHistoryController extends BaseController {
	
	String menuUrl = "withdrawalshistory/list.do"; //菜单地址(权限用)
	@Resource(name="tRechangeWithdrawalsHistoryService")
	private TRechangeWithdrawalsHistoryManager withdrawalshistoryService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增WithdrawalsHistory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("WITHDRAWALSHISTORY_ID", this.get32UUID());	//主键
		withdrawalshistoryService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除WithdrawalsHistory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		withdrawalshistoryService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改WithdrawalsHistory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		withdrawalshistoryService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表WithdrawalsHistory");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = withdrawalshistoryService.list(page);	//列出WithdrawalsHistory列表
		mv.setViewName("hlsd/withdrawalshistory/withdrawalshistory_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/statisticsList")
	public ModelAndView statisticsList(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表History");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = withdrawalshistoryService.datalistPageUserMoney(page);	//列出History列表
		mv.setViewName("hlsd/withdrawalshistory/statistics_list");
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
		mv.setViewName("hlsd/withdrawalshistory/withdrawalshistory_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goCheck")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PAYWAY = pd.getString("PAYWAY");
		String ID = pd.getString("ID");
		pd = withdrawalshistoryService.findById(pd);	//根据ID读取
		boolean flag = false;
		if(PAYWAY.contains("支付宝")){
			flag = AlipayUtils.chickOrderIsAplayPay(ID);
		}else{
			flag = WeixinUtils.query(ID);
		}
		if(flag){
			pd.put("message", "订单已支付");
			pd.put("status", "0");
		}else{
			pd.put("message", "订单未支付");
			pd.put("status", "1");
		}
		mv.setViewName("hlsd/withdrawalshistory/withdrawalshistory_check");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除WithdrawalsHistory");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			withdrawalshistoryService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出WithdrawalsHistory到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("编号");	//1
		titles.add("用户电话");	//2
		titles.add("用户类型");	//3
		//( 0 : 充值1: 提现 2 : 消费 3:提现失败反额 4:配送员收入 5:平台收入 6: 7 :支付押金 8 :邀请 9 :抽成)
		titles.add("记录类型");	//4
		titles.add("金额");	//5
		titles.add("支付方式");	//6
		titles.add("创建时间");	//7
		//(0 : 进行中 1 :成功 2:失败)
		titles.add("状态");	//8
		titles.add("订单id");	//9
		titles.add("备注");	//10
		titles.add("流水编号");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = withdrawalshistoryService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("USERMOBILENO"));	    //2
			vpd.put("var3", getTypeByUserType(varOList.get(i).getString("USERTYPE")));	    //3
			vpd.put("var4", getTypeByTransactionType(varOList.get(i).getString("TRANSACTIONTYPE")));	    //4
			vpd.put("var5", varOList.get(i).get("TRANSACTIONAMOUNT").toString());	    //5
			vpd.put("var6", varOList.get(i).getString("PAYWAY"));	    //6
			vpd.put("var7", varOList.get(i).get("CREATETIME").toString());	    //7
			vpd.put("var8", getMessageByStatus(varOList.get(i).getString("STATUS")));	    //8
			vpd.put("var9", varOList.get(i).getString("ORDERID"));	    //9
			vpd.put("var10", varOList.get(i).getString("REMARK"));	    //10
			vpd.put("var11", varOList.get(i).getString("HISTORYID"));	    //11
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	/**
	 * @Title: getTypeByUserType
	 * @Description: 根据用户类型获取中文的用户类型
	 * @param @param userType
	 * @param @return    
	 * @return String    
	 * @throws
	 */
	private String getTypeByUserType(String userType){
		
		String message = ContentManagerUtils.USER_MESSAGE;
		
		if(ContentManagerUtils.USER_TYPE.equals(userType)){
			
			message = ContentManagerUtils.USER_MESSAGE;
		}else if(ContentManagerUtils.DRIVER_TYPE.equals(userType)){
			
			message = ContentManagerUtils.DRIVER_MESSAGE;
		}else if(ContentManagerUtils.HORSEMAN_TYPE.equals(userType)){
			
			message = ContentManagerUtils.HORSEMAN_MESSAGE;
		}
		
		return message;
	}
	
	/**
	 * @Title: getTypeByTransactionType
	 * @Description: 根据流水类型获取中文的流水类型
	 * @param @return    
	 * @return String    
	 * @throws
	 */
	private String getTypeByTransactionType(String transationType){
		
		String message = ContentManagerUtils.CONSUME_HISTORY_MESSAGE;
		
		if(ContentManagerUtils.RECHARGE_HISTORY_STATUS.equals(transationType)){
			
			message = ContentManagerUtils.RECHARGE_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.WITHDRAW_HISTORY_TYPE.equals(transationType)){
			message = ContentManagerUtils.WITHDRAW_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.CONSUME_HISTORY_STATUS.equals(transationType)){
			message = ContentManagerUtils.CONSUME_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.WITHDRAW_defeated_HISTORY_TYPE.equals(transationType)){
			message = ContentManagerUtils.WITHDRAW_defeated_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.COURIER_INCOME_HISTORY_TYPE.equals(transationType)){
			message = ContentManagerUtils.COURIER_INCOME_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.PLATFORM_INCOME_HISTORY_TYPE.equals(transationType)){
			message = ContentManagerUtils.PLATFORM_INCOME_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils._HISTORY_TYPE.equals(transationType)){
			message = ContentManagerUtils._HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.CASH_PLEDGE_HISTORY_STATUS.equals(transationType)){
			message = ContentManagerUtils.CASH_PLEDGE_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.INVITE_HISTORY_STATUS.equals(transationType)){
			message = ContentManagerUtils.INVITE_HISTORY_MESSAGE;
		}
		else if(ContentManagerUtils.PRINCIPAL_VACUATE_HISTORY_TYPE.equals(transationType)){
			message = ContentManagerUtils.PRINCIPAL_VACUATE_HISTORY_MESSAGE;
		}
		
		return message;
	}
	
	/**
	 * @Title: getMessageByStatus
	 * @Description: 根据订单状态获取信息
	 * @param @param status
	 * @param @return    
	 * @return String    
	 * @throws
	 */
	private String getMessageByStatus(String status){
		
		String message = "成功";
		
		if("0".equals(status)){
			message = "进行中";
		}else if("1".equals(status)){
			message = "成功";
		}else if("2".equals(status)){
			message = "失败";
		}
		
		return message;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
