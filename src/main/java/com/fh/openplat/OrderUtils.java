/**
 * Title: 校验请求参数，订单需要的相关工具类
 * fileName: CheckParams.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月26日 上午10:03:02
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.openplat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.fh.controller.openplat.openapi.authen.CommonFun;
import com.fh.controller.openplat.openapi.authen.Contants;
import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;
import com.fh.util.express.util.HttpUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class OrderUtils {
	
	// 加密私钥
	private static final String key = "9426db7b6cfd673ea2cbe7b2c6af08fe";
	// 请求url 通过经纬度获取距离
	private static final String ReqURL = "http://restapi.amap.com/v3/direction/driving";
	// 请求url 通过经纬度获取省市区
	private static final String ReqURL1 = "http://restapi.amap.com/v3/geocode/regeo";
	
	/**
	 *  http://restapi.amap.com/v3/geocode/geo?key=您的key&address=易思博大厦&city=深圳
	 *  请求url 通过城市和标注名称，获取经纬度 address: 填写结构化地址信息===> 省份＋城市＋区县＋城镇＋乡村＋街道＋门牌号码
	 *                                   city: 城市名称                 ===> 深圳市、中山市...
	 */
	private static final String ReqURL2 = "http://restapi.amap.com/v3/geocode/geo";
	
	
	/**
	 * 检查认证
	 * @param pd 用户传递的参数，必须包括 timestamp 和 sign 
	 * @param pdata 查询出来的
	 * @return
	 * @throws Exception 
	 */
	public static JSONObject CheckAuthentication(PageData pd,PageData pdata) throws Exception{
		JSONObject result = new JSONObject();
		result.put("result", false);
		String inv = Tools.getProperty("devMode", "true");
		if("true".equals(inv)){ //判断是不是开发测试环境，如果是开发或测试环境就不校验了
			result.put("result", true);
			return result;
		}
		//第一，校验时间格式
		if(pd.containsKey("timestamp")){
			 long fz = 0;
			 try {
				fz = (new Date().getTime() - Long.parseLong(pd.getString("timestamp")))/(1000*60);
			 } catch (NumberFormatException e) {
				e.printStackTrace();
			 }
			 if(fz<0 || fz>5){
				result.put("code", Contants.ERRORTIMESTAMP);
				result.put("msg", "timestamp不正确，和服务器时间差不能超过5分钟.");
				return result;
			 }
		}else{
			result.put("code", Contants.NOTIMESTAMP);
			result.put("msg", "timestamp不能为空.");
			return result;
		}
		//第二，校验appid、openid 是否存在
		if(pdata==null){
			result.put("code", Contants.NOTHREEKEYS);
			result.put("msg", "校验失败,appid/openid/appkey 配置不正确或不一致.");
			return result;
		}
		//第三，检验sign 是否合法，客户端和服务器端生成的进行匹配
		if(pdata!=null){
			Object appkey = pdata.get("APPKEY");
			String sign_server = CommonFun.CreateMd5Sign(pd, appkey.toString());
			String sign_client = pd.getString("sign").toString();
			if(!sign_server.equals(sign_client)){
				result.put("code", Contants.SIGNERROR);
				result.put("msg", "sign验证失败.");
				return result;
			}
		}
		
		//以上校验都通过则为成功
		result.put("result", true);
		result.put("code", "000");
		result.put("msg", "校验成功");
		return result;
	}
	
	

	
	/**
	 * 根据经纬度获取导航的距离(km)
	 * @param from_lng 起点经度
	 * @param from_lat 起点纬度
	 * @param to_lng 终点经度
	 * @param to_lat 终点纬度
	 * <br/>origin_起点[经度,纬度]  ("114.039355,22.323456")
	 * <br/>destination_终点[经度,纬度]  ("114.039355,22.967849")
	 * @return
	 * @throws Exception
	 */
	public static double getDistanceBylongAndLat(String from_lng,String from_lat,String to_lng,String to_lat) 
			throws Exception {
		try {
			String origin = from_lng+","+from_lat;
			String destination = to_lng+","+to_lat;
			Map<String, String> params = new HashMap<String, String>();
			params.put("origin", origin);
			params.put("destination", destination);
			params.put("extensions", "base");
			params.put("strategy", "0");
			params.put("output", "JSON");
			params.put("key", key);
			String result = HttpUtil.sendPost(ReqURL, params);
			JsonConfig jc = new JsonConfig();
			jc.setExcludes(new String[] { "steps", "tolls", "toll_distance", "restriction", "traffic_lights" });
			JSONObject jo = JSONObject.fromObject(result, jc);
			String status = jo.getString("status");
			if ("1".equals(status)) {
				String distance = jo.getJSONObject("route").getJSONArray("paths").getJSONObject(0).getString("distance");
				return Float.parseFloat(distance)/1000; //转成千米km
			}else{
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	/**
	 * 通过经纬度获取查询省市区的代码
	 * @param location [经度,纬度]  ("114.039355,22.323456")
	 * @return
	 * @throws Exception
	 */
	public static JSONObject getAddressByJson(String location) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("location", location);
		params.put("extensions", "base");
		params.put("radius", "1000");
		params.put("output", "JSON");
		params.put("key", key);
		params.put("batch", "false");
		params.put("roadlevel", "0");
		String result = HttpUtil.sendPost(ReqURL1, params);
		JsonConfig jc = new JsonConfig();
		jc.setExcludes(new String[] { "building", "neighborhood" });
		JSONObject jo = JSONObject.fromObject(result, jc);
		String status = jo.getString("status");
		if ("1".equals(status)) {
			JSONObject ob = jo.getJSONObject("regeocode").getJSONObject("addressComponent");
			return ob;
		}else{
			return null;
		}
	}
	
	/**
	 * 通过城市名和标注名获取经纬度
	 * @param city  城市名称
	 * @param address  标注的地址信息 ===> 省份＋城市＋区县＋城镇＋乡村＋街道＋门牌号码
	 * @return
	 * @throws Exception
	 */
	public static JSONObject getLocationJson(String city,String address) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("city", city);
		params.put("address", address);
		params.put("key", key);
		String result = HttpUtil.sendPost(ReqURL2, params);
		JsonConfig jc = new JsonConfig();
		jc.setExcludes(new String[] { "building", "neighborhood" });
		JSONObject jo = JSONObject.fromObject(result, jc);
		JSONArray array = jo.getJSONArray("geocodes");
		if (array.size()>0) {
			String loaction = array.getJSONObject(0).getString("location");
			String [] str = loaction.split(",");
			JSONObject ob = new JSONObject();
			ob.put("lng", str[0]);
			ob.put("lat", str[1]);
			return ob;
		}else{
			return null;
		}
	}
	
	/**
	 * 
	 * @param orderId 订单号
	 * @param StatusCode 步骤状态
	 * @param stepName 步骤名称
	 * @param stepDescribe 步骤描述
	 * @param user 登录或操作的用户ID
	 * @return
	 */
	public static OrdersStepsVO getOrderStepVO(String orderId,String StatusCode,String stepName,
			String stepDescribe,String user){
		OrdersStepsVO vo = new OrdersStepsVO();
		vo.setXh(UuidUtil.get32UUID());
		vo.setOrderId(orderId);
		vo.setOrderStatusCode(StatusCode);
		vo.setStepName(stepName);
		vo.setStepDescribe(stepDescribe);
		vo.setCreateTime(new Date());
		vo.setUpdateTime(new Date());
		vo.setCreateUser(user);
		vo.setUpdateUser(user);
		return vo;
	}
	
	/**
	 * 生成订单号
	 * @return
	 */
	public static String generateOrderId(){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddHHmmssSSS");  
        return sdf.format( new Date())+(int)((Math.random()*9+1)*100000);
	}
	
}
