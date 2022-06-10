<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<%@	page import="BusanCommunityPack.PhotoBean"%>
<%@	page import="java.util.Vector"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	
	int totalRecord=0; //전체레코드수
	int numPerPage=6; // 페이지당 레코드 수 
	int pagePerBlock=5; //블럭당 페이지수 
	
	int totalPage=0; //전체 페이지 수
	int totalBlock=0;  //전체 블럭수 
	
	int nowPage=1; // 현재페이지
	int nowBlock=1;  //현재블럭
	
	int start=0; //디비의 select 시작번호
	int end=6; //시작번호로 부터 가져올 select 갯수
	
	int listSize=0; //현재 읽어온 게시물의 수
	
	String keyWord = "";
	Vector<PhotoBean> vlist = null;
	
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
	}
	
	out.println(keyWord);
	
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
	
	// 총 게시물 수 받아오기(현재 2개)
	totalRecord = sMgr.getTotalCount(keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
	
	String jungGu = "junggu";
	
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="./css/destyle.css">
  <link rel="stylesheet" href="./css/common.css" >
  <link rel="stylesheet" href="./css/photo.css">
  
  <script type="text/javascript">
	function list() {
		
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
	
	function jungGu(area) {
		console.log(area);
		document.photoFrm.keyWord.value = area;
		document.photoFrm.submit();
	}
	
</script>
</head>
<body>
  <!-- 헤더 -->
  <header>
    <div class="header">
      <a href="./main.jsp" class="header-logo">
        <img src="./img/seagull.png">
        <div>잘놀다갑니다</div>
      </a>
      <ul class="header-menu">
        <li><a href="./busanIntroduce.jsp">부산소개</a></li>
        <li><a href="./community.jsp">커뮤니티</a></li>
        <li><a href="./news.jsp">소식</a></li>
        <li><a href="./photo.jsp">포토</a></li>
      </ul>
      <div class="header-login">
        <a href="javascript:void(0)">로그인</a>
        
        <a href="javascript:void(0)">회원가입</a>
      </div>
    </div>
  </header>
  <!-- 메인 -->
  <main>
    <div class="photo">
      <div class="title">
        <ul>
          <li>해운대구</li>
          <li><a href="javascript:jungGu('<%=jungGu%>')">중구</a></li>
          <li>지역</li>
          <li>지역</li>
          <li>지역</li>
        </ul>
      </div>
      <div class="content">
      
      <%
			  vlist = sMgr.getPhotoImgUrl(keyWord, start, end);
			  listSize = vlist.size();//브라우저 화면에 보여질 게시물 번호
			  
			  if (vlist.isEmpty()) {
				out.println("등록된 게시물이 없습니다.");
			  } else {
				  
				  for (int i = 0;i<numPerPage; i++) {
						if (i == listSize) break;
						PhotoBean bean = vlist.get(i);
						String photoUrl = bean.getPhotoUrl();
						
				  %>
				  <img src="./img/<%=photoUrl%>"/>
				  
				  <%
				  }
			  }
			  
	  %>
          <!-- <img src="./img/seagull.png">
          <div class="image-title">보라</div> -->

      </div>
      <div class="pagemove">
        <!-- <ul>
          <li class="pagemove-Arrow">
            <a href="javascript:void(0)">
              &lt
            </a>
          </li> -->
          <span class="pagemove-number">
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
            <!-- <li><a class="current" href="javascript:void(0)">1</a></li>
            <li><a href="javascript:void(0)">2</a></li>
            <li><a href="javascript:void(0)">3</a></li>
            <li><a href="javascript:void(0)">4</a></li> -->
          </span>
         <!--  <li class="pagemove-Arrow">
            <a href="javascript:void(0)">
              &gt
            </a>
          </li>
        </ul> -->
      </div>
      
      <form name="photoFrm" method="post" action="photo.jsp">
      	<input type="hidden" name="reload" value="true">
      	<input type="hidden" name="nowPage" value="1">
      	<input type="hidden" name="keyWord" value="<%=keyWord%>">
      </form>
      
    </div>
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