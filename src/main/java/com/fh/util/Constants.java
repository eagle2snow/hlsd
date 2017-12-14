package com.fh.util;

/** 
 * 说明：
 * 创建人：ZhangWenchao
 * 修改时间：2015年11月24日
 * @version
 */
public class Constants {
	
	public static String PICTURE_VISIT_FILE_PATH = "";//图片访问的路径
	public static String PICTURE_SAVE_FILE_PATH = "";//图片存放的路径
	public static String getPICTURE_VISIT_FILE_PATH() {
		return PICTURE_VISIT_FILE_PATH;
	}

	public static void setPICTURE_VISIT_FILE_PATH(String pICTURE_VISIT_FILE_PATH) {
		PICTURE_VISIT_FILE_PATH = pICTURE_VISIT_FILE_PATH;
	}

	public static String getPICTURE_SAVE_FILE_PATH() {
		return PICTURE_SAVE_FILE_PATH;
	}

	public static void setPICTURE_SAVE_FILE_PATH(String pICTURE_SAVE_FILE_PATH) {
		PICTURE_SAVE_FILE_PATH = pICTURE_SAVE_FILE_PATH;
	}
	
    /**
     * 请求响应消息内容设置标识
     */
    public static final String RESP_MSG = "responseMessage";

    /**
     * 成功标识
     */
    public static final boolean SUCCESS = true;

    /**
     * 失败标识
     */
    public static final boolean FAIL = false;
    
    /**
     * Token过期
     */
    public static final int EXPIRED = -111;
    
    /**
     * 参数错误
     */
    public static final int PARAM_ERROR = 1;
    
    /**
     * 请求成功
     */
    public static final int REQ_SUCCESS = 0;
    

	public static void main(String[] args) {
		Constants.setPICTURE_SAVE_FILE_PATH("D:/Tomcat 6.0/webapps/FH/topic/");
		Constants.setPICTURE_VISIT_FILE_PATH("http://192.168.1.225:8888/FH/topic/");
	}
	
}
