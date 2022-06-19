<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
		// session 초기화
		session.invalidate();
	
		// 로그인 관련 쿠키 삭제
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie tempCookie : cookies) {
				if(tempCookie.getName().equals("idKey")) {
					tempCookie.setMaxAge(0);
					tempCookie.setPath("/");
					response.addCookie(tempCookie);
				}
			}
		}
%>

<script>
	alert("로그아웃 되었습니다.");
	location.href = "login.jsp";
</script>

</body>
</html>