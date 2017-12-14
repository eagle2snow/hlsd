package com.fh.service.app.hlsd.BD;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.fh.dao.redis.RedisDao;
import com.fh.service.app.APPService;
import com.fh.service.app.IApiService;
import com.fh.service.hlsd.BD.bdmanager.BDManagerManager;
import com.fh.service.hlsd.BD.bduser.BDUserManager;
import com.fh.service.hlsd.history.TRechangeWithdrawalsHistoryManager;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.UuidUtil;
import com.fh.util.hlsd.ContentManagerUtils;
import com.fh.util.token.redis.RedisToken;

import net.sf.json.JSONArray;

/**
 * @ClassName: BDUserService
 * @Description: BD专员服务接口
 * @author JDW
 * @date 2017年9月21日 下午3:40:23
 * @version
 */
public class BDUserService extends APPService implements IApiService {

	public static final Logger log = Logger.getLogger(BDUserService.class);
	
	@Resource(name = "bduserService")
	private BDUserManager bduserService;
	
	@Resource(name = "bdmanagerService")
	private BDManagerManager bdmanagerService;

	@Resource(name = "tRechangeWithdrawalsHistoryService")
	private TRechangeWithdrawalsHistoryManager tRechangeWithdrawalsHistoryService;

	@Resource(name = "redisDaoImpl")
	private RedisDao redisDaoImpl;
	
	/**
	 * @Title: getBDUserMessageByBDUSERID @Description: 获取用户信息 @param @param
	 *         pd @param @return @return Map<String,Object> @throws
	 */
	public Map<String, Object> getBDUserMessageByBDUSERID(PageData pd) {

		Map<String, Object> responseResult = new HashMap<String, Object>();

		try {
			
			PageData param = new PageData();

			param.put("BDUSERID", pd.get("userId"));//BD用户编号
			//根据BD编号获取BD用户信息
			PageData BDUSER = bduserService.findByBDUSERID(param);
			//返回用户信息
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "用户信息", BDUSER);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}

