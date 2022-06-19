<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(Cookie tempCookie : cookies) {
			if(tempCookie.getName().equals("idKey")) {
				//쿠키 값으로 대신 로그인 처리함
				session.setAttribute("idKey", tempCookie.getValue());
			}
		}
	}
	
    //세션값 가져오기, Object형으로 저장되기에 다운캐스팅이 필요함
    String id = (String)session.getAttribute("idKey");
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>잘놀다갑니다</title>
  <!-- CSS 초기화 -->
  <link rel="stylesheet" href="./css/destyle.css">
  <!-- Google Font API -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <!-- 기타 -->
  <link rel="stylesheet" href="./css/common.css" >
  <link rel="stylesheet" href="./css/dropdown.css" >
  <link rel="stylesheet" href="./css/busanIntroduce.css">
  <link rel="stylesheet" href="./css/slider.css">
  <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">

  <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>

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
            팀장 : 박휘원 | 전화번호 : 010-4623-0195 <br><br>
            팀원 : 송민영 | 전화번호 : 010-8800-3995 <br><br>
            팀원 : 최낙원 | 전화번호 : 010-9753-0266 <br><br>
            팀원 : 최영수 | 전화번호 : 010-6356-2213 <br><br>
          </div>
        </div>
      </footer>

  <!-- 메인 -->
  <div class='pagewrap'>

    <div class='pageblock' id='fullscreen'>
      <div class='slider'>
        <div class='slide' id="first">
          <div class='slidecontent'>
            <div class="main-section1-text">
              <h2>광안대교</h2>
              <h3>광안대교는 부산 해운대 지구 센텀 시티와 수영구 남천동을 연결하는 현수교로 한국에서 가장 큰 교차 다리이며 부산의 랜드 마크 중 인기있는 명소입니다.</h3>
              <a href="https://www.bisco.or.kr/gwanganbridge/" target="_blank">광안대교 홈페이지 바로가기<i class="fa-solid fa-house"></i></a>
            </div>
          </div>
        </div>
        <div class='slide' id="sec">
          <div class='slidecontent'>
            <div class="main-section2-text">
              <h2>국제시장</h2>
              <h3>국제시장은 부산과 세계를 잇는 부산의 대표적인 전통시장이며 자갈치 시장 등의 다양한 명소가 입접한 최고의 관광지이자 쇼핑 문화공간 입니다. </h3>
              <a href="http://gukjemarket.co.kr/" target="_blank">국제시장 홈페이지 바로가기<i class="fa-solid fa-house"></i></a>
            </div>
          </div>
        </div>
        <div class='slide' id="thirth">
          <div class='slidecontent'>
            <div class="main-section3-text">
              <h2>감천문화마을</h2>
              <h3>감천문화마을은 1950년대 태극도 신앙촌 신도와 6.25 피난민의 집단 거주지로 형성된 곳으로 산자락을 따라 질서정연하게 늘어선 계단식 집단 주거형태와 모든 길이 통하는 미로미로 골목길의 독특한 경관을 자랑하는 곳입니다.</h3>
              <a href="https://www.gamcheon.or.kr/" target="_blank">감천문화마을 홈페이지 바로가기<i class="fa-solid fa-house"></i></a>
            </div>
          </div>
        </div>
        <div class='slide' id="fourth">
          <div class='slidecontent'>
            <div class="main-section4-text">
              <h2>해운대</h2>
              <h3>해운대는 부산광역시 부도심의 하나로 해운대해수욕장과 광안리해수욕장을 비롯하여 동백섬, 영화의전당, 달맞이고개, 해운대온천, 오륙도, UN기념공원, 수영사적공원, 광안대교 등의 부산의 상징들과 유명 관광지가 있고 호텔, 식당가, 영화관 및 쇼핑몰 등 위락 시설이 많으며 해운대 신시가지와 마린시티에는 대규모 주거단지가 있습니다.</h3>
              <a href="https://www.haeundae.go.kr/index.do" target="_blank">해운대구청 홈페이지 바로가기<i class="fa-solid fa-house"></i></a>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>


 

  <script type="text/javascript" src="./js/dropdown.js"></script> 
  <script type="text/javascript" src="./js/jquery.simpleslider.js"></script>
  <script type="text/javascript" src="./js/backstretch.js"></script>
  <script type="text/javascript" src="./js/custom.js"></script> 
</body>
</html>