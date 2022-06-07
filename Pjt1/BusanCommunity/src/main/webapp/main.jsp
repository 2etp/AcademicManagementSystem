<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(Cookie tempCookie : cookies) {
			if(tempCookie.getName().equals("idKey")) {
				//쿠키 값으로 대신 로그인 처리함
				session.setAttribute("idKey", tempCookie.getValue());
			}
		}
	}
	
    //세션값 가져오기, Object형으로 저장되기에 다운케스팅이 필요하다.
    String id =(String)session.getAttribute("idKey");
    
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>고객페이지</h1>
	<b><%=id %> 님이 로그인 했습니다.</b>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">

</body>
</html>