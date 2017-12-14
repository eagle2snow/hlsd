package com.fh.controller.base;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fh.entity.Page;
import com.fh.util.Constants;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

import net.sf.json.JSONObject;

/**
 * @author ZhangWenchao
 * 修改时间：2015、12、11
 */
public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	/** new PageData对象
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}
	
	/**得到response对象
	 * @return
	 */
	public HttpServletResponse getResponse() {
		HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
		return response;
	}

	/**得到32位的uuid
	 * @return
	 */
	public static String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	/**得到分页列表的信息
	 * @return
	 */
	public Page getPage(){
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
	
	
	/**
	 * 写出json到客户端
	 * @param result 返回结果true或false
	 * @param code   错误码或正确代码,自定义
	 * @param Constants.RESP_MSG    自定义消息
	 */
	public void writeJson(boolean result,String code,String msg){
		HttpServletResponse response = this.getResponse();
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			JSONObject res = new JSONObject();
			res.put("result", result);
			res.put("code", code);
			res.put(Constants.RESP_MSG, msg);
			out.write(res.toString().replaceAll("null", "\"\""));
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
	}
	
	/**
	 * 自定义字符串 写出json到客户端
	 * @param result 可以包括( result返回结果true或false，  code(错误码或正确代码,自定义)， Constants.RESP_MSG(自定义消息) )
	 */
	public void writeJson(String result){
		HttpServletResponse response = this.getResponse();
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write(result.toString().replaceAll("null", "\"\""));
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
	}
	
	public void writeClientMessage(ModelAndView mv ,Integer responseCode,Long responseTime,String responseMessage,Object responseContent){
		mv.addObject("responseCode", responseCode);
		mv.addObject("responseTime", responseTime);
		mv.addObject("responseMessage", responseMessage);
		mv.addObject("responseContent", responseContent);
	}
	
	public String getUuidByRandam(int num) {
		
		int hashCodeV = UUID.randomUUID().toString().hashCode();
		if (hashCodeV < 0) {// 有可能是负数
			hashCodeV = -hashCodeV;
		}

		StringBuilder sb = new StringBuilder();

		for (int m = 0; m < num - (hashCodeV + "").length(); m++) {

			int j = (int) ((Math.random()) * 10);

			sb.append(j);
		}

		int j = (int) ((Math.random()) * 10);

		String[] sArr = new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "1" };

		return sArr[j] + "" + hashCodeV + sb.toString();
	}
	public static String getCodeByRandam(int num) {
		
		StringBuilder sb = new StringBuilder();
		
		for (int m = 0; m < num ; m++) {
			
			int j = (int) ((Math.random()) * 10);
			
			sb.append(j);
		}
		
		int j = (int) ((Math.random()) * 10);
		
		String[] sArr = new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "1" };
		
		return sArr[j] + "" + sb.toString();
	}

	public void execute(JobExecutionContext context)
			throws JobExecutionException {
		// TODO Auto-generated method stub
		
	}
	
}
