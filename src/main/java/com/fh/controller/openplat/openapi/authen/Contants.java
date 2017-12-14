/**
 * Title: 请求接口返回参数状态说明
 * fileName: Contants.java
 * @author zhangWenChao 张文超
 * @Created on 2017年6月26日 上午11:44:28
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.controller.openplat.openapi.authen;

public class Contants {
	
	public static String TOKENISOUT = "-100"; //token过期
	
	public static String NOTHREEKEYS = "-101"; //appid openid appkey 配置不正确或不一致
	
	public static String NOTIMESTAMP = "-102"; //timestamp不能为空
	
	public static String ERRORTIMESTAMP = "-103"; //timestamp时间不正确
	
	public static String CALCERROR = "-104"; //经纬度设置错误或不在范围
	
	public static String SIGNERROR = "-105"; //sign验证失败
	
	public static String PARAMERROR = "-106"; //请求参数错误
	
	public static String HASGRABED = "-107"; //该单已被其他司机抢了
}
