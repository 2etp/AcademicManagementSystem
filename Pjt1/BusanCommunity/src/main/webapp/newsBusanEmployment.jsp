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
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>잘놀다갑니다</title>
    <link rel="stylesheet" href="./css/destyle.css">
    <link rel="stylesheet" href="./css/news.css">
    <link rel="stylesheet" href="./css/dropdown.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js" integrity="sha512-VEBjfxWUOyzl0bAwh4gdLEaQyDYPvLrZql3pw1ifgb6fhEvZl9iDDehwHZ+dsMzA0Jfww8Xt7COSZuJ/slxc4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/ScrollToPlugin.min.js" integrity="sha512-lZACdYsy0W98dOcn+QRNHDxFuhm62lfs8qK5+wPp7X358CN3f+ml49HpnwzTiXFzETs4++fADePDI+L2zwlm7Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script defer src="./js/news.js"></script>
    <script defer src="./js/newsEmployment.js"></script>
    <script defer src="./js/newsKookje.js"></script>
    <script defer src="./js/dropdown.js"></script>
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
        <div class="news">
          <div class="title">
            <ul>
              <li><a href="./newsAll.jsp">전체</li></a>
              <li><a href="./newsBusanIntegrated.jsp">부산 통합 공지사항</a></li>
              <li><a href="./newsBusanEmployment.jsp">부산 채용공고</a></li>
              <li><a href="./newsBusanKookje.jsp">국제신문:문화</a></li>
            </ul>
          </div>
          <div class="content">
             <div class="item">
              <div class="item-text wrap2"></div><!-- 부산 채용공고 영역 -->
            </div>
          </div>
          <div class="pagemove">
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

      <!-- 푸터 -->
      <footer style="background: #dcdcdc90;">
        <div class="footer">
          <div class="footer-information">
            팀장 : 박휘원 | 전화번호 : 010-4623-0195 <br><br>
            팀원 : 송민영 | 전화번호 : 010-8800-3995 <br><br>
            팀원 : 최낙원 | 전화번호 : 010-9753-0266 <br><br>
            팀원 : 최영수 | 전화번호 : 010-6356-2213 <br><br>
          </div>
        </div>
      </footer>

      <div class="moveBnt">
        <span id="moveup" class="material-symbols-outlined">arrow_circle_up</span>
        <a href="#"><img class="bugi" src="./images/bugi3d100.png" /></a>
      </div>

  
</body>
</html>