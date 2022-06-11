<%@ page contentType="text/html;charset=UTF-8"%> 
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>
<jsp:useBean id="memberBean" class="BusanCommunityPack.MemberBean"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	String mobile = request.getParameter("mobile");
	
	String url = null;
	String msg = null;
	
	boolean result = sMgr.resetMobile(id, mobile);
	
	if(result) {
		 msg = "휴대폰 번호를 재설정하였습니다.";
		 url = "setting.jsp";
	}
%>

<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>