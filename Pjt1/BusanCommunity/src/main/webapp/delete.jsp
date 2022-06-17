<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@	page import="BusanCommunityPack.BoardBean"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String nowPage = request.getParameter("nowPage");
	int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
	int commentSeq = 0;
    String inId = (String)session.getAttribute("idKey");
    String msg = null;
    String url = null;
    
	if (inId != null) {
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbId = bean.getBoardWriter();
		if (inId.equals(dbId)) {
			sMgr.deleteComment(boardSeq, commentSeq);
			sMgr.deleteBoard(boardSeq);
			url = "community.jsp?nowPage=" + nowPage;
			msg = "삭제되었습니다.";
			//response.sendRedirect(url);
		}
	}
%>

<script type="text/javascript">

	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>

