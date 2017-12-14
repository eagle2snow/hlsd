package com.fh.controller.openplat.openapi.authen;

import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import com.fh.controller.weixin.pay.util.MD5Util;
import com.fh.util.PageData;
import com.fh.util.Tools;

public class CommonFun {

	public static String CreateMd5Sign(PageData pd, String AppKey) {
		Map<String, String> myParameters = SortMapByKey(pd);
		StringBuffer data = new StringBuffer();
		Iterator<String> iterator = myParameters.keySet().iterator();

		while (iterator.hasNext()) {
			String key = iterator.next();
			String value = myParameters.get(key);
			if (!"SIGN".equals(key.toUpperCase()) && !Tools.isEmpty(value)) {
				data.append(String.format("%s=%s&", key, value));
			}
		}
		data.append("key=" + AppKey);

		String result = data.toString().toUpperCase();
		String sing = MD5Util.string2MD5(result).toUpperCase();
		return sing;
	}

	@SuppressWarnings("unchecked")
	private static Map<String, String> SortMapByKey(PageData oriMap) {
		if (oriMap == null || oriMap.isEmpty()) {
			throw new IllegalStateException("数组为空");
		}
		Map<String, String> sortedMap = new TreeMap<String, String>(new Comparator<String>() {
			public int compare(String key1, String key2) {
				return key1.compareTo(key2);
			}
		});
		sortedMap.putAll(oriMap);
		return sortedMap;
	}

}
