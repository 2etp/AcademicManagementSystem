<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@	page import="BusanCommunityPack.CommentBean"%>
<%@ page import="java.util.Vector"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String nowPage = request.getParameter("nowPage");
	int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
	int commentSeq = Integer.parseInt(request.getParameter("commentSeq"));
    String inId = (String)session.getAttribute("idKey");
    System.out.println(inId);
    String dbId =  null;
    
    // 로그인 했는지 검사
	if (inId != null) {
		Vector<CommentBean> vlist = (Vector) session.getAttribute("commentBean");
		
		// read.jsp에서 세션으로 저장한 댓글 리스트를 출력하면서 해당 댓글 작성자 불러오기
		for(int i = 0; i < vlist.size(); ++i) {
			 CommentBean commentBean = vlist.get(i);
			 dbId = commentBean.getCommentWriter();
			 System.out.println(dbId);
		}
		
		// 현재 로그인 한 id와 댓글 작성자의 id가 같으면 삭제하고 게시글 읽기 페이지로 다시 이동
		if (inId.equals(dbId)) {
			sMgr.deleteComment(boardSeq, commentSeq);
			String url = "read.jsp?nowPage=" + nowPage + "&boardSeq=" + boardSeq;
			response.sendRedirect(url);
		 }
		
	}
			
%>
