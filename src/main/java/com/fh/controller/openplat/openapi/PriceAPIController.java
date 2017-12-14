/**
 * Title: 价格查询的API控制器处理类
 * fileName: PriceAPIController.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月24日 上午9:58:20
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
import com.fh.entity.hlsd.OrdersInfoVO;
import com.fh.service.openplat.myapp.MyAppManager;
import com.fh.service.openplat.ordersbuss.OrderPriceService;
import com.fh.service.openplat.ordersbuss.PriceListVO;
import com.fh.util.Constants;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.token.TokenState;
import com.fh.util.token.redis.RedisToken;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/app_openapi")
public class PriceAPIController extends BaseController {
	
	@Resource(name="myappService")
	private MyAppManager myappService;
	
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;
	
	/**
	 * 查询获取订单价格的API接口
	 * @throws Exception
	 */
	@RequestMapping(value="/getOrderPrice")
	@ResponseBody
	public void getOrderPrice(OrdersInfoVO orderInfo,PriceListVO priceList) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		logBefore(logger, pd.getString("appid")+" 请求获取订单价格的API接口");
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
	
}
