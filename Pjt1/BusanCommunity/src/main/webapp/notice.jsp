<%@ page contentType="text/html;charset=UTF-8"%> 
<%@ page import="BusanCommunityPack.NoticeBean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");

	// DB의 tblnotice row 수만큼 배열 할당
	int[] noticeSeq = {1, 2, 3, 4};
	Vector<NoticeBean> vlist = sMgr.selectNotice(noticeSeq);

%>
    
<!DOCTYPE html>
<html lang="ko">

<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>잘놀다갑니다</title>
 <link rel="stylesheet" href="./css/notice.css" >
 <link rel="stylesheet" href="./css/common.css">
 <link rel="stylesheet" href="./css/destyle.css">
 <link rel="stylesheet" href="./css/modal_inquiry.css">
 <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
</head>

<body>
  <!-- 헤더 -->
  <header>
    <div class="header">
      <a href="#" class="header-logo">
        <img src="./images/seagull.png">
        <div>잘놀다갑니다</div>
      </a>
      <ul class="header-menu">
        <li><a href="./busanIntroduce.jsp">부산소개</a></li>
        <li><a href="./community.jsp">커뮤니티</a></li>
        <li><a href="javascript:void(0)">소식</a></li>
        <li><a href="javascript:void(0)">포토</a></li>
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
  
    <div class="main">
	    <div class="leftSide">
	      <div class="l-sidebar">
	        <div class="l-menu">
	          <a href="#">공지사항</a><i class="fa-solid fa-bullhorn"></i>
	        </div>
	        <div class="l-menu">
	          <a href="./help.jsp">도움말</a><i class="fa-solid fa-circle-question"></i>
	        </div>
	        <div class="l-menu inquiry">
	          <a href="">문의하기</a><i class="fa-solid fa-person-circle-question"></i>
	        </div>
	        <div class="l-menu">
	          <a href="./setting.jsp">설정</a><i class="fa-solid fa-gear"></i>
	        </div>
	      </div>
	    </div>
    
	<%
		// 쿼리문 각각의 결괏값을 할당하기 위한 배열 선언(vlist의 사이즈가 4이므로 그에 맞게 크기 4로 지정)
		String[] noticeContent = new String[4];
		
  		for(int i = 0; i < vlist.size(); ++i) {
  			
  			NoticeBean bean = vlist.get(i);
  			// bean 객체로부터 가져온 결괏값들을 배열의 각 위치에 할당
	  		noticeContent[i] = bean.getNoticeContent();

  		}
  	%>

	  <div class="noti-container">
	      <div class="noti-main">
	        <div class="noti-title">공지사항&nbsp&nbsp<i class="fa-solid fa-bullhorn"></i></div>
	      </div>
	      
	      <ul class="noti-ul">
	        <li class="noti-list">
	          <div class="q" name="1"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
	        </li>       
	        <div class="a inactive"><%=noticeContent[0]%></div>
	            
	        <li class="noti-list">
	          <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
	        </li>
	        <div class="a inactive"><%=noticeContent[1]%></div>
	        
	        <li class="noti-list">
	          <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
	        </li>
	        <div class="a inactive"><%=noticeContent[2]%></div>
	        
	        <li class="noti-list">
	          <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
	        </li>
	        <div class="a inactive"><%=noticeContent[3]%></div>
	        
	        <li class="noti-list">
	          <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
	        </li>
	        <div class="a inactive">환영합니다</div>
	        
	        <li class="noti-list">
	          <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
	        </li>
	        <div class="a inactive">환영합니다</div>
	        
	        <li class="noti-list">
	          <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
	        </li>
	        <div class="a inactive">환영합니다</div>
	      </ul>
	    </div>
	
  </main>
  

  	<!-- 문의모달 -->
	<div class="modal-background inactive">
	    <div class="modal-container">
	     <div>
	      <form action="">
	        <p class="modal-title">문의하기</p>
	        <div class="modal-input">
	          <input type="text" class="modal-email" placeholder="이메일을 입력하세요"></input>
	        </div>
	        <div class="modal-text">
	          <textarea name="" id="" rows="5" maxlength="1000" placeholder="문의 내용을 입력하세요"></textarea>
	        </div>
	        <div class="modal-screen">
	          <p>스크린샷</p>
	          <div class="fileUploadSize">
	            <label class="fileUpload" for="imgFile">
	              <i class="fa-solid fa-folder-open"></i>
	              <input type="file" accept="image/*" id="imgFile">
	              <span style="margin-left: 10px;">파일 추가</span>
	            </label>
	          </div>
	        </div>
	        <div class="modal-bnt">
	          <button class="modal-send-bnt" type="submit">보내기</button>
	          <button class="modal-close">취소</button>
	        </div>
	      </form>
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

  <script src="./js/noti-list.js"></script>
  <script src="./js/modal_inquiry.js"></script>
  <script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>

</body>
</html>