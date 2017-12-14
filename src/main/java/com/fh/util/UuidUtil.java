package com.fh.util;

import java.util.UUID;

public class UuidUtil {

	public static String get32UUID() {
		String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
		return uuid;
	}
	public static void main(String[] args) {
		System.out.println(get32UUID());
	}
	
	public static String getRandString(Integer flowLength){
		
		StringBuilder sb = new StringBuilder();
		
		for (int j = 0; j < flowLength; j++) {
			int m = (int) ((Math.random()) * 10);

			sb = sb.append(m);
		}

		return sb.toString();
	}
}

