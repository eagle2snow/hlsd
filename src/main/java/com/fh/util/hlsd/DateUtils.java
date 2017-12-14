package com.fh.util.hlsd;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	public static Date getEndDate(Date createTime) throws ParseException{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String ct = sdf.format(createTime.getTime());

		Long value = sdf.parse(ct).getTime() + 1000 * 60 * 60 * 24 * 20;

		Date et = new Date(value);
		
		return et;
	}
	public static Date getLasterDate(Date createTime) throws ParseException{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String ct = sdf.format(createTime.getTime());
		
		Long value = sdf.parse(ct).getTime() + 1000 * 60 * 60 * 24 * 15;
		
		Date et = new Date(value);
		
		return et;
	}
	
	/**
	 * @Title: isEnFlag
	 * @Description: 判断日期
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isEnFlag() {

		long time = System.currentTimeMillis();

		Date date = new Date(time);

		Calendar cal = Calendar.getInstance();

		cal.setTime(date);

		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;

		if (w < 0)
			w = 0;

		if (w != ContentManagerUtils.WEEK) {

			return false;
		}

		return true;
	}
	/**
	 * @Title: isEnFlag
	 * @Description: 判断当天是否是预定日期
	 * @param @return    
	 * @return Boolean    
	 * @throws
	 */
	public static Boolean isWeekFlag() {
		
		long time = System.currentTimeMillis();
		
		Date date = new Date(time);
		
		Calendar cal = Calendar.getInstance();
		
		cal.setTime(date);
		
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		
		if (w < 0)
			w = 0;
		
		Integer[] weekArr = ContentManagerUtils.WEEK_ARR;
		
		for (Integer week : weekArr) {
			
			if (w == week) {
				
				return false;
			}
			
		}
		
		return true;
	}
}
