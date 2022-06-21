<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@	page import="BusanCommunityPack.BoardBean"%>
<%@	page import="java.util.Vector"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%	
	 request.setCharacterEncoding("UTF-8");
	 String id = (String)session.getAttribute("idKey");
	 
	 int totalRecord=0; //전체레코드수
	 int numPerPage=6; // 페이지당 레코드 수 
	 int pagePerBlock=15; //블럭당 페이지수 
	 
	 int totalPage=0; //전체 페이지 수
	 int totalBlock=0;  //전체 블럭수 
	
	 int nowPage=1; // 현재페이지
	 int nowBlock=1;  //현재블럭
	 
	 int start=0; //디비의 select 시작번호
	 int end=10; //시작번호로 부터 가져올 select 갯수
	 
	 int listSize=0; //현재 읽어온 게시물의 수

	String keyWord = "";
	Vector<BoardBean> vlist = null;
	
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
	}
	
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = sMgr.getBoardTotalCnt(keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>잘놀다갑니다</title>
  <!-- CSS 초기화 -->
  <link rel="stylesheet" href="./css/destyle.css">
  
  <!-- Google API -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

  <!-- swiper.js -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.2.4/swiper-bundle.css" integrity="sha512-303pOWiYlJMbneUN488MYlBISx7PqX8Lo/lllysH56eKO8nWIMEMGRHvkZzfXYrHj4j4j5NtBuWmgPnkLlzFCg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script defer src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/8.2.4/swiper-bundle.min.js" integrity="sha512-Hvn3pvXhhG39kmZ8ue3K8hw8obT4rfLXHE5n+IWNCMkR6oV3cfkQNUQqVvX3fNJO/JtFeo/MfLmqp5bqAT+8qg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <!-- Other -->
  <link rel="stylesheet" href="./css/common.css" >
  <link rel="stylesheet" href="./css/community.css">
  <link rel="stylesheet" href="./css/dropdown.css">
  <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
  <script defer src="./js/community.js"></script>
  <script defer src="./js/dropdown.js"></script>
 
 
  <script type="text/javascript">
  
	function list() {
		document.listFrm.action = "community.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(boardSeq){
		document.readFrm.boardSeq.value=boardSeq;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
	     }
	  document.searchFrm.submit();
	 }
	
	function loginChk() {
		if (document.postFrm.id.value == "") {
			alert("로그인해 주세요.")
			document.postFrm.action="login.jsp";
			
		} else {
			document.postFrm.action= "post.jsp";
		}
		document.postFrm.submit();
	}
