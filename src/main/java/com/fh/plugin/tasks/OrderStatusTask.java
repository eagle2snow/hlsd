/**
 * Title: 订单过期状态更新定时器
 * fileName: OrderStatusChangeTask.java
 * @author zhangWenChao 张文超
 * @Created on 2017年8月8日 下午12:00:05
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.plugin.tasks;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.fh.entity.hlsd.OrdersStepsVO;
import com.fh.openplat.OrderUtils;
import com.fh.service.openplat.ordersinfo.OrdersInfoManager;
import com.fh.service.openplat.ordersinfo.impl.OrdersInfoService;
import com.fh.service.openplat.ordersteps.OrderStepsManager;
import com.fh.service.openplat.ordersteps.impl.OrderStepsService;
import com.fh.util.PageData;
import com.fh.util.Tools;

@Component
public class OrderStatusTask {
	
	private static Logger logger = Logger.getLogger(OrderStatusTask.class);
	
    //@Scheduled(cron = "0/30 * * * * ? ") // 间隔30秒执行
    public void taskCycle() {
    	logger.info("每30s检测一次订单是否过期 ");
    	try {
    		OrdersInfoManager ordersinfoService = (OrdersInfoManager) Tools.getSpringBean(OrdersInfoService.class);
    		OrderStepsManager orderStepsService = (OrderStepsManager) Tools.getSpringBean(OrderStepsService.class);
    		
	    	List<PageData> datas = ordersinfoService.listSecondMiniteData();
	    	for (int i = 0; i < datas.size(); i++) {
				PageData pd = datas.get(i);
				String orderId = pd.getString("ORDERID");
				String userId = pd.getString("USERID");
				//第一步：更新主订单状态
				ordersinfoService.updateOrderStatus(orderId, 11);
				//第二步：更新订单步骤表
				OrdersStepsVO stepsVo = OrderUtils.getOrderStepVO(orderId, "11","订单已过期", "订单已过期", userId);
				orderStepsService.save(stepsVo);
				
			}
    	} catch (Exception e) {
    		logger.error("定时任务执行错误，"+e.getLocalizedMessage());
			e.printStackTrace();
		}
    }
}

