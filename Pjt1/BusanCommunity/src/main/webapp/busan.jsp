<%@page import="com.sun.syndication.io.XmlReader"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
	try {
		URL feedUrl = new URL("https://www.busan.go.kr/nbnews.rss");
		XmlReader reader = new XmlReader(feedUrl);
		char cbuf[] = new char[512];
		int len;
		while((len = reader.read(cbuf, 0, 512)) != -1) {
			out.write(new String(cbuf), 0, len);
		}
		out.flush();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>