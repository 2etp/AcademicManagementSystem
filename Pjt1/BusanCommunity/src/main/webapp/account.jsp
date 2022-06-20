<%@ page contentType="text/html;charset=UTF-8"%> 
<%@ page import="BusanCommunityPack.AccountBean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	
	// 도움말 부분의 계정의 총 개수 불러오기
	int accountCnt = sMgr.getAccountCnt();
	
	// 총 개수에 맞는 크기의 배열 생성
	int[] accountSeq = new int[accountCnt];
	
	for(int i = 0; i < accountCnt; ++i) {
		accountSeq[i] = (i + 1);
	}
	
	Vector<AccountBean> vlist = sMgr.selectAccount(accountSeq);

%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>잘놀다갑니다</title>
  <link rel="stylesheet" href="./css/help.css">
   <link rel="stylesheet" href="./css/dropdown.css">
  <link rel="stylesheet" href="./css/common.css">
  <link rel="stylesheet" href="./css/destyle.css">
  <link rel="stylesheet" href="./css/modal_inquiry.css">
  <link rel="icon" href="./images/favicon.ico" type="image/x-icon" sizes="16x16">
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
        <li><a href="./photo/jsp">포토</a></li>
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
    <div class="main">
    <div class="leftSide">
      <div class="l-sidebar">
        <div class="l-menu">
          <a href="./notice.jsp">공지사항<i class="fa-solid fa-bullhorn"></i></a>
        </div>
        <div class="l-menu">
          <a href="./help.jsp">도움말<i class="fa-solid fa-circle-question"></i></a>
        </div>
        <div class="l-menu inquiry">
          <a>문의하기<i class="fa-solid fa-person-circle-question"></i></a>
        </div>
        <div class="l-menu">
          <a href="./setting.jsp">설정<i class="fa-solid fa-gear"></i></a>
        </div>
      </div>
    </div>
    
	<%
		
		String[] accountTitle = new String[accountCnt];
		String[] accountContent = new String[accountCnt];
		
  		for(int i = 0; i < vlist.size(); ++i) {
  			
  			AccountBean bean = vlist.get(i);
  			// bean 객체로부터 가져온 결괏값들을 배열의 각 위치에 할당
  			accountTitle[i] = bean.getAccountTitle();
  			accountContent[i] = bean.getAccountContent();
  		}
  	%>

      <div class="noti-container">
        <div class="noti-main">
          <div class="noti-title">계정&nbsp&nbsp<i class="fa-solid fa-lock"></i></div>
        </div>
        <div class="noti-sub">
          <ul>
            <li class="noti-sub-menu"><a href="./help.jsp">도움말</a></li>
            <li class="noti-sub-menu"><a href="./account.jsp">계정</a></li>
            <li class="noti-sub-menu"><a href="./privacyPolicy.jsp">개인정보정책</a></li>
            <li class="noti-sub-menu"><a href="./etc.jsp">기타</a></li>
          </ul>
        </div>
        
        <ul class="noti-ul">
          <li class="noti-list">
            <i class="fa-solid fa-caret-right"></i><div class="q"><%=accountTitle[0]%></div>
          </li>
          <div class="a inactive"><%=accountContent[0]%></div>
          <li class="noti-list">
            <div class="q"><i class="fa-solid fa-caret-right"></i><%=accountTitle[1]%></div>
          </li>
          <div class="a inactive"><%=accountContent[1]%></div>
          <li class="noti-list">
            <div class="q"><i class="fa-solid fa-caret-right"></i><%=accountTitle[2]%></div>
          </li>
          <div class="a inactive"><%=accountContent[2]%></div>
          <li class="noti-list">
            <div class="q"><i class="fa-solid fa-caret-right"></i><%=accountTitle[3]%></div>
          </li>
          <div class="a inactive"><%=accountContent[3]%></div>
          <li class="noti-list">
            <div class="q"><i class="fa-solid fa-caret-right"></i><%=accountTitle[4]%></div>
          </li>
          <div class="a inactive"><%=accountContent[4]%></div>
          <li class="noti-list">
            <div class="q"><i class="fa-solid fa-caret-right"></i><%=accountTitle[5]%></div>
          </li>
          <div class="a inactive"><%=accountContent[5]%></div>
        </ul>
      </div>
    </div>
  </main>


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
<script src="./js/noti-list.js"></script>
<script src="./js/modal_inquiry.js"></script>
<script src="https://kit.fontawesome.com/536e37fbfc.js" crossorigin="anonymous"></script>
</body>

</html>