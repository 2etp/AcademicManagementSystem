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
	  
	  // 유저 이미지 파일 불러오기
	  String profileImage = sMgr.getProfileImage(boardWriter);

	  //session.setAttribute("commentBean", vlist);
	 // int commentRef = 0;
	 // int commentPos = 0;
	 // int commentDepth = 0;
	  
%>

<html>
<head>
<title>JSP Board</title>
<link rel="stylesheet" href="./css/destyle.css">
<link href="./css/read.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list() {
	    document.listFrm.submit();
	 } 
	
	function down(filename) {
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
	

	function commentLogin() {
		<% if(id == null) { %>
			alert("로그인해 주세요.");
			document.commentFrm.commentContent.focus();
			return;
		<%} else {%>
		//event.preventDefault();
		document.commentFrm.submit();
		<%}%>
	}
	
<%-- 	function reply() {
		document.replycommentFrm.action="read.jsp?nowPage=" + <%=nowPage%> + "&boardSeq=" + <%=boardSeq%> + "&commentRef=" + <%=commentRef%>;
		document.replycommentFrm.submit();
	} --%>
</script>
</head>
<body>
	<main>
		<div class="main">
			<div class="title">
				<%=boardTitle%>
			</div>
			<div class="time-count">
				<div class="time"><%=boardRegdate%></div>
				&nbsp;
				<div>|</div>
				&nbsp;
				<div class="count">조회수 <%=boardCount%></div>
			</div>
			<div class="user">
				<% if(profileImage != null) { %>
				<img src="./images/<%=profileImage%>"/>
				<% } else {%>
				<img src="./images/ProfileImage.jpg"/>
				<% } %>
				<div class="name"><%=boardWriter%></div>
			</div>
			<hr>
			<div class="content">
				<%=boardContent%>	
			</div>
		</div>
	</main>
<main>
		<!-- 댓글 기능 -->
		<form name="commentFrm" method="post" action="commentPost" enctype="multipart/form-data">
			<div class="comment">
				<textarea name="commentContent" placeholder="댓글 등록하기"></textarea>
			</div>
			
			<!-- 댓글을 등록한 사용자의 IP 주소를 가져옴 -->
			<input type="hidden" name="commentIp" value="<%=request.getRemoteAddr()%>">
			<input type="hidden" name="commentWriter" value="<%=id%>">
			<input type="hidden" name="boardSeq" value="<%=boardSeq%>">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<div class="submit">
				<input type="submit" value="등록">
			</div>
			
		</form>
	</main>
	<main>
		<table class="main">
			<thead>
				<tr>
					<td>댓글 </td>
				</tr>
			</thead>
			<tbody>
				<% for(int i = 0; i < vlist.size(); ++i) {
		 				CommentBean commentBean = vlist.get(i);
		 		
		 				int commentSeq = commentBean.getCommentSeq();
					    String commentWriter = commentBean.getCommentWriter();
					    String commentContent = commentBean.getCommentContent();
					    String commentRegdate = commentBean.getCommentRegdate();
					    int commentDepth = commentBean.getCommentDepth();
					    int commentRef = commentBean.getCommentRef();
					    int commentPos = commentBean.getCommentPos();
				    
					    if(commentDepth > 0) {
					    	for(int j = 0; j < commentDepth; ++j) {
					    		out.println("&nbsp;&nbsp;");
					    	}
					    }
				    
			 	%>
			 	<tr>
			 		<td>
						 <!-- 댓글 작성자 이름 -->
						 <div class="user">
							<% if(profileImage != null) { %>
							<img src="./images/<%=profileImage%>"/>
							<% } else {%>
							<img src="./images/ProfileImage.jpg"/>
							<% } %>
							<div class="name"><%=commentWriter%></div>
					     </div>
						 <!-- 댓글 작성 날짜 -->
						 <div class="time-count"><%=commentRegdate%></div>
						 <div><%=commentContent%></div>
 	 
					 	 <%
						 	if(id != null && id.equals(commentWriter)) {
						 %> 
						 <div>
						 	[ <a href="read.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentRef=<%=commentRef%>">답변</a> |
						 	<a href="deleteComment.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentSeq=<%=commentSeq%>">삭 제</a> ]<br/>
						 	<% } else { %>
						 	[ <a href="read.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentRef=<%=commentRef%>" >답변</a> ]
						 	<% }%> 		    
					 	 </div>
					 	<% } %>
			 		</td>
			 	</tr>
			</tbody>
		</table>	
	</main>	
	
	<main>
		<a href=./community.jsp>목록으로</a>
	</main>
	 
	<!-- 대댓글 기능 -->
<%-- 	<form name="replycommentFrm" method="post" action="replyCommentPost" enctype="multipart/form-data">
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
	</form> --%>

	<!-- 파일 다운로드 폼 -->
	<form name="downFrm" action="download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	
	<form name="listFrm" method="post" action="community.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<%if(!(keyWord==null || keyWord.equals(""))){ %>
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<%}%>
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>


</body>
</html>