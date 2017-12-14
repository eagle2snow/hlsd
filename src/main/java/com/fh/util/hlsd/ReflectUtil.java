package com.fh.util.hlsd;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

public class ReflectUtil {
	
	public static boolean isFieldFinal(Field field){
		return (field.getModifiers()&Modifier.FINAL)==Modifier.FINAL;
	}
	public static Map<String, Object> field2Map(Object obj){
		Map<String, Object> map = new HashMap<>();
		return field2Map(0,obj, map);
	}
	public static Map<String, Object> field2Map(int classDdeep,Object obj,Map<String, Object> map){
		Class<?> tempClass = obj.getClass();
		for (int i = 0; i < classDdeep; i++) {
			tempClass = tempClass.getSuperclass();
		}
		if (tempClass == Object.class) {
			return map;
		}
		for (Field temp:tempClass.getDeclaredFields()) {
			temp.setAccessible(true);
			try {
				Object obj2 = temp.get(obj);
				if (!BaseUtil.isObjEmpty(obj2)) {
					map.put(temp.getName(), obj2);
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
		return field2Map(++classDdeep, obj, map);
	}
	
}
