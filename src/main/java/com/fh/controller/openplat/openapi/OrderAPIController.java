/**
 * Title: 订单的一些列的API接口控制器
 * fileName: OrderAPIController.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月29日 下午4:56:42
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.controller.openplat.openapi;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.controller.openplat.openapi.authen.Contants;
import com.fh.dao.redis.RedisDao;
import com.fh.entity.hlsd.OrderDetailListVO;
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.service.openplat.myapp.MyAppManager;
import com.fh.service.openplat.ordersbuss.PlaceOrderService;
import com.fh.util.Constants;
import com.fh.util.Tools;
import com.fh.util.token.TokenState;
import com.fh.util.token.redis.RedisToken;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/app_openapi")
public class OrderAPIController extends BaseController {
	
	@Resource(name="myappService")
	private MyAppManager myappService;
	
	@Resource(name="placeOrderService")
	private PlaceOrderService placeOrderService;
	
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;
	
	/**
	 * 用户下单
	 * @param orderInfo    主订单对象
	 * @param orderDetails 子订单对象集合
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/createOrder")
	@ResponseBody
	public void createOrder(OrdersInfoVO orderInfo,OrderDetailListVO orderDetailList) throws Exception{
		/*这样可以直接获取到相关的数据,springmvc自动封装
		   System.out.println(orderInfo.getUserId() +" <==========下单用户");
			System.out.println("共有 "+orderDetailList.getOrderDetailList().size() +"子订单");
			for (int i=0;i<orderDetailList.getOrderDetailList().size();i++) {
				OrdersDetailVO detailVO = orderDetailList.getOrderDetailList().get(i);
				System.out.println(detailVO.getConsigneeName() +" <========收货人姓名");
			}
		*/
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			json = placeOrderService.createOrder(orderInfo, orderDetailList,null);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
	/**
	 * 取消订单，orderInfo包含字段userId 和  validToken、orderId、appid
	 * @param orderInfo
	 * @throws Exception
	 */
	@RequestMapping(value="/cancelOrder")
	@ResponseBody
	public void cancelOrder(OrdersInfoVO orderInfo) throws Exception{
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			json = placeOrderService.cancelOrder(orderInfo);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
	
	/**
	 * 更新订单状态
	 * @param orderInfo
	 * @param stepsVO
	 * @throws Exception
	 */
	@RequestMapping(value="/updateOrderStatu")
	@ResponseBody
	public void updateOrderStatu(OrdersInfoVO orderInfo,OrdersStepsVO stepsVO) throws Exception{
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			json = placeOrderService.updateOrderStatu(orderInfo, stepsVO);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
	/**
	 * 更新订单支付状态
	 * @param orderInfo
	 * @throws Exception
	 */
	@RequestMapping(value="/updateOrderPayStatu")
	@ResponseBody
	public void updateOrderPayStatu(OrdersInfoVO orderInfo) throws Exception{
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			json = placeOrderService.updateOrderPayStatu(orderInfo);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
	
	/**
	 * 更新承运司机编号和订单状态为司机已接单状态
	 * @param orderInfo
	 * @throws Exception
	 */
	@RequestMapping(value="/updateOrderDriver")
	@ResponseBody
	public void updateOrderDriver(OrdersInfoVO orderInfo) throws Exception{
		String validId = orderInfo.getAppid()+"_"+orderInfo.getUserId();
		if(!Tools.isEmpty(orderInfo.getMd5Key())){
			validId = orderInfo.getMd5Key()+"_"+orderInfo.getUserId();
		}
		TokenState result  = RedisToken.valideToken(validId, orderInfo.getValidToken(),redisDaoImpl);
		JSONObject json = new JSONObject();
		if(result ==TokenState.VALID){
			json = placeOrderService.updateOrderDriver(orderInfo);
		}else{
			json.put("result", false);
			json.put("code", Contants.TOKENISOUT);
			json.put(Constants.RESP_MSG, "登录认证已过期");
		}
		this.writeJson(json.toString());
	}
	
}
