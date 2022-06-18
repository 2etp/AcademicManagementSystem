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
    
    // 현재 로그인한 상태이고, 그 로그인한 id와 db에 저장된 게시물의 id(작성자)가 일치하면 해당 글을 삭제함 
	if (inId != null) {
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbId = bean.getBoardWriter();
		if (inId.equals(dbId)) {
			// 외래키 설정으로 인해 현재 게시물을 참조하고 있는 댓글들을 먼저 삭제해 줘야 함
			sMgr.deleteComment(boardSeq, commentSeq);
			sMgr.deleteBoard(boardSeq);
			url = "community.jsp?nowPage=" + nowPage;
			msg = "삭제되었습니다.";
		}
	}
%>

<script type="text/javascript">

	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>

