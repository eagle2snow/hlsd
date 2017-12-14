package com.fh.util.hlsd;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Util {
	public static String Md5Digest(String data){
		return byte2hex(Md5Digest(getSystemCharacterSetBytes(data)));
	}
	
	public static String byte2hex(byte[] b) {
		String re_md5;
		int i;
		StringBuffer buf = new StringBuffer();
		for (int offset = 0; offset < b.length; offset++) {
		    i = b[offset];
		    if (i < 0)
		        i += 256;
		    if (i < 16)
		        buf.append("0");
		    buf.append(Integer.toHexString(i));
		}
		re_md5 = buf.toString();
		return re_md5;
	}
	
	public static byte[] getSystemCharacterSetBytes(String str){
		try {
			return str.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			throw new RuntimeException(String.format("不支持%s编码!!", "utf-8"));
		}
	}
	
	public static byte[] Md5Digest(byte[] data){
		   MessageDigest MD5;
		try {
			MD5 = MessageDigest.getInstance("MD5");
			return MD5.digest(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new RuntimeException("获取MD5加密实例失败!!!");
		}        
	}
}
