<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@	page import="BusanCommunityPack.BoardBean"%>
<%@	page import="java.util.Vector"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%	
	 request.setCharacterEncoding("UTF-8");
	 String id = (String)session.getAttribute("idKey");
	 
	 int totalRecord=0; //전체레코드수
	 int numPerPage=10; // 페이지당 레코드 수 
	 int pagePerBlock=15; //블럭당 페이지수 
	 
	 int totalPage=0; //전체 페이지 수
	 int totalBlock=0;  //전체 블럭수 
	
	 int nowPage=1; // 현재페이지
	 int nowBlock=1;  //현재블럭
	 
	 int start=0; //디비의 select 시작번호
	 int end=10; //시작번호로 부터 가져올 select 갯수
	 
	 int listSize=0; //현재 읽어온 게시물의 수

	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;
	
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = sMgr.getBoardTotalCnt(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <!-- CSS 초기화 -->
  <link rel="stylesheet" href="./css/destyle.css">
  <!-- Google API -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

  <link rel="stylesheet" href="./css/common.css" >
  <link rel="stylesheet" href="./css/community.css">

  
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
        <li><a href="./news.jsp">소식</a></li>
        <li><a href="./photo.jsp">포토</a></li>
      </ul>
      <div class="header-login">
        <% if(id != null) { %>
          <b class="login"><%=id %> 님이 로그인 했습니다.</b>
          <a href="setting.jsp">설정</a>
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
                <div>회사생활</div>
                <div>참여자</div>
              </a>
            </li>
            <hr>
            <li>
              <a href="javascript:void(0)">
                <div>모두의 토론</div>
                <div>참여자</div>
              </a>
            </li>
            <hr>
          </ul>
        </div>
      </section>
      <section class="main-section-center">
        <div class="search" >
        	<form  name="searchFrm"  method="get" action="community.jsp">
				<table>
			 		<tr>
			  			<td>
			   				<input size="16" name="keyWord">
			   				<input type="hidden" name="nowPage" value="1">
			   				<input type="text" placeholder="검색할 글을 입력해주세요.">
	          				<button onClick="javascript:check()"><span class="material-symbols-outlined">search</span></button>
			  			</td>
			 		</tr>
				</table>
			</form>       
        </div>
        <!-- <div class="board"> -->
        	<table>
        		<tr>
					<td align="center">
					<%
						  vlist = sMgr.getBoardList(keyField, keyWord, start, end);
						  
						  listSize = vlist.size();//브라우저 화면에 보여질 게시물 번호
						  if (vlist.isEmpty()) {
							out.println("등록된 게시물이 없습니다.");
						  } else {
					%>
				<table>
							<%
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
																				
								<a href="javascript:read('<%=boardSeq%>')">
									<div><%=boardTitle%></div><br>
									<div align="center"><%=boardContent%></div><br>
									<img src="./images/<%=profileImage%>"/>
									<div align="center"><%=boardWriter%></div><br>
									<div align="center"><%=boardCount%></div><br>
								</a>
							</tr>
					<%}//for%>
				</table> <%
 			}//if
 		%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><br /><br /></td>
		</tr>
		<tr>
			<td>
			<!-- 페이징 및 블럭 처리 Start--> 
			<%
   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
   				  //하단 페이지 끝번호
   				  if(totalPage !=0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
     					[<%=pageStart %>] 
     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
    					<%}//for%>&nbsp; 
    					<%if (totalBlock > nowBlock ) {%>
    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
    				<%}%>&nbsp;  
   				<%}%>
 				<!-- 페이징 및 블럭 처리 End-->
				</td>
			
		</tr>
		</table>
			<form name="postFrm" method="post">
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
				<input type="hidden" name="keyField" value="<%=keyField%>"> 
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
			</form>
        	

       <!--  </div> -->
      </section>
      <section class="main-section-right">
        <div class="realtimerank">
          <div class="realtimerank-item"><a href="javascript:void(0)">111111111111111111111111111111</a></div>
          <div class="realtimerank-item"><a href="javascript:void(0)">2222222222222222222222222222</a></div>
          <div class="realtimerank-item"><a href="javascript:void(0)">333333333333333333333333333</a></div>
          <div class="realtimerank-item"><a href="javascript:void(0)">44444444444444444444444444</a></div>
          <div class="realtimerank-item"><a href="javascript:void(0)">55555555555555555555555555</a></div>
          <div class="realtimerank-item"><a href="javascript:void(0)">6666666666666666666666666666</a></div>
        </div>

      </section>
    </div>
    <!-- 페이지무브 버튼 -->
<!--     <div class="pagemove">
      <ul>
        <li class="pagemove-Arrow">
          <a href="javascript:void(0)">
            &lt
          </a>
        </li>
        <span class="pagemove-number">
          <li><a class="current" href="javascript:void(0)">1</a></li>
          <li><a href="javascript:void(0)">2</a></li>
          <li><a href="javascript:void(0)">3</a></li>
          <li><a href="javascript:void(0)">4</a></li>
          
        </span>
        <li class="pagemove-Arrow">
          <a href="javascript:void(0)">
            &gt
          </a>
        </li>
      </ul>
    </div> -->
  </main>
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