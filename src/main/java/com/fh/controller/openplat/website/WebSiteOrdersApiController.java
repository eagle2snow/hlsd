/**
 * fileName: WebSiteApiController.java
 * @author zhangWenChao 张文超
 * @Created on 2017年7月10日 下午6:02:46
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.controller.openplat.website;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.controller.openplat.openapi.authen.Contants;
import com.fh.controller.weixin.pay.util.MD5Util;
import com.fh.dao.redis.RedisDao;
import com.fh.entity.Page;
import com.fh.entity.hlsd.OrderDetailListVO;
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.openplat.OrderUtils;
import com.fh.service.openplat.coupon.CouponManager;
import com.fh.service.openplat.ordersbuss.OrderPriceService;
import com.fh.service.openplat.ordersbuss.PlaceOrderService;
import com.fh.service.openplat.ordersbuss.PriceListVO;
import com.fh.service.openplat.ordersdetail.OrdersDetailManager;
import com.fh.service.openplat.ordersinfo.OrdersInfoManager;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.util.Constants;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.token.TokenState;
import com.fh.util.token.redis.RedisToken;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/app_openapi")
public class WebSiteOrdersApiController extends BaseController {
	
	//订单信息
	@Resource(name="ordersinfoService")
	private OrdersInfoManager ordersinfoService;
	
	//子订单信息
	@Resource(name="ordersdetailService")
	private OrdersDetailManager ordersdetailService;
	
	//下单
	@Resource(name="placeOrderService")
	private PlaceOrderService placeOrderService;
	
	//优惠券
	@Resource(name="couponService")
	private CouponManager couponService;
	
	//redis缓存
	@Resource(name = "redisDaoImpl") 
	private RedisDao redisDaoImpl;
	
	//APP用户表
	@Resource(name = "appuserService") 
	private AppuserManager appuserService;
	
	/**
	 * 用户下单
	 * @param orderInfo    主订单对象
	 * @param orderDetails 子订单对象集合
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/createMyOrder")
	@ResponseBody
	public void createMyOrder(OrdersInfoVO orderInfo,OrderDetailListVO orderDetailList) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			//计算有优惠券的情况
			String couponXh = pd.getString("couponXh");
			String userXh = pd.getString("userXh");//用户表的主键
			PageData couponPd = couponService.findById(couponXh);
			if(couponPd!=null){
				float preferentialAmount = Float.parseFloat(couponPd.get("COUPONMONEY").toString());
				//1表示直接优惠金额卷，2表示优惠折扣券：折扣券的功能先放着不做，如果做需要涉及到总订单金额打折，需要到createOrder里面去实现
				/*if("2".equals(couponPd.getString("COUPONTYPE"))){
					float discount = Float.parseFloat(couponPd.getString("DISCOUNT"));
				}*/
				orderInfo.setPreferentialAmount(preferentialAmount);
				orderInfo.setPreferentialType(couponPd.getString("COUPONNAME"));
				
				//调用互连速递的优惠券
			}else{
				couponXh = ""; //置空无效的优惠id
			}
			Map<String, String> map = new HashMap<String, String>();
			map.put("couponXh", couponXh);
			map.put("userXh", userXh);
			json = placeOrderService.createOrder(orderInfo, orderDetailList,map);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
	/**
	 * 查询我的订单
	 * @param orderInfo
	 * @throws Exception
	 */
	@RequestMapping(value="/selectMyOrders")
	@ResponseBody
	public void selectMyOrders(OrdersInfoVO orderInfo) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		JSONObject json = new JSONObject();
		try {
			String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
			if(!Tools.isEmpty(orderInfo.getMd5Key())){
				validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
			}
			TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
			if(result ==TokenState.VALID){
				pd.put("orderUserId",orderInfo.getUserId());//只查询筛选当前用户的订单
				String keywords = pd.getString("keywords");	//关键词检索条件
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				String apiStatus = "('0','1','2','3','4','5','6','7','8','9','10','11','12','13')";
				String paramStatu = pd.getString("apiStatus");
				if(!Tools.isEmpty(paramStatu) && "1".equals(paramStatu)){//待取货
					apiStatus = "('1','2','3','4','5')";
				}
				if(!Tools.isEmpty(paramStatu) && "2".equals(paramStatu)){//进行中
					apiStatus = "('6','7','10')";
				}
				if(!Tools.isEmpty(paramStatu) && "3".equals(paramStatu)){//已过期
					apiStatus = "('0','11')";
				}
				if(!Tools.isEmpty(paramStatu) && "4".equals(paramStatu)){//待评价
					apiStatus = "('8')";
				}
				pd.put("apiStatus", apiStatus);
				Page page = new Page();
				String currentPage = "1";
				String showCount = "5";
				if(!Tools.isEmpty(pd.getString("currentPage"))){
					currentPage = pd.getString("currentPage");
				}
				if(!Tools.isEmpty(pd.getString("showCount"))){
					showCount = pd.getString("showCount");
				}
				page.setCurrentPage(Integer.parseInt(currentPage));
				page.setShowCount(Integer.parseInt(showCount));
				page.setPd(pd);
				List<PageData> list = ordersinfoService.listForWebSite(page);
				//查询所有大类型订单的条数
				PageData orderTypeCount = ordersinfoService.findUserOrderTypeCount(orderInfo.getUserId());
				List<PageData> resList = new ArrayList<PageData>();
				for (int i = 0; i < list.size(); i++) {
					PageData pg = list.get(i);
					String orderId = pg.getString("ORDERID");
					List<PageData> detailList = ordersdetailService.findByOrderId(orderId);
					pg.put("orderDetailList", detailList);
					resList.add(pg);
				}
				json.put("result", true);
				json.put("totalPage", page.getTotalPage());
				json.put("totalResult", page.getTotalResult());
				json.put("orderTypeCount", orderTypeCount);
				json.put(Constants.RESP_MSG, "获取成功");
				json.put("datas", JSONArray.fromObject(list));
			}else{
				json.put("result", false);
				json.put("code", Contants.TOKENISOUT);
				json.put(Constants.RESP_MSG, "登录认证已过期");
			}
		} catch (Exception e) {
			logger.error(e.getMessage()+" <==查询我的订单出现异常");
			json.put("result", false);
			json.put(Constants.RESP_MSG, "参数错误，出现异常");
			e.printStackTrace();
		}
		this.writeJson(json.toString());
	}
	
	
	/**
	 * 查询获取订单价格的API接口
	 * @throws Exception
	 */
	@RequestMapping(value="/getMyOrderPrice")
	@ResponseBody
	public void getOrderPrice(OrdersInfoVO orderInfo,PriceListVO priceList) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		String userId = pd.getString("userId");
		logBefore(logger, userId+" 请求获取订单价格的API接口");
		try {
			//如果设置了md5Key就表示是内部系统之间的请求
			String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
			if(!Tools.isEmpty(orderInfo.getMd5Key())){
				validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
			}
			TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
			JSONObject json = new JSONObject();
			if(result ==TokenState.VALID){
				json = OrderPriceService.calcOrderFee(priceList,null);
			}else{
				json.put("result", false);
				json.put("code", Contants.TOKENISOUT);
				json.put(Constants.RESP_MSG, "登录认证已过期");
			}
			this.writeJson(json.toString());
		} catch (Exception e) {
			logger.error("请求参数错误,"+e.getLocalizedMessage());
			this.writeJson(false, Contants.PARAMERROR, "请求参数错误,"+e.getLocalizedMessage());
		}
	}
	
	
	/**
	 * 查询我的优惠券
	 * @throws Exception
	 */
	@RequestMapping(value="/getMyCoupons")
	@ResponseBody
	public void getMyCoupons(OrdersInfoVO orderInfo) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			pd.put("USERID", orderInfo.getUserId());
			pd.put("COUPONSTATUS", "1");//优惠券有效的才查出来
			pd.put("COUPONCITY", orderInfo.getSendCity());
			List<PageData> couponsList = couponService.findByUserId(pd);
			json.put("result", true);
			json.put(Constants.RESP_MSG, "获取成功");
			json.put("datas", JSONArray.fromObject(couponsList));
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
	/**
	 * 更新订单状态为已发货
	 * @param orderInfo
	 * @throws Exception
	 */
	@RequestMapping(value="/sureSendGoods")
	@ResponseBody
	public void sureSendGoods(OrdersInfoVO orderInfo) throws Exception{
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderInfo.getOrderId(), "4", 
					orderInfo.getUserId()+" 用户已经确认发货", orderInfo.getUserId()+" 用户已经确认发货", orderInfo.getUserId());
			json = placeOrderService.sureSendGoods(orderInfo, stepsVo);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
	
	
