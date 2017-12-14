/**
 * Title: 获取订单价格的类，统一调用
 * fileName: GetOrderPrice.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月27日 下午3:04:49
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.service.openplat.ordersbuss;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.fh.controller.openplat.openapi.authen.Contants;
import com.fh.entity.hlsd.OrderDetailListVO;
import com.fh.entity.hlsd.OrdersDetailVO;
import com.fh.openplat.OrderUtils;
import com.fh.util.Constants;
import com.fh.util.Tools;

import net.sf.json.JSONObject;

public class OrderPriceService {
	
	/**
	 * 查询获取订单价格统计方法
	 * @param priceListVO
	 * @return orderDetailList 下单的时候才需要，查询价格传 null就行了
	 * @throws Exception
	 */
	public static JSONObject calcOrderFee(PriceListVO priceListVO,OrderDetailListVO orderDetailList) throws Exception {
		double totalMileage = 0;  //总里程
		double totalFee = 0; //总费用
		double serviceCharge = 0; //上门取货服务费
		String isPickup = "false"; //是否上门取件
		String expressType = "2";
		//起步价,默认骑手后面通过里程大于6公里就改为汽车的价格
		double startPrice = Float.parseFloat(Tools.getProperty("startPrice", "10"));
		JSONObject result = new JSONObject();
		//以下2个变量为了后面每一段的里程没有值就是用前一段的结束经纬度
		String from_lng = "";
		String from_lat = "";
		try {
			for (int i=0;i<priceListVO.getPriceList().size();i++) {
				PriceVO pricevo = priceListVO.getPriceList().get(i);//如果没有开始经纬度就表示是从第二单开始了
				if(Tools.isEmpty(pricevo.getFrom_lng()) || Tools.isEmpty(pricevo.getFrom_lat())){
					pricevo.setFrom_lng(from_lng);
					pricevo.setFrom_lat(from_lat);
				}
				if("蛋糕".equals(pricevo.getGoodsName())){ //蛋糕配送费16
					startPrice = Float.parseFloat(Tools.getProperty("cakeStartPrice", "16"));
				}
				//通过经纬度使用高德API计算里程
				double mileage = OrderUtils.getDistanceBylongAndLat(pricevo.getFrom_lng(), pricevo.getFrom_lat(), pricevo.getTo_lng(), pricevo.getTo_lat());
				if(mileage<=0){//如果小于0就表示高德接口出现问题
					throw new Exception("高德接口请求异常");
				}
				//第一步：获取速运类型、是否上门取货、起步价
				PriceVO vo1 = priceListVO.getPriceList().get(0);
				isPickup = vo1.getPickUp();
				expressType = vo1.getExpressType();//速运类型 1汽车、2骑手
				/*if (totalMileage+mileage > 6 || "1".equals(expressType)) {// 修改起步价,如果里程大于6就默认为汽车订单，起步价是15
					startPrice = Float.parseFloat(Tools.getProperty("carStartPrice", "15"));
					//expressType = "1"; //改为小汽车
				}*/
				//第二步：计算里程费
				double mileFee = getMileageFee(mileage,totalMileage);
				
				//第三步：计算浮动费
				double floatFee = getFloatFee(pricevo.getGoodsVolume(), pricevo.getWeight(), mileage, startPrice, totalMileage);
				
				//第四步：获取夜间费
				double nightFee = getNightFee(mileage,priceListVO.getPriceList().get(0).getAppointmentTime());
				
				//创建订单的时候使用，查询价格的时候不需要,为了封装这3个字段需要插入到数据库里面
				if(orderDetailList!=null){
					OrdersDetailVO detailVO = orderDetailList.getOrderDetailList().get(i);
					detailVO.setMilestonesPayment((double)Math.round(mileFee * 100) / 100);//保留2位小数
					detailVO.setFloatingCharge((double)Math.round(floatFee * 100) / 100);
					detailVO.setNightFee((double)Math.round(nightFee * 100) / 100);
					detailVO.setMileage((double)Math.round(mileage * 100) / 100);
					
					if("蛋糕".equals(detailVO.getGoodsName())){ //蛋糕配送费16
						startPrice = Float.parseFloat(Tools.getProperty("cakeStartPrice", "16"));
					}
				}
				
				//每单单独的费用
				double thisFee = mileFee + floatFee + nightFee;
				if(thisFee<8 && totalMileage>0){//从第二单开始 每单消费不足8元按8元计算
					thisFee = 8;
				}
				totalFee += thisFee;    //总费用加上当前这单的费用
				totalMileage += mileage;//跑过的里程都加到总里程里面
				//为后面单里程段没有开始经度就以上一单的结束的经纬度为开始经纬度
				from_lng = pricevo.getTo_lng();
				from_lat = pricevo.getTo_lat();
			}
			//第五步：计算总费用(前面的总费用+上门取货费+起步价)
			if("1".equals(expressType) && "true".equals(isPickup)){ //如果为小汽车并且需要上门取货就加上取货服务费
				serviceCharge = Float.parseFloat(Tools.getProperty("pickupFee", "10"));
				totalFee += serviceCharge;
			}
			totalFee += startPrice; //最后加上起步价
			
			result.put("result", true);
			result.put("fee", (double) Math.round(totalFee * 100) / 100);
			result.put("feeUnit", "元");
			result.put("distance", (double) Math.round(totalMileage * 100) / 100);
			result.put("distanceUnit","km");
			result.put("startPrice",(double) Math.round(startPrice * 100) / 100);
			result.put("serviceCharge",(double) Math.round(serviceCharge * 100) / 100);
			result.put(Constants.RESP_MSG, "获取成功");
		} catch (Exception e) {
			result.put("result", false);
			result.put("code", Contants.CALCERROR);
			result.put(Constants.RESP_MSG, "经纬度设置错误或不在范围");
		}
		return result;
	}
	
	
	
	
	/**
	 * 计算里程费
	 * @param mileage 	         当前这段里程
	 * @param totalMileage  前面已经跑过的里程,不包括当前里程
	 * @return
	 */
	private static double getMileageFee(double mileage,double totalMileage) {
		if(totalMileage<=0){ //表示是第一段里程
			if (mileage <= 3) {
				return 0d;// 3公里内不收里程费
			} else if (mileage > 3 && mileage <= 15) {
				// 超过三公里，小于等于15公里[(总公里-3公里) * 2元/公里]
				return (mileage - 3) * 2;
			} else {// 超过15公里 15公里内的价格+(总里程-15公里)*(每公里2元+每公里1.5长途费)
				return 12 * 2 + (mileage - 15) * (2 + 1.5);
			}
		}else{ //表示从第二段里程开始所有段里程费的计算方式
			if(mileage+totalMileage<=3){//如果从第二段路程开始还是在3公里内，还是不收里程费
				return 0d;
			}else if(mileage+totalMileage<=15){ //15公里内不加长途费
				return mileage * 2;
			} else{ //超过15公里，需要每公里加1.5元的长途费
				return mileage * (2 + 1.5);
			}
		}
	}
	
	/**
	 * 计算货物的浮动费
	 * @param goodsVolume 物品体积 1代表重量轻，2代表重量中等，3代表重量很重
	 * @param weight 物品重量 kg
	 * @param mileage 当前货物里程
	 * @param startPrice 起步价
	 * @param totalMileage  前面已经跑过的里程,不包括当前里程
	 * @return
	 */
	private static double getFloatFee(int goodsVolume, double weight, double mileage,
			double startPrice,double totalMileage) {
		double fruntPrice = 0;//前期价格
		if(totalMileage<=0){//表示是第一段里程
			//startPrice + (15-3) * 2 + (milage - 15)
			if (mileage <= 3) {
				fruntPrice = startPrice;// 3公里内就只有起步价
			} else if (mileage > 3 && mileage <= 15) {
				// 超过三公里，小于等于15公里[(总公里-3公里) * 2元/公里] + 起步价
				fruntPrice = (mileage - 3) * 2 + startPrice;
			} else {// 超过15公里 (第一单总里程-短途里程)*(里程费+远途费) + 起步价
				fruntPrice = (mileage - 15) * (2 + 1.5) + (15 - 3) * 2 + startPrice;
			}
		}else{ //表示从第二段里程开始所有段浮动费用的计算
			double allMileage = totalMileage + mileage; //包括当前里程在内的总里程
			if(allMileage<=3){
				fruntPrice = startPrice;// 3公里内就只有起步价
			}else if (allMileage>3 && allMileage <= 15) {
				fruntPrice = (allMileage-3) * 2 + startPrice;// 15公里内没有远途费，并且总里程减去起步的3公里
			}else {// 超过15公里  (总里程-起步里程-超过15公里没有远程的公里)*(里程费+远途费)
				fruntPrice = (allMileage-3-15) * (2 + 1.5) + startPrice;
			}
		}
		//这里根据商品的大小和重量计算浮动的比例
		if (weight == 1 && goodsVolume == 1) {
			return 0d;
		} else if (weight == 2 || goodsVolume == 2) {
			return 0.1 * fruntPrice;
		} else if (weight == 3 || goodsVolume == 3) {
			return 0.2 * fruntPrice;
		} else {
			return 0d;
		}
	}
	
	/**
	 * 计算夜间费(晚上23点到次日的凌晨5点需要收取每公里0.5元的夜间费)
	 * @param mileage   总里程
	 * @param yuyueTime 预约时间,如 2017-07-05 23:40:00
	 * @return
	 */
	@SuppressWarnings("deprecation")
	private static double getNightFee(double mileage,String yuyueTime) {
		long millis = System.currentTimeMillis();
		int startTime = Integer.parseInt(Tools.getProperty("nightFeeStartTime", "23"));
		int endTime = Integer.parseInt(Tools.getProperty("nightFeeEndTime", "5"));
		Date date = new Date(millis);
		int hours = date.getHours();
		if(!Tools.isEmpty(yuyueTime)){//如果预约时间不为空就是用预约时间
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
				c.setTime(sdf.parse(yuyueTime));
				hours = c.get(Calendar.HOUR_OF_DAY);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (hours >= startTime || hours < endTime) {
			return mileage * 0.5;
		}
		return 0.0d;
	}
}
