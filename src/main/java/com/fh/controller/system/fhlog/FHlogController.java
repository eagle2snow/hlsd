package com.fh.controller.system.fhlog;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Tools;

/** 
 * 说明：操作日志记录
 * 创建人：ZhangWenchao
 * 创建时间：2016-05-10
 */
@Controller
@RequestMapping(value="/fhlog")
public class FHlogController extends BaseController {
	
	String menuUrl = "fhlog/list.do"; //菜单地址(权限用)
	@Resource(name="fhlogService")
	private FHlogManager fhlogService;
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除FHlog");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		fhlogService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表FHlog");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		String lastStart = pd.getString("lastStart");	//开始时间
		String lastEnd = pd.getString("lastEnd");		//结束时间
		if(lastStart != null && !"".equals(lastStart)){
			pd.put("lastStart", lastStart+" 00:00:00");
		}
		if(lastEnd != null && !"".equals(lastEnd)){
			pd.put("lastEnd", lastEnd+" 00:00:00");
		}
		page.setPd(pd);
		List<PageData>	varList = fhlogService.list(page);		//列出FHlog列表
		mv.setViewName("system/fhlog/fhlog_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());				//按钮权限
		return mv;
	}
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除FHlog");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			fhlogService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出FHlog到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("用户名");	//1
		titles.add("操作时间");	//2
		titles.add("事件");	//3
		dataMap.put("titles", titles);
		List<PageData> varOList = fhlogService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("USERNAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("CZTIME"));	    //2
			vpd.put("var3", varOList.get(i).getString("CONTENT"));	    //3
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	
	/**
	 * 获取tomcat里面的日志
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listTomcatDir")
	public ModelAndView listTomcatDir() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 获取tomcat日志列表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String fileDir = pd.getString("fileDir");
		//String tomcatPath = System.getProperty("catalina.home")+File.separator+"logs"+File.separator;
		String tomcatPath = Tools.getProperty("DEPLOY_DISK", System.getProperty("catalina.home"));
		if(!Tools.isEmpty(fileDir)){ //通过文件夹查询
			tomcatPath = fileDir;
		}
		List<PageData>	varList = new ArrayList<PageData>();
		List<File> files = getLogFiles(tomcatPath);
		for (int i = 0; i < files.size(); i++) {
			File file = files.get(i);
			PageData file_pd = new PageData();
			file_pd.put("fileName", file.getName());
			file_pd.put("filePath", file.getAbsolutePath().replaceAll("\\\\", "/"));
			if(file.isDirectory()){
				file_pd.put("fileSize", "--");
				file_pd.put("fileType", "dir");
			}else{
				file_pd.put("fileSize", file.length()/1000+" KB");
				file_pd.put("fileType", "file");
			}
			if(file.length()/1000>0){
				varList.add(file_pd);
			}
		}
		
		mv.setViewName("system/fhlog/tomcat_log_list");
		/*if(!Tools.isEmpty(fileDir) && varList.size()>0){ //为了把当天的日志放到第一位
			varList.add(varList.size(), varList.get(0));
			varList.remove(0);
		}*/
		Collections.reverse(varList);
		mv.addObject("varList", varList); //默认只查询前25条
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());
		return mv;
	}
	
	//通过路径获取下面所有的文件和文件夹
	private List<File> getLogFiles(String path) {
		List<File> fileList = new ArrayList<File>();
        File file = new File(path);
        if (file.exists()) {
            File[] files = file.listFiles();
            if (files.length == 0) {
                System.out.println("文件夹是空的!");
            } else {
                for (File file2 : files) {
                    fileList.add(file2);
                }
            }
        }
        return fileList;
    }
	
	/**
	 * 读取日志文件
	 * @throws Exception
	 */
	@RequestMapping(value="/readLogFile")
	@ResponseBody
	public void readLogFile() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+" 读取日志文件");
		PageData pd = new PageData();
		pd = this.getPageData();
		String fileName = pd.getString("fileName");
		File file = new File(fileName);
		StringBuffer sb = new StringBuffer();
		BufferedReader reader = null;
		BufferedReader reader_line = null;
        try {  
            reader = new BufferedReader(new FileReader(file));  
            reader_line = new BufferedReader(new FileReader(file));  
            String tempString = null;  
            long line = 0;  
            long allLines = 0;
//            long allLines = reader_line.lines().count();
            long readCnt = 0;
            if(allLines>1500){ //如果大于1500 就只显示后面1500行的数据
            	readCnt = allLines-1500;
            }
            while ((tempString = reader.readLine()) != null) {
            	if(line>=readCnt){
            		sb.append("line " + line + ": " + tempString+"<br/>\r\n");
            	}
                line++;
            }
            reader.close();  
            reader_line.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {
            if (reader != null) {  
                try {reader.close();} catch (IOException e1) {}
            }
            if (reader_line != null) {  
            	try {reader_line.close();} catch (IOException e2) {}
            }
        }
		this.writeJson(sb.toString());
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
