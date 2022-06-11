<%@ page contentType="text/html;charset=UTF-8"%> 
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>
<jsp:useBean id="memberBean" class="BusanCommunityPack.MemberBean"/>
<jsp:setProperty property="*" name="memberBean"/>

<%
	boolean result = sMgr.insertMember(memberBean);
	String msg = "회원가입에 실패하였습니다.";
	String location = "signup.jsp";
	
	if(result) {
		msg = "회원가입 되었습니다.";
		location = "login.jsp";
	}
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script>

