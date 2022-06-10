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
 <title>천지삐까리</title>
 <link rel="stylesheet" href="./css/destyle.css">
 <link rel="stylesheet" href="./css/common.css" >
 <link rel="stylesheet" href="./css/index.css">
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
        <% if(id != null) { %>
          <b class="login"><%=id %> 님이 로그인 했습니다.</b>
        <% } else { %>
          <a href="login.jsp">로그인</a>
          <a href="signup.jsp">회원가입</a>
        <% } %>
        <a href="setting.jsp">설정</a>
		<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
      </div>
    </div>
  </header>
  <!-- 메인 -->
  <main>
    <section class="main-section1">
      <h1>김민관</h1>
      <h2>남정수</h2>
      <button>지금 바로 회원가입</button>
    </section>
    <section class="main-section2">
      <div class="main-section2-img">
        <img src="./img/nampodong.jpg">
      </div>
      <div class="main-section2-text">
        <h2>sdadas</h2>
        <h3>sdadas</h3>
        <button>부산소개 바로가기</button>
      </div>
    </section>
    <section class="main-section3">
      <div class="main-section3-text">
        <h2>sdadas</h2>
        <h3>sdadas</h3>
        <button>커뮤니티 바로가기</button>
      </div>
      <div class="main-section3-img">
        <img src="./img/lightYongdusanPark.jpeg">
      </div>
    </section>
    <section class="main-section4">
      <div class="main-section4-text">
        <h2>sdadas</h2>
        <h3>sdadas</h3>
        <button>소식 바로가기</button>
      </div>
      <div class="main-section4-img">
        <img src="./img/nurimaru1.jpg">
      </div>
    </section>
    <section class="main-section5">
      <div class="main-section5-img">
        <img src="./img/nampodong.jpg">
      </div>
      <div class="main-section5-text">
        <h2>sdadas</h2>
        <h3>sdadas</h3>
        <button>포토 바로가기</button>
      </div>
    </section>
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


	