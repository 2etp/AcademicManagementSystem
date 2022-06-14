<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@	page import="BusanCommunityPack.PhotoBean"%>
<%@	page import="java.util.Vector"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	
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
	
	System.out.println(keyWord);
	
/* 	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
		}
	} */
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage)-numPerPage;
	end = numPerPage;
	
	// 총 게시물 수 받아오기(현재 2개)
	totalRecord = sMgr.getPhotoTotalCnt(keyWord);
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
  <link rel="stylesheet" href="./css/destyle.css">
  <link rel="stylesheet" href="./css/common.css" >
  <link rel="stylesheet" href="./css/photo.css">
  
  <script src="./js/photo.js" defer></script>
  <script type="text/javascript">
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	}
	
	function jungGu(area) {
		document.photoFrm.keyWord.value = area;
		document.photoFrm.submit();
	}
	
	window.addEventListener("load", function(){
	    var enable = "<%=request.getParameter("keyWord")%>";
	    if(!(enable==null)){
	    	switch(enable){
	    		case "haeundae":
    				enable = 0;
    				break;
	    		case "junggu":
	    			enable = 1;
	    			break;
	    		case "youngdogu":
    				enable = 2;
    				break;
	    		case "sahagu":
    				enable = 3;
    				break;
	    		case "seogu":
    				enable = 4;
    				break;
	    		case "busanjingu":
    				enable = 5;
    				break;
	    		case "donggu":
    				enable = 6;
    				break;
	    		case "dongraegu":
    				enable = 7;
    				break;
	    		case "namgu":
    				enable = 8;
    				break;
	    		case "bukgu":
    				enable = 9;
    				break;
	    		case "geumjeonggu":
    				enable = 10;
    				break;
	    		case "gangseogu":
    				enable = 11;
    				break;
	    		case "yeonjegu":
    				enable = 12;
    				break;
	    		case "suyeonggu":
    				enable = 13;
    				break;
	    		case "sasanggu":
    				enable = 14;
    				break;
	    		case "gijanggun":
    				enable = 15;
    				break;
	    		default:
	    			enable = 0;
    				break;
	    	}
	        document.querySelectorAll(".photo .title ul li")[enable].classList.add("enable");
	    }
	});
	
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
    <div class="photo">
      <div class="title">
        <ul>
          <li>해운대구</li>
          <li>중구</li>
          <li>영도구</li>
          <li>사하구</li>
          <li>서구</li>
          <li>부산진구</li>
          <li>동구</li>
          <li>동래구</li>
          <li>남구</li>
          <li>북구</li>
          <li>금정구</li>
          <li>강서구</li>
          <li>연제구</li>
          <li>수영구</li>
          <li>사상구</li>
          <li>기장군</li>
        </ul>
      </div>
      <div class="content">

      <%
      		  System.out.println(keyWord);
			  vlist = sMgr.getPhotoImgUrl(keyWord, start, end);
			  listSize = vlist.size(); //브라우저 화면에 보여질 게시물 번호
			  
			  if (vlist.isEmpty()) {
				out.println("등록된 게시물이 없습니다.");
			  } else {
				  
				  for (int i = 0;i<numPerPage; i++) {
						if (i == listSize) break;
						PhotoBean bean = vlist.get(i);
						String photoUrl = bean.getPhotoUrl();
						
				  %>
				  <img src="./images/<%=photoUrl%>"/>
				 <% 
				  }
			  }
			  
	  %>

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