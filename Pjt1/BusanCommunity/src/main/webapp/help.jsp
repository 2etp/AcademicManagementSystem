<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="BusanCommunityPack.HelpBean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	// DB의 tblnotice row 수만큼 배열 할당
	int[] helpSeq = {1, 2};
	Vector<HelpBean> vlist = sMgr.selectHelp(helpSeq);

%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>잘놀다갑니다</title>
  <link rel="stylesheet" href="./css/help.css">
  <link rel="stylesheet" href="./css/modal_inquiry.css">
</head>

<body>
  <!-- 헤더 -->
  <header>
    <div class="header">
      <a href="#" class="header-logo">
        <img src="./img/seagull.png">
        <div>잘놀다갑니다</div>
      </a>
      <ul class="header-menu">
        <li><a href="./busanIntroduce.jsp">부산소개</a></li>
        <li><a href="./community.jsp">커뮤니티</a></li>
        <li><a href="javascript:void(0)">소식</a></li>
        <li><a href="javascript:void(0)">포토</a></li>
      </ul>
      <div class="header-login">
        <a href="./login.jsp">로그인</a>
        <a href="javascript:void(0)">회원가입</a>
      </div>
    </div>
  </header>

  <!-- 메인 -->
  <main>
    <div class="main">
    <div class="leftSide">
      <div class="l-sidebar">
        <div class="l-menu">
          <a href="./notice.jsp">공지사항</a><i class="fa-solid fa-bullhorn"></i>
        </div>
        <div class="l-menu">
          <a href="#">도움말</a><i class="fa-solid fa-circle-question"></i>
        </div>
        <div class="l-menu inquiry">
          <a>문의하기</a><i class="fa-solid fa-person-circle-question"></i>
        </div>
        <div class="l-menu">
          <a href="./setting.jsp">설정</a><i class="fa-solid fa-gear"></i>
        </div>
      </div>
    </div>
    
    <%
		// 쿼리문 각각의 결괏값을 할당하기 위한 배열 선언(vlist의 사이즈가 4이므로 그에 맞게 크기 4로 지정)
		String[] helpContent = new String[2];
		
  		for(int i = 0; i < vlist.size(); ++i) {
  			
  			HelpBean bean = vlist.get(i);
  			// bean 객체로부터 가져온 결괏값들을 배열의 각 위치에 할당
	  		helpContent[i] = bean.getHelpContent();

  		}
  	%>

      <div class="noti-container">
        <div class="noti-main">
          <div class="noti-title">도움말</div>
        </div>
        <div class="noti-sub">
          <ul>
            <li class="noti-sub-menu"><a href="#">도움말</a></li>
            <li class="noti-sub-menu"><a href="./account.jsp">계정</a></li>
            <li class="noti-sub-menu"><a href="./privacyPolicy.jsp">개인정보정책</a></li>
            <li class="noti-sub-menu"><a href="./etc.jsp">기타</a></li>
          </ul>
        </div>
        <div>
          <ul class="noti-bg-list">
            <li class="noti-sub-bg1 bg"><span class="noti-sub-bg"></span></li>
            <li class="noti-sub-bg2 bg"><span class="noti-sub-bg"></span></li>
            <li class="noti-sub-bg3 bg"><span class="noti-sub-bg"></span></li>
            <li class="noti-sub-bg4 bg"><span class="noti-sub-bg"></span></li>
          </ul>
        </div>
        <ul class="noti-ul">
          <li class="noti-list">
            <i class="fa-solid fa-caret-right"></i><div class="q">잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
          </li>
          <div class="a inactive"><%=helpContent[0]%></div>
          <li class="noti-list">
            <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
          </li>
          <div class="a inactive"><%=helpContent[1]%></div>
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
          <li class="noti-list">
            <div class="q"><i class="fa-solid fa-caret-right"></i>잘 놀다 갑니다 홈페이지에 오신 것을 환영 합니다.</div>
          </li>
          <div class="a inactive">환영합니다</div>
        </ul>
      </div>
    </div>
  </main>




  <!-- 푸터 -->
  <!-- <footer>
    <div class="footer">
      <ul class="footer-menu">
        <li><a href="javascript:void(0)">회사소개</a></li>
        <li><a href="javascript:void(0)">이용약관</a></li>
        <li><a href="javascript:void(0)">개인정보처리방침</a></li>
        <li><a href="javascript:void(0)">도움말</a></li>
        <li><a href="javascript:void(0)">광고 상품</a></li>
        <li><a href="javascript:void(0)">문의하기</a></li>
      </ul>
      <div class="footer-information">
        대표전화:02-556-4202<br><br>
        06158 서울시 강남구 테헤란로79길 6, 6층(삼성동, 제이에스타워) (대표자:최재호)사업자등록번호 : 211-88-81111<br><br>
        통신판매업 신고번호: 2016-서울강남-03104호 | 직업정보제공사업 신고번호: 서울강남 제2019-11호|유료직업소개사업 신고번호: 2020-3220237-14-5-00003<br><br>
        Copyright 2019.Drama & Company All rights reserved
      </div>
    </div>
  </footer> -->


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


<script src="./js/noti-list.js"></script>
<script src="./js/modal.js"></script>
<script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>
</body>

</html>