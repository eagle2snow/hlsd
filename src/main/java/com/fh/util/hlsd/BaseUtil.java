package com.fh.util.hlsd;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
/**
 * 基础工具类，拥有许多基础方法
 * @author 战马
 *
 */
public class BaseUtil {
	private static final Gson gson = new GsonBuilder().disableHtmlEscaping().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
	private static final Logger log = LoggerFactory.getLogger(BaseUtil.class);
	/**
	 * 判断对象是否为空，集合为空时也会返回true
	 * @param obj
	 * @return 是否为空
	 */
	public static boolean isObjEmpty(Object obj){
		if (obj == null) {
			return true;
		}
		if (CollectionsUtil.isObjCollections(obj)) {
			return CollectionsUtil.isCollectionsEmpty(obj);
		}
		if (obj instanceof String) {
			return StringUtils.isBlank((String)obj);
		}
		return null == obj;
	}
	
}
