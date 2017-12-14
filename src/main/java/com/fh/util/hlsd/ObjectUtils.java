package com.fh.util.hlsd;

import java.util.Collection;

@SuppressWarnings("all")
public class ObjectUtils {
	
	/**
	 * @Title: isFloatEmpty
	 * @Description: 判断Float类型为空
	 * @param @param flag
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isFloatEmpty(Float flag){
		if(flag == null){
			return true;
		}
		return false;
	}
	/**
	 * @Title: isDoubleEmpty
	 * @Description:判断Double类型为空
	 * @param @param flag
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isDoubleEmpty(Double flag){
		if(flag == null){
			return true;
		}
		return false;
	}
	/**
	 * @Title: isFloatNotEmpty
	 * @Description: 判断Float类型不为空
	 * @param @param flag
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isFloatNotEmpty(Float flag){
		if(flag != null){
			return true;
		}
		return false;
	}
	/**
	 * @Title: isDoubleNotEmpty
	 * @Description: 判断Double类型不为空
	 * @param @param flag
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isDoubleNotEmpty(Double flag){
		if(flag != null){
			return true;
		}
		return false;
	}
	/**
	 * @Title: isFloatNotEmptyAndZero
	 * @Description: 判断Float类型不为空且不为零
	 * @param @param flag
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isFloatNotEmptyAndZero(Float flag){
		if(flag != null && flag != 0F){
			return true;
		}
		return false;
	}
	/**
	 * @Title: isDoubleNotEmptyAndZero
	 * @Description: 判断double类型不为空且不为零
	 * @param @param flag
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isDoubleNotEmptyAndZero(Double flag){
		if(flag != null && flag != 0D){
			return true;
		}
		return false;
	}
	
	/**
	 * @param <T>
	 * @Title: isCollectionEmpty
	 * @Description: 判断集合为空
	 * @param @param collection
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static <T> Boolean isCollectionEmpty(Collection<T> collection){
		
		if(collection == null || collection.size() <= 0){
			
			return true;
		}
		
		return false;
	}
	/**
	 * @param <T>
	 * @Title: isCollectionNotEmpty
	 * @Description: 判断集合不为空
	 * @param @param collection
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static <T> Boolean isCollectionNotEmpty(Collection<T> collection){
		
		if(collection != null && collection.size() > 0){
			
			return true;
		}
		
		return false;
	}

}
