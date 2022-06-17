<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@	page import="BusanCommunityPack.BoardBean"%>
<%@	page import="BusanCommunityPack.CommentBean"%>
<%@	page import="java.util.Vector"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	  request.setCharacterEncoding("UTF-8");
	  Vector<CommentBean> vlist = null;
	  
	  int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  String id = (String)session.getAttribute("idKey");
	  
	  sMgr.upCount(boardSeq); // 조회수 증가
	  BoardBean bean = sMgr.getBoard(boardSeq); // 게시물 가져오기
	  
	  vlist = sMgr.getCommentList(boardSeq); // 댓글 가져오기
	  
	  String boardWriter = bean.getBoardWriter();
	  String boardTitle = bean.getBoardTitle();
      String boardRegdate = bean.getBoardRegdate();
	  String boardContent = bean.getBoardContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String boardIp = bean.getBoardIp();
	  int boardCount = bean.getBoardCount();

	  session.setAttribute("bean", bean); //게시물을 세션에 저장
	  session.setAttribute("commentBean", vlist);
	  int commentRef = 0;
	  int commentPos = 0;
	  int commentDepth = 0;
%>

<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list() {
	    document.listFrm.submit();
	 } 
	
	function down(filename) {
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
	

	function commentLogin() {
		<% if(id != null)  %>
			alert("로그인해 주세요.");
			//document.commentFrm.action="read.jsp";
	}
	
	function reply() {
		document.replycommentFrm.action="read.jsp?nowPage=" + <%=nowPage%> + "&boardSeq=" + <%=boardSeq%> + "&commentRef=" + <%=commentRef%>;
		document.replycommentFrm.submit();
	}
</script>
</head>
<body>
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> 이 름 </td>
  <td bgcolor="#FFFFE8"><%=boardWriter%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> 등록날짜 </td>
  <td bgcolor="#FFFFE8"><%=boardRegdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> 제 목</td>
    <td bgcolor="#FFFFE8" colspan="3"><%=boardTitle%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=boardContent%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
      조회수  <%=boardCount%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
	 <td align="center" colspan="2"> 
	 <hr/>
	 <%
	 	if(id != null) {
	 %> 
	 [ <a href="javascript:list()" >리스트</a> |
	 <a href="update.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>" >수 정</a> |
	 <a href="delete.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>">삭 제</a> ]<br/>
	 <% } else { %>
	 [ <a href="javascript:list()" >리스트</a> ]
	 <% }%>
	 </td>
 </tr>
</table>

	<!-- 댓글 기능 -->
	<form name="commentFrm" method="post" action="commentPost" enctype="multipart/form-data">
		<textarea name="commentContent" placeholder="회원으로 등록할 수 있습니다."></textarea>
		<!-- 댓글을 등록한 사용자의 IP 주소를 가져옴 -->
		<input type="hidden" name="commentIp" value="<%=request.getRemoteAddr()%>">
		<input type="hidden" name="commentWriter" value="<%=id%>">
		<input type="hidden" name="boardSeq" value="<%=boardSeq%>">
		<input type="submit" value="등록" onClick="commentLogin()">
	
		<h2>댓글</h2>
	</form>
	
	 <hr/>
	 
	 <% for(int i = 0; i < vlist.size(); ++i) {
	 		CommentBean commentBean = vlist.get(i);
	 		
	 		int commentSeq = commentBean.getCommentSeq();
 		    String commentWriter = commentBean.getCommentWriter();
 		    String commentContent = commentBean.getCommentContent();
 		    String commentRegdate = commentBean.getCommentRegdate();
 		    commentDepth = commentBean.getCommentDepth();
 		    commentRef = commentBean.getCommentRef();
 		    commentPos = commentBean.getCommentPos();
 		    
 		    if(commentDepth > 0) {
 		    	for(int j = 0; j < commentDepth; ++j) {
 		    		out.println("&nbsp;&nbsp;");
 		    	}
 		    }
 		    
 	 %>
 	 <!-- 댓글 작성자 이름 -->
 	 <div><%=commentWriter%></div>
 	 <!-- 댓글 내용 -->
 	 <div><%=commentContent%></div>
 	 <!-- 댓글 작성 날짜 -->
 	 <div><%=commentRegdate%></div>
 	 
	 	 <%
		 	if(id != null) {
		 %> 
		 [ <a href="read.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentRef=<%=commentRef%>">답변</a> |
		 <a href="deleteComment.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentSeq=<%=commentSeq%>">삭 제</a> ]<br/>
		 <% } else { %>
		 [ <a href="read.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentRef=<%=commentRef%>" >답변</a> ]
		 <% }%> 		    
	 		
	 <% } %>
	 
	<!-- 대댓글 기능 -->
	<form name="replycommentFrm" method="post" action="replyCommentPost" enctype="multipart/form-data">
		<textarea name="commentContent" placeholder="회원으로 등록할 수 있습니다."></textarea>
		<!-- 댓글을 등록한 사용자의 IP 주소를 가져옴 -->
		<input type="hidden" name="commentIp" value="<%=request.getRemoteAddr()%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="commentRef" value="<%=commentRef%>">
		<input type="hidden" name="commentPos" value="<%=commentPos%>">
		<input type="hidden" name="commentDepth" value="<%=commentDepth%>">
		<input type="hidden" name="commentWriter" value="<%=id%>">
		<input type="hidden" name="boardSeq" value="<%=boardSeq%>">
		<input type="submit" value="등록">
	</form>

	<!-- 파일 다운로드 폼 -->
	<form name="downFrm" action="download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	
	<form name="listFrm" method="post" action="community.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>


</body>
</html>