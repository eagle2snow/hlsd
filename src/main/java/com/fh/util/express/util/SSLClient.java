/**
 * Title: This class is used for ...  
 * fileName: SSLClient.java
 * @author zhangWenChao 张文超
 * @Created on 2017年8月2日 下午6:26:10
 * @version 1.0
 * @Copyright 2017 Hlsd Software Co.,Ltd. Rights Reserved.
 * @Company 常诚恒业科技有限公司
 */

package com.fh.util.express.util;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.DefaultHttpClient;  

	public class SSLClient extends DefaultHttpClient{  
	    public SSLClient() throws Exception{  
	        super();  
	        SSLContext ctx = SSLContext.getInstance("TLS");  
	        X509TrustManager tm = new X509TrustManager() {  
	                @Override  
	                public void checkClientTrusted(X509Certificate[] chain,  
	                        String authType) throws CertificateException {  
	                }  
	                @Override  
	                public void checkServerTrusted(X509Certificate[] chain,  
	                        String authType) throws CertificateException {  
	                }  
	                @Override  
	                public X509Certificate[] getAcceptedIssuers() {  
	                    return null;  
	                }  
	        };  
	        ctx.init(null, new TrustManager[]{tm}, null);  
	        SSLSocketFactory ssf = new SSLSocketFactory(ctx,SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);  
	        ClientConnectionManager ccm = this.getConnectionManager();  
	        SchemeRegistry sr = ccm.getSchemeRegistry();  
	        sr.register(new Scheme("https", 8081, ssf));
	    }  
	}  

