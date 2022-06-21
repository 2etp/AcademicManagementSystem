<%@page import="javax.swing.plaf.basic.BasicSplitPaneUI.KeyboardResizeToggleHandler"%>
<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="BusanCommunityPack.BoardBean"%>
<%@ page import="BusanCommunityPack.CommentBean"%>
<%@ page import="java.util.Vector"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
     request.setCharacterEncoding("UTF-8");
     Vector<CommentBean> vlist = null;
     int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
     
     // 쿠키들을 불러오고 쿠키가 있는지 변수 확인
     Cookie[] cookies = request.getCookies();
     int visitor = 0;
     
     for(Cookie cookie : cookies) {
    	 // 쿠키들 중에 visit 이름이 있는지 확인
    	 if(cookie.getName().equals("visit")) {
    		 visitor = 1;
    		 //visit 안에 접속한 게시글 번호가 있는지 확인
    		 if(cookie.getValue().contains(request.getParameter("boardSeq"))) {
    			System.out.println("visit if 통과");
    		 } else {
    			 // 쿠키에 게시글 번호가 없다면 추가해 주고 조회수 올리기
    			 cookie.setValue(cookie.getValue() + "_" + request.getParameter("boardSeq"));
    			 response.addCookie(cookie);
    			 sMgr.upCount(boardSeq);
    		 }
     	}
     }
     
     // 쿠키가 없다면 쿠키를 만들어 주고 조회수 올리기
     if(visitor == 0) {
    	 Cookie cookie1 = new Cookie("visit", request.getParameter("boardSeq"));
    	 response.addCookie(cookie1);
     }
     
     String nowPage = request.getParameter("nowPage");
     String keyField = request.getParameter("keyField");
     String keyWord = request.getParameter("keyWord");
     String id = (String)session.getAttribute("idKey");
    	 
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

     session.setAttribute("commentBean", vlist);
    // int commentRef = 0;
    // int commentPos = 0;
    // int commentDepth = 0;
     
%>

<html>
<head>
<title>잘놀다갑니다</title>
<link rel="stylesheet" href="./css/destyle.css">
<link href="./css/read.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/dropdown.css">
<script defer src="./js/dropdown.js"></script>
<link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
<script type="text/javascript">
   function list() {
       document.listFrm.submit();
    } 
   
   function down(filename) {
       document.downFrm.filename.value=filename;
       document.downFrm.submit();
   }
   
   function commentLogin() {
		var commentTextareaEl = document.querySelector("input[name='commentContent']");
		
      <% if(id == null) { %>
         alert("로그인해 주세요.");
         document.commentFrm.commentContent.focus();
         return;
       <%} %>
       
         if(commentTextareaEl.value == ''){
       		alert("댓글을 입력해주세요");
       		return 0;
       	  }
           
           document.commentFrm.submit();
   }
   
<%--    function reply() {
      document.replycommentFrm.action="read.jsp?nowPage=" + <%=nowPage%> + "&boardSeq=" + <%=boardSeq%> + "&commentRef=" + <%=commentRef%>;
      document.replycommentFrm.submit();
   } --%>
</script>
</head>
<body>
	<header>
    <div class="header">
      <a href="./main.jsp" class="header-logo">
        <img src="./images/seagull.png">
        <div>잘놀다갑니다</div>
      </a>
      <ul class="header-menu">
        <li><a href="./busanIntroduce.jsp">부산소개</a></li>
        <li><a href="./community.jsp">커뮤니티</a></li>
        <li><a href="./newsAll.jsp">소식</a></li>
        <li><a href="./photo.jsp">포토</a></li>
      </ul>
      <div class="header-login">
        <% if(id != null) { %>
          <b class="login"><%=id %> 님</b>
          <input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
        <% } else { %>
          <a href="login.jsp">로그인</a>
          <a href="signup.jsp">회원가입</a>
        <% } %>
      </div>
    </div>
  </header>
  
   <main>
      <div class="main">
         <div class="title">
            <%=boardTitle%>
         </div>
		<div class="info">
         <div class="user">
            <% if(profileImage != null) { %>
            <img src="./images/<%=profileImage%>"/>
            <% } else {%>
            <img src="./images/ProfileImage.jpg"/>
            <% } %>
            <div class="name"><%=boardWriter%></div>
         </div>         
         <div class="time-count">
            <div class="time"><%=boardRegdate%></div>
            &nbsp;
            <div>|</div>
            &nbsp;
            <div class="count">조회수 <%=boardCount%></div>
         </div>
         </div>
         <hr>
         <div class="content">
            <%=boardContent%>   
         </div>
         <div class="buttons">
            <%
             if(id != null && id.equals(boardWriter)) {
             %> 
	          <a href="javascript:list()">목 록</a> 
	         <a href="update.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>" >수 정</a> 
	         <a href="delete.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>">삭 제</a>
	         <% } else { %>
	          <a href="javascript:list()" >목 록</a> 
	         <% }%>
         </div>
      </div>
   </main>
   
