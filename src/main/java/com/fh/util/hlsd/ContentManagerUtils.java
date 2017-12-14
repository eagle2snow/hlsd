package com.fh.util.hlsd;

import com.fh.util.Tools;

public class ContentManagerUtils {

	public static final Double MIN_WITHDRAWS_MONEY = 1D;
	/**
	 * 支付宝
	 */
	public static final String ALIPAY_CODE = "1";
	
	/**
	 * 微信
	 */
	public static final String WEIXIN_CODE = "2";
	
	/**
	 * 微信应用id
	 */
	public static final String WEIXIN_APPID = Tools.getProperty("WEIXIN_APP_ID", "");
	
	/**
	 * 微信
	 */
	public static final String WEIXIN_APP_SECRET = Tools.getProperty("APP_SECRET", "");
	
	/**
	 * 微信商户号
	 */
	public static final String WEIXIN_MCH_ID = Tools.getProperty("WEIXIN_MCH_ID", "");
	
	/**
	 * 微信key
	 */
	public static final String WEIXIN_API_KEY = Tools.getProperty("WEIXIN_API_KEY", "");
	
	/**
	 * 微信扩展字段
	 */
	public static final String WEIXIN_PACKAGE = "Sign=WXPay";
	
	/**
	 * 微信回调函数
	 */
	public static final String WEIXIN_NOTIFY_URL = Tools.getProperty("WEIXIN_NOTIFY_URL", "");
	
	
	/**
	 * 微信支付第三接口
	 */
	public static final String UFDODER_URL = Tools.getProperty("UFDODER_URL", "");
	/**
	 * 响应状态码
	 */
	public static final String RESPONSE_CODE = "responseCode";
	
	/**
	 * 请求方式
	 */
	public static final Integer HTTP_POST = 1;
	public static final Integer HTTP_GET = 0;
	
	public static final String CHARACTER_ENCODING = "UTF-8";
	/**
	 * 响应信息
	 */
	public static final String RESPONSE_MESSAGE = "responseMessage";
	/**
	 * 响应内容
	 */
	public static final String RESPONSE_CONTENT = "responseContent";
	/**
	 * 成功响应码
	 */
	public static final Integer RESPONSE_CODE_SUCCESS = 0;
	/**
	 * 失败响应码
	 */
	public static final Integer RESPONSE_CODE_FILE = 1;
	
	/**
	 * 修改数据库信息返回状态
	 */
	public static final String UPDATE_SUCCESS = "1";
	public static final String UPDATE_FILE = "0";
	
	/**
	 * 骑手考试状态
	 */
	public static final String HORSEMAN_EXAMINE_SUCCESS = "1";
	public static final String HORSEMAN_EXAMINE_FILE = "2";
	
	/**
	 * 骑手的状态
	 */
	public static final String HORSEMAN_REGIST_STATUS = "1";             //注册
	public static final String HORSEMAN_APPROVE_DISPOSE_STATUS = "2";    //认证进行中
	public static final String HORSEMAN_APPROVE_SUCCESS_STATUS = "3";    //认证成功
	public static final String HORSEMAN_APPROVE_FAIL_STATUS = "4";       //认证失败
	public static final String HORSEMAN_EXAMINE_SUCCESS_STATUS = "5";    //考试通过
	public static final String HORSEMAN_EXAMINE_FAIL_STATUS = "6";       //考试失败
	public static final String HORSEMAN_TRAIN_SUCCESS_STATUS = "7";      //培训通过
	public static final String HORSEMAN_TRAIN_FAIL_STATUS = "8"; 		 //培训不通过
	public static final String HORSEMAN_PAY_DEPOSIT_STATUS = "9";        //已交押金
	
	public static final String HORSEMAN_INVITE_HTML_URL = "/web/shall/index.html";
	public static final String HORSEMAN_INVITE_PICTURE_URL = "/uploadFiles/upload/yaoqing.png";
	public static final String HORSEMAN_INVITE_USERPHOTO = "/uploadFiles/upload/touxiang.png";
	
	public static final String CASH_PLEDGE_MESSAGE = "有专业的箱子才可接蛋糕等优质单";
	
	public static final String CASH_PLEDGE_TRANSACTIONTYPE = "7";//支付押金
	
	public static final String ALIPAY = "支付宝";
	public static final String WEIXIN = "微信";
	
