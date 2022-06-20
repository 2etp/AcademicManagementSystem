<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@	page import="BusanCommunityPack.BoardBean"%>
<%@	page import="BusanCommunityPack.CommentBean"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String nowPage = request.getParameter("nowPage");
	int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
	int commentSeq = Integer.parseInt(request.getParameter("commentSeq"));
	System.out.println(boardSeq);
	System.out.println(commentSeq);
    String inId = (String)session.getAttribute("idKey");
    System.out.println(inId);
    
	if (inId != null) {
		CommentBean bean = (CommentBean) session.getAttribute("CommentBean");
		String dbId = bean.getCommentWriter();
		System.out.println(dbId);
		if (inId.equals(dbId)) {
			sMgr.deleteComment(boardSeq, commentSeq);
			String url = "read.jsp?nowPage=" + nowPage + "&boardSeq=" + boardSeq;
			response.sendRedirect(url);
		}
		
	}
			
%>
