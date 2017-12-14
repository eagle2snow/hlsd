/**
 * Title: 测试API的接口
 * fileName: DemoService.java
 * @author zhangWenChao
 * @Created on 2017年5月15日 下午4:17:23
 * @version 1.0
 */

package com.fh.service.app.demo;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.fh.service.app.IApiService;
import com.fh.service.system.appuser.AppuserManager;
import com.fh.util.PageData;

public class DemoService implements IApiService{
	
	@Resource(name="appuserService")
	private AppuserManager appuserService;
	
    /**
     * 通过方法名执行不同的方法
     */
    public Map<String, Object> handle(HttpServletRequest request, PageData data,String method) {
       if("anotherMenthod".equals(method)){
    	   return anotherMethod(data);
       }else{
    	   Map<String, Object> result = new LinkedHashMap<String, Object>();
           try {
               data = appuserService.findByUsername(data);
               result.put("datas", data);
    	   } catch (Exception e) {
    	   }
           return result;
       }
    }
    
    
    public Map<String, Object> anotherMethod(PageData data) {
        Map<String, Object> result = new LinkedHashMap<String, Object>();
        try {
        	 PageData pd = new PageData();
        	 pd.put("methodName", "我是另外一个自定义方法啦");
             result.put("datas", pd);
  		} catch (Exception e) {
  		}
         return result;
      }
}
