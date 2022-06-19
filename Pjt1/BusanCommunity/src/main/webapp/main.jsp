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
 <link rel="stylesheet" href="./css/destyle.css">
 <!-- Google Font API -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
 <!-- 기타 -->
 <link rel="stylesheet" href="./css/common.css" >
  <link rel="stylesheet" href="./css/dropdown.css" >
 <link rel="stylesheet" href="./css/main.css">
 <link rel="stylesheet" href="./css/jquery.multiscroll.css">
 <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
 


 <script
	 src="https://code.jquery.com/jquery-3.6.0.min.js"
	 integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	 crossorigin="anonymous">
 </script>
 <script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>
</head>

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
  <main>
   <div id="myContainer">

    <div class="ms-left">
        <div class="ms-section main-section1" id="left1">
          <div class="main-section1-text">
            <h2>잘놀다갑니다</h2>
            <h3>한 번 놀때 잘 놀자, 부산여행은 잘 놀다 갑니다</h3>
            <a href="./signup.jsp"><button>지금 바로 회원가입</button></a>
          </div>
        </div>

        <div class="ms-section main-section2" id="left2">
          <div class="main-section2-img">
            <img src="./images/YongdusanPark.jpeg">
          </div>
        </div>

        <div class="ms-section main-section3" id="left3">
          <div class="main-section3-text">
            <h2>정보공유</h2>
            <h3>다양한 사람들과 정보를 공유해요</h3>
            <a href="community.jsp"><button>커뮤니티 바로가기</button></a>
          </div>
        </div>

        <div class="ms-section main-section4" id="left4">
          <div class="main-section4-img">
            <img src="./images/BusanCinemaCenter.jpg">
          </div>
        </div>

        <div class="ms-section main-section5" id="left5">
          <div class="main-section5-text">
            <h2>항구도시 부산</h2>
            <h3>부산의 아름다운 view가 궁금하다면?</h3>
            <a href="photo.jsp"><button>포토 바로가기</button></a>
          </div>
        </div>
    </div>

    <div class="ms-right">
        <div class="ms-section main-section1" id="right1">
          <div class="main-section1-img">
            <img src="./images/GamcheonCultureVillage1.png">
          </div>
        </div>
       
        <div class="ms-section main-section2" id="right2">
          <div class="main-section2-text">
            <h2>바다의 도시</h2>
            <h3>제2의 수도이자 항구도시 부산이 궁금하다면?</h3>
            <a href="./busanIntroduce.jsp"><button>부산소개 바로가기</button></a>
          </div>
        </div>

        <div class="ms-section main-section3" id="right3">
          <div class="main-section3-img">
            <img src="./images/Nampodong.jpg">
          </div>
        </div>

        <div class="ms-section main-section4" id="right4">
          <div class="main-section4-text">
            <h2>소식통</h2>
            <h3>부산과 관련된 공지 및 뉴스</h3>
            <a href="./newsAll.jsp"><button>소식 바로가기</button></a>
          </div>
        </div>

        <div class="ms-section main-section5" id="right5">
          <div class="main-section5-img">
            <img src="./images/Nurimaru3.jpg">
          </div>
        </div>
    </div>
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
	
	<script src="./js/dropdown.js"></script>
    <script src="./js/scroll.js"></script>
    <script src="./js/jquery.multiscroll.js"></script>
</body>
</html>


	