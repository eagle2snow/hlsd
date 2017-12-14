package com.fh.service.app;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.fh.util.PageData;

/**
 * @Title: 主接口，所有的服务实现必须实现这个接口
 * @author zhangWenchao
 * @since JDK1.8
 * @history 2016年10月31日 zhangWenchao
*/
public interface IApiService {
    
    Map<String, Object> handle(HttpServletRequest request, PageData data,String method);

}
