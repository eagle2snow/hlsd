<%@page import="com.fh.controller.weixin.pay.util.MD5Util"%>
<%@page import="com.fh.util.Tools"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String md5Key = Tools.getProperty("api_token_key", "");
	request.setAttribute("md5Key", MD5Util.string2MD5("md5Key"));
%>