<main>
      <!-- 댓글 기능 -->
      <form name="commentFrm" method="post" action="commentPost" enctype="multipart/form-data">
         <div class="comment">
            <input type="text" name="commentContent" placeholder="댓글 등록하기"></input>
         </div>
        
         <!-- 댓글을 등록한 사용자의 IP 주소를 가져옴 -->
         <input type="hidden" name="commentIp" value="<%=request.getRemoteAddr()%>">
         <input type="hidden" name="commentWriter" value="<%=id%>">
         <input type="hidden" name="boardSeq" value="<%=boardSeq%>">
         <input type="hidden" name="nowPage" value="<%=nowPage%>">
         <div class="submit">
            <input type="button"  id="commentSubmit" value="등록" onClick="commentLogin()">
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
                <div class="info">
                   <!-- 댓글 작성자 이름 -->
                   <div class="user">
                     <% if(profileImage != null) { %>
                     <img src="./images/<%=profileImage%>"/>
                     <% } else {%>
                     <img src="./images/ProfileImage.jpg"/>
                     <% } %>
                     <div class="name"><%=commentWriter%></div></div>
                   <!-- 댓글 작성 날짜 -->
                   <div class="time-count" style="margin-left:50px;"><%=commentRegdate%></div>
                  </div>
                   <div><%=commentContent%></div>
     
                    <%
                      if(id != null && id.equals(commentWriter)) {
                   %> 
                   <div class="commentBtn">
                      <a href="read.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentRef=<%=commentRef%>">답 변</a> 
                      <a href="deleteComment.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentSeq=<%=commentSeq%>">삭 제</a>
                      <% } else { %>
                      <a class="nonLogin" href="read.jsp?nowPage=<%=nowPage%>&boardSeq=<%=boardSeq%>&commentRef=<%=commentRef%>" >답 변</a>
                      <% }%>           
                    </div>
                   <% } %>
                </td>
             </tr>
         </tbody>
      </table>   
   </main>   
    
   <!-- 대댓글 기능 -->
<%--    <form name="replycommentFrm" method="post" action="replyCommentPost" enctype="multipart/form-data">
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
   <footer>
    <div class="footer">
      <div class="footer-information">
        팀장 : 박휘원 | 전화번호 : 010-4623-0195 <br><br>
        팀원 : 송민영 | 전화번호 : 010-8800-3995 <br><br>
        팀원 : 최낙원 | 전화번호 : 010-9753-0266 <br><br>
        팀원 : 최영수 | 전화번호 : 010-6356-2213 <br><br>
      </div>
    </div>
  </footer>
  
  <div class="dropdown inactive">
   <div class="drop-container">
	  <div>
	      <p class="droptitle"><% if(id != null) { %>
          <b class="login"><%=id %> 님</b></p>
          <% } else { %>
          <a href="login.jsp">로그인</a>
          <a href="signup.jsp">회원가입</a>
          <% } %>
	        <div class="dropmenu">
		        <div class="dropmenuList">
		          <a href="setting.jsp">공지사항</a>
	            </div>
   		        <div class="dropmenuList">
		          <a href="setting.jsp">도움말</a>
	            </div>
   		        <div class="dropmenuList">
		          <a href="setting.jsp">설정</a>
	            </div>
	        </div>
	      <div class="btn">
	        <input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	        <button class="close">취소</button>
	      </div>
	  </div>
   </div>
</div>
</body>
</html>