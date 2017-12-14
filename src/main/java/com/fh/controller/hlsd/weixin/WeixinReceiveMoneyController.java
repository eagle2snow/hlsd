package com.fh.controller.hlsd.weixin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.weixin.SNSUserInfo;
import com.fh.entity.weixin.WeixinOauth2Token;
import com.fh.service.hlsd.BD.bduser.BDUserManager;
import com.fh.util.PageData;
import com.fh.util.Tools;
import com.fh.util.weixin.utils.AdvancedUtil;

/**
 * @ClassName: WeixinReceiveMoneyController
 * @Description: 用户绑定微信账号的回调函数
 * @author JDW
 * @date 2017年9月25日 下午12:17:15
 * @version
 */
@Controller
@RequestMapping("/weixin")
public class WeixinReceiveMoneyController extends BaseController {

	@Resource(name = "bduserService")
	private BDUserManager bduserService;

	@RequestMapping("/OAuthResponse")
	public ModelAndView OAuthResponse() {
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String code = pd.getString("code");
			String state = pd.getString("state");
			// 用户同意授权
			if (!"authdeny".equals(code)) {
				// 获取网页授权access_token
				WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(Tools.getProperty("APP_ID", ""),
						Tools.getProperty("APP_SECRET", ""), code);
				// 网页授权接口访问凭证
				String accessToken = weixinOauth2Token.getAccessToken();
				// 用户标识
				String openId = weixinOauth2Token.getOpenId();
				// 获取用户信息
				SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);
				// 根据openId查询用户的数量
				PageData selectParam = new PageData();
				selectParam.put("OPENID", snsUserInfo.getOpenId());
				PageData pageData = bduserService.getBDUserNumberByOpenId(selectParam);
				Integer number = Integer.parseInt(pageData.get("NUMBER").toString());
				// 判断查询的数量是否大于等于一
				if (number >= 1) {
					// 该微信账号已绑定
					mv.setViewName("hlsd/weixin/bindWrong");
					mv.addObject("message", "该微信已绑定过其他用户");
				} else {
					// 微信账号未绑定
					//根据用户id查询用户信息
					PageData param = new PageData();
					param.put("STATE", state);
					PageData BDUSER = bduserService.findBySTATE(param);
					//判断用户是否存在
					if (BDUSER != null && BDUSER.size() > 0) {
						
						BDUSER.put("OPENID", snsUserInfo.getOpenId());
						BDUSER.put("WXREALNAME", snsUserInfo.getNickname());
						BDUSER.put("WXIMAGE", snsUserInfo.getHeadImgUrl());
						BDUSER.put("STATE", "");

						Long updateMessage = bduserService.updateBDUserMessge(BDUSER);

						if (1 == updateMessage) {
							// 绑定成功
							mv.setViewName("hlsd/weixin/bindSuc");
							mv.addObject("message", "绑定成功");
							mv.addObject("snsUserInfo",snsUserInfo);
						} else {
							// 绑定失败
							mv.setViewName("hlsd/weixin/bindWrong");
							mv.addObject("message", "绑定失败");
						}
					}else{
						mv.setViewName("hlsd/weixin/bindWrong");
						mv.addObject("message", "绑定失败");
						mv.addObject("status", "0");
					}

				}
			}else{
				mv.setViewName("hlsd/weixin/bindWrong");
				mv.addObject("message", "绑定失败");
				mv.addObject("status", "0");
			}

		} catch (Exception e) {
			// 绑定失败
			e.printStackTrace();
			mv.setViewName("hlsd/weixin/bindWrong");
			mv.addObject("message", "绑定失败");
			mv.addObject("status", "0");
		}

		return mv;
	}
}