	public static final String JOIN_EXAM = "1";
	
	public static final String NOT_JOIN_EXAM = "0";
	
	public static final String ADD_SCALE_SCORE_TYPE = "0";//添加等级分数的类型
	public static final String MINUS_SCALE_SCORE_TYPE = "1";//减等级分数的类型
	
	public static final Integer START_SCALE_SCORE = 0;//用户开始等级分数
	
	public static final String DIAMOND_HORSEMAN = "DIAMOND_HORSEMAN";//钻石骑手
	public static final String SILVER_HORSEMAN = "SILVER_HORSEMAN";//白银骑手
	public static final String PRACTICE_HORSEMAN = "PRACTICE_HORSEMAN";//实习骑手
	public static final String GOLD_HORSEMAN = "GOLD_HORSEMAN";//黄金骑手
	public static final String EXTREME_HORSEMAN = "EXTREME_HORSEMAN";//至尊骑手
	
	public static final String DIAMOND_HORSEMAN_PICTURE = "/uploadFiles/upload/scale/diamond.png";
	public static final String SILVER_HORSEMAN_PICTURE = "/uploadFiles/upload/scale/silver.png";
	public static final String PRACTICE_HORSEMAN_PICTURE = "/uploadFiles/upload/scale/practice.png";
	public static final String GOLD_HORSEMAN_PICTURE = "/uploadFiles/upload/scale/gold.png";
	public static final String EXTREME_HORSEMAN_PICTURE = "/uploadFiles/upload/scale/extreme.png";
	
	public static final Integer[] WEEK_ARR = {1,2,3};//星期
	public static final Integer WEEK = 3;//星期
	/**
	 * 流水类型与信息
	 * */
	public static final String RECHARGE_HISTORY_STATUS = "0";//充值的流水类型
	public static final String WITHDRAW_HISTORY_TYPE = "1";//提现的流水类型
	public static final String CONSUME_HISTORY_STATUS = "2";//用户支付的流水类型
	public static final String WITHDRAW_defeated_HISTORY_TYPE = "3";//提现失败反额的流水类型
	public static final String COURIER_INCOME_HISTORY_TYPE = "4";//配送元收入的流水类型
	public static final String PLATFORM_INCOME_HISTORY_TYPE = "5";//平台收入的流水类型
	public static final String _HISTORY_TYPE = "6";//未知的流水类型
	public static final String CASH_PLEDGE_HISTORY_STATUS = "7";//支付押金流水类型
	public static final String INVITE_HISTORY_STATUS = "8";     //邀请流水类型
	public static final String PRINCIPAL_VACUATE_HISTORY_TYPE = "9";//负责人抽成的流水类型
	
	public static final String RECHARGE_HISTORY_MESSAGE = "充值";//充值的流水类型
	public static final String WITHDRAW_HISTORY_MESSAGE = "提现";//提现的流水类型
	public static final String CONSUME_HISTORY_MESSAGE = "消费";//用户支付的流水类型
	public static final String WITHDRAW_defeated_HISTORY_MESSAGE = "提现失败返现";//提现失败反额的流水类型
	public static final String COURIER_INCOME_HISTORY_MESSAGE = "配送员收入";//配送元收入的流水类型
	public static final String PLATFORM_INCOME_HISTORY_MESSAGE = "平台收入";//平台收入的流水类型
	public static final String _HISTORY_MESSAGE = "财务结算";//未知的流水类型
	public static final String CASH_PLEDGE_HISTORY_MESSAGE = "支付押金";//支付押金流水类型
	public static final String INVITE_HISTORY_MESSAGE = "邀请";     //邀请流水类型
	public static final String PRINCIPAL_VACUATE_HISTORY_MESSAGE = "抽成";//负责人抽成的流水类型
	
	/**
	 * 用户类型与信息
	 * */
	public static final String USER_TYPE = "1";
	public static final String DRIVER_TYPE = "2";
	public static final String HORSEMAN_TYPE = "5";
	
	public static final String USER_MESSAGE = "用户";
	public static final String DRIVER_MESSAGE = "司机";
	public static final String HORSEMAN_MESSAGE = "骑手";
	public static final String BIND_CODE = "1";//绑定类型
	public static final String UNBIND_CODE = "2";//解绑类型
}
