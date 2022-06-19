<%@ page contentType="text/html;charset=UTF-8"%> 
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>
<jsp:useBean id="memberBean" class="BusanCommunityPack.MemberBean"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	String pw = request.getParameter("pw");
	
	String url = null;
	String msg = null;
	
	boolean result = sMgr.resetPw(id, pw);
	
	if(result) {
		 msg = "비밀번호를 재설정하였습니다.";
		 url = "setting.jsp";
	}
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>