//========================================================给互连速递那边调用=============================================
	/**
	 * 更新订单状态--给互联速递那边使用的
	 * @param orderInfo
	 * @param stepsVO
	 * @throws Exception
	 */
	@RequestMapping(value="/updateOrderStatuForHlsd")
	@ResponseBody
	public void updateOrderStatuForHlsd(OrdersInfoVO orderInfo,OrdersStepsVO stepsVO) throws Exception{
		String md5Key = orderInfo.getMd5Key();
		JSONObject json = new JSONObject();
		String configKey = Tools.getProperty("api_token_key", "");//openplat201707!~_
		if(MD5Util.string2MD5(configKey).equals(md5Key)){
			json = placeOrderService.updateOrderStatu(orderInfo, stepsVO);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证失败");
		}
		this.writeJson(json.toString());
	}
	
	
	/**
	 * 司机抢单
	 * @param orderInfo
	 * @param stepsVO
	 * @throws Exception
	 */
	@RequestMapping(value="/driverGetOrder")
	@ResponseBody
	public void driverGetOrder(OrdersInfoVO orderInfo,OrdersStepsVO stepsVO) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String md5Key = orderInfo.getMd5Key();
		JSONObject json = new JSONObject();
		String configKey = Tools.getProperty("api_token_key", "");//openplat201707!~_
		if(MD5Util.string2MD5(configKey).equals(md5Key)){
			PageData pd1 = new PageData();
			pd1.put("USER_ID", orderInfo.getUserId());
			pd1 = appuserService.findByUiId(pd1);
			if(pd1==null){ //保存到app用户表
				PageData pd2 = new PageData();
				pd2.put("USER_ID",orderInfo.getUserId());
				pd2.put("USERNAME",pd.getString("driverName"));
				pd2.put("PASSWORD",MD5Util.string2MD5(pd.getString("driverMobile")));
				pd2.put("NAME",pd.getString("driverName"));
				String role = "ed4bace08dcb42a98ba639fda08b28bd"; //骑手
				if("2".equals(pd.getString("driverType"))){ //1用户  2 司机   5 骑手
					role = "7f1fc6f4bfd04af6bb966a675e815b33"; //司机
				}
				pd2.put("ROLE_ID",role);
				pd2.put("STATUS","1");
				pd2.put("PHONE",pd.getString("driverMobile"));
				appuserService.saveU(pd2);
			}
			//最后更新订单状态为 司机已接单
			ordersinfoService.updateOrderDriver(orderInfo.getOrderId(), orderInfo.getUserId());
			json = placeOrderService.updateOrderStatu(orderInfo, stepsVO);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证失败");
		}
		this.writeJson(json.toString());
	}
	
}