</script>
</head>
<body>
  <!-- 헤더 -->
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
  
  <!-- 메인 -->
  <main>
    <div class="main-section">
      <section class="main-section-left">
        <div class="main-section-left1">
          <div class="main-section-left1-header">
            <img src="./images/seagull.png">
            <div>관심사 커뮤니티</div>
          </div>
          <ul class="main-section-left1-item">
            <li>
              <a href="javascript:void(0)">
                <div>여행</div>
              </a>
            </li>
            <li>
              <a href="javascript:void(0)">
                <div>모두의 토론</div>
              </a>
            </li>
          </ul>
        </div>
      </section>
      <section class="main-section-center">
        <div class="search" >
        	<form  name="searchFrm"  method="get" action="community.jsp">
				<table>
			 		<tr>
			  			<td>
			   				<input type="text" size="16" placeholder="검색할 글을 입력해주세요." name="keyWord">
			   				<input type="hidden" name="nowPage" value="1">
	          				<button onClick="javascript:check()"><span class="material-symbols-outlined">search</span></button>
			  			</td>
			 		</tr>
				</table>
			</form>       
        </div>
       <table class="content-table">
        	<thead>
        		<tr>
        			<td>게시판</td>
        		</tr>
        	</thead>
        	<tbody>
					<%
						  vlist = sMgr.getBoardList(keyWord, start, end);
						  
						  listSize = vlist.size();//브라우저 화면에 보여질 게시물 번호
						  if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						  } else {

						  for (int i = 0;i<numPerPage; i++) {
								if (i == listSize) break;
								BoardBean bean = vlist.get(i);
								int boardSeq = bean.getBoardSeq();
								String boardWriter = bean.getBoardWriter();
								// 유저 이미지 파일 불러오기
								String profileImage = sMgr.getProfileImage(boardWriter);
								String boardTitle = bean.getBoardTitle();
								String boardContent = bean.getBoardContent();
								
								int boardCount = bean.getBoardCount();
					%>
				<tr>
					<td>																					
						<a href="javascript:read('<%=boardSeq%>')">
							<div class="boardTitle"><%=boardTitle%></div>
							<div class="boardContent"><%=boardContent%></div>
							<div class="boardUser">
							  <div class="left">
								<% if(profileImage != null) { %>
									<img src="./images/<%=profileImage%>"/>
								<% } else {%>
									<img src="./images/ProfileImage.jpg"/>
								<% } %>
								<div><%=boardWriter%></div>
							  </div>
							  <div class="boardCount right">
								<div class="time"></div>
								<div class="count">
									<img src="./images/eye.png"/>
									<span><%=boardCount%></span>
							  	</div>
							  </div>
							</div>
							
						</a>
					</td>
        		</tr>
				<%} // end for
			}%> <!-- end else -->  		
        	</tbody>
        </table>
        <table class="pageNum">
			<tr>
				<td>
				<div>
			<!-- 페이징 및 블럭 처리 Start--> 
				<%
					  //하단 페이지 시작번호
	   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; 
				      //하단 페이지 끝번호
	   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
	   				  
	   				  if(totalPage !=0){
	    			  	if (nowBlock > 1) {%>
	    			  		<a class="num" href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%> 
	    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
	     			     	<a class="num" href="javascript:pageing('<%=pageStart %>')"> 
	     					<%if(pageStart==nowPage) {%><font> <%}%>
	     					[<%=pageStart %>]
	     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
	    					<%}//for%>
	    					<%if (totalBlock > nowBlock ) {%>
	    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
	    				<%}%>
	   				<%}%>
	 				<!-- 페이징 및 블럭 처리 End-->
	 				</div>
				</td>		
			</tr>
		</table>
		
			<form class="bottomMenu" name="postFrm" method="post">
				<div style="float: right">
					<% if(id == null) { %>			
					<input type="hidden" name="id"> 
					<input type="button" value="[글쓰기]" onClick="javascript:loginChk()">
					<a href="javascript:list()">[처음으로]</a>
					<% } else {%>
					<input type="button" value="[글쓰기]" onClick="javascript:loginChk()">
					<a href="javascript:list()">[처음으로]</a>
					<% } %>
				</div>
			</form>

			<form name="listFrm" method="post">
				<input type="hidden" name="reload" value="true"> 
				<input type="hidden" name="nowPage" value="1">
			</form>
			<form name="readFrm" method="get">
				<input type="hidden" name="boardSeq"> 
				<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
			</form>
        	
      </section>
      
      
      
      <section class="main-section-right">
        <div class="realtimerank swiper">
          <div class="swiper-wrapper">
          	<div class="swiper-slide">
          		<a href="javascript:void(0)">test</a>
          	</div>
          	<div class="swiper-slide">
          		<a href="javascript:void(0)">admin</a>
          	</div>
          	<div class="swiper-slide">
          		<a href="javascript:void(0)">Busan</a>
          	</div>
          	<div class="swiper-slide">
          		<a href="javascript:void(0)">Nickname</a>
          	</div>
          	<div class="swiper-slide">
          		<a href="javascript:void(0)">hahaha</a>
          	</div>
          	<div class="swiper-slide">
          		<a href="javascript:void(0)">dsaiadu</a>
          	</div>
          </div>
        </div>
      </section>
    </div>
  </main>
  
  
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

  
  <!-- 푸터 -->
  <footer>
    <div class="footer">
      <div class="footer-information">
        <br><br>
        팀장 : 박휘원 | 전화번호 : 010-4623-0195 <br><br>
        팀원 : 송민영 | 전화번호 : 010-8800-3995 <br><br>
        팀원 : 최낙원 | 전화번호 : 010-9753-0266 <br><br>
        팀원 : 최영수 | 전화번호 : 010-6356-2213 <br><br>
      </div>
    </div>
  </footer>
  
 
</body>
</html>