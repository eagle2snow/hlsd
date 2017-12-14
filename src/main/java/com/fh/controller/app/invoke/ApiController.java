package com.fh.controller.app.invoke;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.fh.controller.base.BaseController;
import com.fh.service.app.IApiService;
import com.fh.service.app.authenticate.IAuthenticate4Mobile;
import com.fh.util.Constants;
import com.fh.util.PageData;
import com.fh.util.Tools;

/**
 * @Title: 统一入口，服务路由分发器
 * @author zhangWenchao
 * @since JDK1.7
 * @history 2016年10月31日 zhangWenchao
 */
@Controller
@RequestMapping("/app")
public class ApiController extends BaseController {
	
	private static Logger log = Logger.getLogger(ApiController.class);
	
	@Resource(name="authenService")
	private IAuthenticate4Mobile authenService;

    /**
     * @param 统一服务调用控制器
     * @param serviceName 对应的服务名称就可以找到具体的类
     * @param methodName  这是请求的具体的方法名称，对应类里面的具体实现方法
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/invoker/{serviceName}/{methodName}")
	@ResponseBody
	public Object invoker(@PathVariable String serviceName,@PathVariable String methodName) throws Exception {
     	PageData pageData = this.getPageData();
    	String serviceNo = pageData.getString("serviceNo");
    	log.info(serviceNo+" 设备请求服务 【 "+serviceName+"/"+methodName+" 】 ：  "+ Tools.date2Str(new Date(), "yyyy-MM-dd HH:mm:ss SSS"));
    	Map<String, Object> result = new LinkedHashMap<String, Object>();
    	if (!Tools.isEmpty(serviceName)) {
	    	try {
	    		//用户名密码登录认证 或 Token认证
			    result = authenService.authenticate(pageData,serviceName);
			    if(result.get("result") != null && Boolean.parseBoolean(result.get("result").toString()) && !"login".equals(serviceName) && !"sendCode".equals(serviceName)){//认证成功
		            IApiService apiService = (IApiService) getSpringBean(serviceName);
		            if (null != apiService ) {
		            	//result.put("datas", apiService.handle(this.getRequest(),pageData,methodName));
		            	result = apiService.handle(this.getRequest(),pageData,methodName);
		            } else {
		            	result.put("result", Constants.FAIL);
						result.put(Constants.RESP_MSG, "没有找到服务：" + serviceName);
		            }
			    }
			} catch (Exception e) {
				e.printStackTrace();
				 result.put("result", Constants.FAIL);
				 result.put(Constants.RESP_MSG, "服务器接口出现异常");
			}
    	 } else {
            result.put("result", Constants.FAIL);
			result.put(Constants.RESP_MSG, "请输入服务名");
	     }
        return result;
    }
    
    /**
     * 通过bean id获取bean
     * @param key
     * @return
     */
    public static Object getSpringBean(String key) {
        try {
            WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
            return webApplicationContext != null ? webApplicationContext.getBean(key) : null;
        } catch (Exception e) {
            return null;
        }
    }
}
