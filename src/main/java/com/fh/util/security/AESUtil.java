package com.fh.util.security;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.fh.util.Tools;

public class AESUtil {
	
	private static int length=128;  
    /** 
     * 加密 
     *  
     * @param content 
     *            需要加密的内容 
     * @param password 
     *            加密密码 
     * @return 
     * @throws NoSuchAlgorithmException 
     * @throws NoSuchPaddingException 
     * @throws UnsupportedEncodingException 
     * @throws InvalidKeyException 
     * @throws BadPaddingException 
     * @throws IllegalBlockSizeException 
     */  
    private static byte[] encrypt(String content, String password){
       try {
    	   KeyGenerator kgen = KeyGenerator.getInstance("AES");  
           SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG" );   
           secureRandom.setSeed(password.getBytes());   
		   kgen.init(length, secureRandom);  
		   SecretKey secretKey = kgen.generateKey();  
		   byte[] enCodeFormat = secretKey.getEncoded();  
		   SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");  
		   Cipher cipher = Cipher.getInstance("AES");// 创建密码器  
		   byte[] byteContent = content.getBytes("utf-8");  
		   cipher.init(Cipher.ENCRYPT_MODE, key);// 初始化  
		   byte[] result = cipher.doFinal(byteContent);
		   return result; // 加密  
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
    
    
    /** 
     * 解密 
     *  
     * @param content 
     *            待解密内容 
     * @param password 
     *            解密密钥 
     * @return 
     */  
    private static byte[] decrypt(byte[] content, String password){  
        try {
        	KeyGenerator kgen = KeyGenerator.getInstance("AES");  
            SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG" );   
            secureRandom.setSeed(password.getBytes());   
            kgen.init(length, secureRandom);  
            SecretKey secretKey = kgen.generateKey();  
            byte[] enCodeFormat = secretKey.getEncoded();  
            SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");  
            Cipher cipher = Cipher.getInstance("AES");// 创建密码器  
            cipher.init(Cipher.DECRYPT_MODE, key);// 初始化  
            byte[] result = cipher.doFinal(content);  
            return result; // 解密  
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
    
	private static String getSystemKey() {
		return Tools.getProperty("aesKey", "hlsd");
	}
    
    /**
     * 加密
     * @param content  加密内容
     * @param password 加密密码 ，默认调用  getSystemKey()
     * @return
     */
    public static String encrypt2Str(String content) {
    	String password = getSystemKey();
        byte[] encryptResult = encrypt(content, password);  
        return Base64.encode(encryptResult);  
    }  

    /**
     * 解密
     * @param content  解密内容
     * @param password 解密密码
     * @return
     */
    public static String decrypt2Str(String content){  
        try {
        	byte[] decryptResult = decrypt(Base64.decode(content), getSystemKey());  
            return new String(decryptResult,"UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
    
    
    public static void main(String[] args) throws Exception {  
        String content = "t太阳est地";  
        //String password = getSystemKey(); 
        // 加密  
        System.out.println("加密前：" + content);  
  
        String tt4 = encrypt2Str(content);  
        System.out.println(new String(tt4));  
  
        // 解密  
        String d = decrypt2Str(tt4);  
        System.out.println("解密后：" + d);  
        
//      加密前：t太阳est地  
//      Bpf0jyJDj/pVHaRf66+OMA==  
//      解密后：t太阳est地  
    }  

}