		return responseResult;
	}

	/**
	 * @Title: getUserOrderNumberByUserType @Description:
	 *         根据用户类型获取用户的订单数量 @param @return @return Map<String,Object> @throws
	 */
	public Map<String, Object> getUserOrderNumberByUserType(PageData pd) {

		Map<String, Object> responseResult = new HashMap<String, Object>();

		try {
			PageData param = new PageData();

			param.put("BDUSERID", pd.get("userId"));

			PageData BDUSER = bduserService.findByBDUSERID(param);

			PageData selectParam = new PageData();

			orderSelectParameMap(selectParam, pd);

			selectParam.put("BDCODE", BDUSER.get("BDCODE"));
			selectParam.put("USERTYPE", pd.get("userType"));
			
			PageData counts = bduserService.getUserCountByBDCODE(selectParam);
			
			PageData userOrderCnt = bdmanagerService.findByManagerName("BD_USER_ACTIVE_MANAGER_NAME"); //用户激活数量
			PageData horseManOrderCnt = bdmanagerService.findByManagerName("BD_HORSEMAN_ACTIVE_MANAGER_NAME"); //骑手激活数量

			selectParam.put("userOrderCnt", userOrderCnt.get("ORDERNUMBER"));
			selectParam.put("horseManOrderCnt", horseManOrderCnt.get("ORDERNUMBER"));
			List<PageData> orderNumberMessage = bduserService.getUserOrderNumberMessage(selectParam);

			Map<String, Object> responseContent = new HashMap<String, Object>();

			responseContent.put("orderNumberMessage", orderNumberMessage);
			responseContent.put("pageSize", this.pageSize);
			responseContent.put("currentPage", this.currentPage);
			responseContent.put("totalPage", (Integer.parseInt(counts.get("count").toString())-1)/this.pageSize+1);
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "", responseContent);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		return responseResult;
	}

	/**
	 * @Title: getMoneyMessage @Description: 获取余额信息 @param @return @return
	 *         Map<String,Object> @throws
	 */
	public Map<String, Object> getMoneyMessage(PageData pd) {
		// 响应信息
		Map<String, Object> responseResult = new HashMap<String, Object>();
		// 接口响应的内容
		Map<String, Object> responseContent = new HashMap<String, Object>();
		try {
			// 用户id
			String BDUSERID = pd.getString("userId");
			// 查询参数
			PageData param = new PageData();
			// 用户id
			param.put("BDUSERID", BDUSERID);
			// 根据用户id查询用户信息
			PageData BDUSER = bduserService.getBDUserMessageByBDUSERID(param);
			// 用户余额
			responseContent.put("money", BDUSER.get("MONEY"));
			// 响应信息
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "余额信息", responseContent);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}
		return responseResult;
	}

	/**
	 * @Title: getWithdrawMessage @Description: 获取提现信息 @param @return @return
	 *         Map<String,Object> @throws
	 */
	public Map<String, Object> getWithdrawMessage(PageData pd) {
		// 响应信息
		Map<String, Object> responseResult = new HashMap<String, Object>();
		// 接口响应的内容
		Map<String, Object> responseContent = new HashMap<String, Object>();
		try {
			// 用户id
			String BDUSERID = pd.getString("userId");
			// 查询参数
			PageData param = new PageData();
			// 用户id
			param.put("BDUSERID", BDUSERID);
			// 用户信心
			PageData BDUSER = bduserService.getBDUserMessageByBDUSERID(param);
			// 响应信息
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "提现信息", BDUSER);
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}
		return responseResult;
	}

	/**
	 * @param responseContent2
	 * @param responseResult2
	 * @Title: bandWeiXin @Description: 绑定微信 @param @return @return
	 *         Map<String,Object> @throws
	 */
	public Map<String, Object> bandWeiXin(String state, Map<String, Object> responseResult,
			Map<String, Object> responseContent) {

		try {

			String CODE_URL = Tools.getProperty("WECHAT_SNSAPI_USERINFO_CODE_URL", "");
			String APP_ID = Tools.getProperty("APP_ID", "");
			String REDIRECT_URI = URLEncoder.encode(Tools.getProperty("REDIRECT_URI", ""), "UTF-8");

			StringBuilder sb = new StringBuilder();

			sb = sb.append(CODE_URL).append("?appid=").append(APP_ID).append("&redirect_uri=").append(REDIRECT_URI)
					.append("&response_type=code&scope=snsapi_userinfo&state=").append(state).append("#wechat_redirect");
			// 返回下信息内容
			responseContent.put("authorizationUrl", sb.toString());
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "获取成功", responseContent);
		} catch (Exception e) {
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "获取失败", responseContent);
		}
		return responseResult;
	}

	/**
	 * @Title: updateWithdrawInfomation @Description:
	 *         修改提现信息 @param @return @return Map<String,Object> @throws
	 */
	public Map<String, Object> updateWithdrawInfomation(PageData pd) {

		// 响应信息
		Map<String, Object> responseResult = new HashMap<String, Object>();
		// 接口响应的内容
		Map<String, Object> responseContent = new HashMap<String, Object>();
		try {
			// 用户id
			String BDUSERID = pd.getString("userId");
			/*// 解绑类型
			String unbindType = pd.getString("unbindType");*/
			// 解绑类型
			String bindType = pd.getString("bindType");
			// 操作类型
			String operationType = pd.getString("operationType");
			// 判断操作类型是否为空
			if (Tools.notEmpty(operationType)) {
				// 判断操作类型
				if (ContentManagerUtils.BIND_CODE.equals(operationType)) {
					// 绑定
					if (Tools.notEmpty(bindType)) {
						// 判断绑定的类型
						if (ContentManagerUtils.ALIPAY_CODE.equals(bindType)) {
							// 支付宝
							PageData param = new PageData();
							param.put("BDUSERID", BDUSERID);
							param.put("ALIPAYACCOUNT", pd.getString("ALIPAYACCOUNT"));
							param.put("ALIPAYREALNAME", pd.getString("ALIPAYREALNAME"));
							// 修改信息
							bduserService.edit(param);
							writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "绑定成功",
									responseContent);
						} else if (ContentManagerUtils.WEIXIN_CODE.equals(bindType)) {
							
							PageData param = new PageData();
							param.put("BDUSERID", BDUSERID);
							param.put("STATE", UuidUtil.getRandString(8));
							
							bduserService.edit(param);
							// 微信
							bandWeiXin(param.getString("STATE"), responseResult, responseContent);
						} else {
							// 未知
							writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "没有该种绑定类型",
									responseContent);
						}
					} else {
						writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "绑定类型不能为空",
								responseContent);
					}
				} else if (ContentManagerUtils.UNBIND_CODE.equals(operationType)) {
					// 解绑
					if (Tools.notEmpty(bindType)) {
						// 判断解绑的类型
						if (ContentManagerUtils.ALIPAY_CODE.equals(bindType)) {
							// 支付宝
							PageData param = new PageData();
							param.put("BDUSERID", BDUSERID);
							// 修改信息
							bduserService.updateBDUserAlipayMessage(param);
							writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "解绑成功",
									responseContent);
						} else if (ContentManagerUtils.WEIXIN_CODE.equals(bindType)) {
							// 微信
							PageData param = new PageData();
							param.put("BDUSERID", BDUSERID);
							bduserService.updateBDUserWXMessage(param);
							writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "解绑成功",
									responseContent);
						} else {
							// 未知
							writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "没有该种解绑类型",
									responseContent);
						}
					} else {
						// 解绑的类型为空
						writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "解绑类型不能为空",
								responseContent);
					}
				} else {
					// 操作类型不存在
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "没有该操作类型",
							responseContent);
				}
			} else {
				// 操作类型为空
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作类型不能为空",
						responseContent);
			}
		} catch (Exception e) {
			// 出现异常
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}
		return responseResult;

	}

	/**
	 * 提现
	 */

	public Map<String, Object> bdUserWithdraw(PageData pd) {
		// 响应信息
		Map<String, Object> responseResult = new HashMap<String, Object>();
		// 接口响应的内容
		Map<String, Object> responseContent = new HashMap<String, Object>();
		try {
			// 提现方式
			String withdrawType = pd.getString("withdrawType");
			// 用户id
			String BDUSERID = pd.getString("userId");
			// 要提现的金额
			Double withdrawAmount = Double.parseDouble(pd.get("withdrawAmount").toString());
			// 查询的参数
			PageData param = new PageData();
			param.put("BDUSERID", BDUSERID);
			// 根据用户id查寻用户信息
			PageData BDUSER = bduserService.getBDUserMessageByBDUSERID(param);
			// 判断提现方式是否为空
			if (Tools.notEmpty(withdrawType)) {
				// 判断提现方式
				if (ContentManagerUtils.ALIPAY_CODE.equals(withdrawType)) {
					// 支付宝
					alipayWithdraw(responseResult, responseContent, BDUSER, withdrawAmount);
				} else if (ContentManagerUtils.WEIXIN_CODE.equals(withdrawType)) {
					// 微信
					weixinWithdraw(responseResult, responseContent, BDUSER, withdrawAmount);
				} else {
					// 未知
					writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "该提现方式不存在",
							responseContent);
				}
			} else {
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "提现方式不能为空",
						responseContent);
			}
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}

		return responseResult;
	}

	/**
	 * @param responseContent
	 * @param responseResult
	 * @Title: alipayWithdraw @Description: 支付宝提现 @param @param
	 *         bDUSER @param @param withdrawAmount @return void @throws
	 */
	private void alipayWithdraw(Map<String, Object> responseResult, Map<String, Object> responseContent,
			PageData bDUSER, Double withdrawAmount) throws Exception {
		// 判断用户提现的信息是否完整
		if (Tools.notEmpty(bDUSER.getString("ALIPAYACCOUNT")) && Tools.notEmpty(bDUSER.getString("ALIPAYREALNAME"))) {
			// 判断提现金额是否大于1元
			if (withdrawAmount <= ContentManagerUtils.MIN_WITHDRAWS_MONEY) {
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE,
						"提现金额要大于" + ContentManagerUtils.MIN_WITHDRAWS_MONEY + "块", responseContent);
			} else if (withdrawAmount <= (Float) bDUSER.get("AVAILABLEBALANCE")) {
				PageData param = new PageData();
				// 修改用户账户金额
				param.put("BDUSERID", bDUSER.getString("BDUSERID"));
				param.put("MONEY", ((Float) bDUSER.get("MONEY") - withdrawAmount));
				param.put("AVAILABLEBALANCE", ((Float) bDUSER.get("AVAILABLEBALANCE") - withdrawAmount));
				bduserService.edit(param);
				// 创建流水记录
				PageData history = createHistory(withdrawAmount, bDUSER.getString("BDUSERID"),
						ContentManagerUtils.WITHDRAW_HISTORY_TYPE, "支付宝", bDUSER.getString("ALIPAYREALNAME"),
						bDUSER.getString("ALIPAYACCOUNT"));
				// 保存流水记录
				tRechangeWithdrawalsHistoryService.save(history);
				// 返回响应信息
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "提现申请已提交",
						responseContent);
			} else {
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "余额不足", responseContent);
			}

		} else {
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "请完善支付宝资料", responseContent);
		}
	}

	/**
	 * @Title: createHistory @Description: 创建流水记录 @param @return void @throws
	 */
	private PageData createHistory(Double amount, String bdUserId, String transactionType, String payWay,
			String realName, String account) {
		PageData history = new PageData();
		String orderid = getFlowString(3);
		history.put("Id", orderid);
		history.put("transactionAmount", amount);
		history.put("bdUserId", bdUserId);
		history.put("transactionType", transactionType);
		history.put("payWay", payWay);
		history.put("status", "0");
		history.put("realName", realName);
		history.put("account", account);
		history.put("failBack", "0");
		history.put("createTime",
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(System.currentTimeMillis())));

		return history;
	}

	/**
	 * @param responseContent
	 * @param responseResult
	 * @Title: weixinWithdraw @Description: 微信提现 @param @param
	 *         bDUSER @param @param withdrawAmount @return void @throws
	 */
	private void weixinWithdraw(Map<String, Object> responseResult, Map<String, Object> responseContent,
			PageData bDUSER, Double withdrawAmount) throws Exception {

		// 判断用户提现的信息是否完整
		if (Tools.notEmpty(bDUSER.getString("OPENID"))) {
			// 判断提现金额是否大于1元
			if (withdrawAmount <= ContentManagerUtils.MIN_WITHDRAWS_MONEY) {
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE,
						"提现金额要大于" + ContentManagerUtils.MIN_WITHDRAWS_MONEY + "块", responseContent);
			} else if (withdrawAmount <= (Float) bDUSER.get("AVAILABLEBALANCE")) {
				PageData param = new PageData();

				param.put("BDUSERID", bDUSER.getString("BDUSERID"));
				param.put("MONEY", ((Float) bDUSER.get("MONEY") - withdrawAmount));
				param.put("AVAILABLEBALANCE", ((Float) bDUSER.get("AVAILABLEBALANCE") - withdrawAmount));
				bduserService.edit(param);
				// 创建流水账号
				PageData history = createHistory(withdrawAmount, bDUSER.getString("BDUSERID"),
						ContentManagerUtils.WITHDRAW_HISTORY_TYPE, "微信", bDUSER.getString("WXREALNAME"),
						bDUSER.getString("OPENID"));
				// 保存流水账号到数据库
				tRechangeWithdrawalsHistoryService.save(history);
				// 返回响应信息
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "提现申请已提交",
						responseContent);
			} else {
				writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "余额不足", responseContent);
			}

		} else {
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "请关注微信进行绑定", responseContent);
		}
	}

	/**
	 * @Title: outLog @Description: 退出登录 @param @return @return
	 * Map<String,Object> @throws
	 */
	public Map<String, Object> outLog(PageData pd) {
		// 响应信息
		Map<String, Object> responseResult = new HashMap<String, Object>();
		// 接口响应的内容
		Map<String, Object> responseContent = new HashMap<String, Object>();
		try {
			
			String BDUSER = pd.getString("userId");
			String Token = pd.getString("Token");
			
			List<String> list = new ArrayList<String>();
			
			list.add(BDUSER+"_login");
			list.add(Token);
			list.add(BDUSER+"_steed_dataCache_phoneFlag");
			
			RedisToken.delect(list,redisDaoImpl);
			
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "退出成功", responseContent);
			
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", responseContent);
		}
		return responseResult;
	}
	
	/**
	 * @Title: partnerManagementMethod
	 * @Description: 合伙人管理方法
	 * @param @param pd
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String, Object> partnerManagementMethod(PageData pd){
		// 响应信息
		Map<String, Object> responseResult = new HashMap<String, Object>();
		// 接口响应的内容
		Map<String, Object> responseContent = new HashMap<String, Object>();
		try {
			//设置用户查询的参数
			PageData param = new PageData();
			param.put("BDUSERID",  pd.getString("userId"));
			//根据用户id获取用户信息
			PageData BDUSER = bduserService.findByBDUSERID(param);
			//设置分页查询的数据
			orderSelectParameMap(BDUSER, pd);
			//根据BD码获取合伙人的数量
			PageData counts = bduserService.getPartnerCountByBDCODE(BDUSER);
			//根据BD码获取合伙人信息
			List<PageData> partnerList = bduserService.getPartnerMessageByBdCode(BDUSER);
			//设置响应的数据
			responseContent.put("partnerList", partnerList);//每页信息
			responseContent.put("pageSize", pageSize);//每页个数
			responseContent.put("currentPage", currentPage);//当前页
			responseContent.put("totalPage", (Integer.parseInt(counts.get("count").toString())-1)/pageSize+1);
			//响应信息
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "合伙人管理信息", responseContent);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
			
		return responseResult;
	}
	
	/**
	 * @Title: partnerManagementDetailMethod
	 * @Description: 合伙人管理详情方法
	 * @param @param pd
	 * @param @return    
	 * @return Map<String,Object>    
	 * @throws
	 */
	public Map<String, Object> partnerManagementDetailMethod(PageData pd){
		// 响应信息
		Map<String, Object> responseResult = new HashMap<String, Object>();
		try {
			PageData param = new PageData();
			param.put("BDUSERID", pd.getString("partnerId"));
			//根据用户获取用户信息
			PageData responseContent = bduserService.getPartnerDetailMessageByBDUserId(param);
			// 接口响应的内容
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "合伙人详情信息", responseContent);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "操作失败", null);
		}
		return responseResult;
	}
	/**
	 * 
	 * @return
	 */
	public Map<String, Object> getBDshareContent() {
		Map<String, Object> responseResult = new HashMap<String, Object>();
		try {
			String json_str = Tools.getProperty("BD_SHARE_JSON", "");
			JSONArray json = JSONArray.fromObject(json_str.trim());
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_SUCCESS, "获取成功", json);
		} catch (Exception e) {
			e.printStackTrace();
			writeResponseMessage(responseResult, ContentManagerUtils.RESPONSE_CODE_FILE, "获取失败", null);
		}
		return responseResult;
	}
	@Override
	public Map<String, Object> handle(HttpServletRequest request, PageData data, String method) {
		Map<String, Object> responseResult = null;
		if ("getBDUserMessageByBDUSERID".equals(method)) {
			responseResult = getBDUserMessageByBDUSERID(data);
		} else if ("getUserOrderNumberByUserType".equals(method)) {
			responseResult = getUserOrderNumberByUserType(data);
		} else if ("bdUserWithdraw".equals(method)) {
			responseResult = bdUserWithdraw(data);
		} else if ("updateWithdrawInfomation".equals(method)) {
			responseResult = updateWithdrawInfomation(data);
		} else if ("getWithdrawMessage".equals(method)) {
			responseResult = getWithdrawMessage(data);
		} else if ("getMoneyMessage".equals(method)) {
			responseResult = getMoneyMessage(data);
		} else if ("outLog".equals(method)) {
			responseResult = outLog(data);
		} else if("partnerManagementMethod".equals(method)){
			responseResult = partnerManagementMethod(data);
		} else if("partnerManagementDetailMethod".equals(method)){
			responseResult = partnerManagementDetailMethod(data);
		}else if("getBDshareContent".equals(method)){
			responseResult = getBDshareContent();
		}
		return responseResult;
	}

}
