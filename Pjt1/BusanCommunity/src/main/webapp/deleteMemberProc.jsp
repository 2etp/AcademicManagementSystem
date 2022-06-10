<%@ page contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>
<jsp:useBean id="memberBean" class="BusanCommunityPack.MemberBean"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	String pw = request.getParameter("pw");
	
	String msg = null;
	String url = null;
	
	boolean result = sMgr.deleteMember(id, pw);
	

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
	
	if(result) {
		
		msg = "회원탈퇴가 완료되었습니다.";
		url = "main.jsp";
	}
	
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
