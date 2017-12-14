package com.fh.controller.hlsd.pricing.rule.tminPrice;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.hlsd.pricing.rule.tminPrice.TMinPriceManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * @ClassName: TStartPrice
 * @Description: 起步价
 * @author JDW
 * @date 2017年9月6日 上午10:27:22
 * @version
 */
@SuppressWarnings("all")
@Controller
@RequestMapping(value = "/startPrice")
public class TStartPrice extends BaseController {
	
	@Resource(name = "tMinPriceService")
	private TMinPriceManager tMinPriceService;

	@RequestMapping(value = "list")
	public ModelAndView startPriceList(Page page){
		
		try{
			logBefore(logger, Jurisdiction.getUsername()+"startPrice");
			//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			String keywords = pd.getString("keywords");				//关键词检索条件
			if(null != keywords && !"".equals(keywords)){
				pd.put("keywords", keywords.trim());
			}
			page.setPd(pd);
			List<PageData>	varList = tMinPriceService.list(page);	//列出ExamInfo列表
			mv.setViewName("hlsd/examinfo/examinfo_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
			return mv;
			
		}catch (Exception e) {
			
			return null;
		}
		
	}
}
