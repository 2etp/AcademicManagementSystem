<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="BusanCommunityPack.MemberBean"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	//check박스는 check가 있으면 true로 반환되지만 check가 없으면 false가 아닌 null이 된다.
	String loginChk = request.getParameter("loginChk");
	String url = "login.jsp";
	String msg = "로그인에 실패하였습니다.";
	
	// 기존 db상의 사용자 아이디, 패스워드라고 가정
	//String dbId = "cnw";
	//String dbPw = "1234";
	
/* 	//문자열 같다 equals()로 비교, 폼의 아이디와  DB의 아이디 비번 비교후 일치시 통과
    //로그인 작업 ->세션생성 "id" id/ 이동 sessionMain.jsp
    //pw비교 틀리면 패스워드 틀림
	if(id.equals(dbId)) {
		if(pw.equals(dbPw)) {
			//로그인 작업 -> 세션 생성
			session.setAttribute("idKey", id);
			

		}
	} */

	// 로그인 체킹
	boolean result = sMgr.loginCheck(id, pw);
	// 비번 재설정
	Vector<MemberBean> vlist = sMgr.resetPwMsg(id, pw);
	
	if(result) {
		session.setAttribute("idKey", id);
		// 로그인 유지처리
		if(loginChk != null) {
			Cookie cookie = new Cookie("idKey", id);
			cookie.setMaxAge(60);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		msg = "로그인에 성공하였습니다.";
		url = "main.jsp";
	}
	
	 // 날짜 일정한 폼으로 바꾸기 위한 설정
	 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	 String dbregDate = null;
	 Date regDate = null;
	 
	 for(int i = 0; i < vlist.size(); ++i) {
		 
		 MemberBean bean  = vlist.get(i);
		 
		 // DB에 있는 회원가입 날짜(혹은 비번 재설정 날짜) 가져오기
		 dbregDate = bean.getRegDate();
		 // String 변수를 Date 타입으로 변환
		 regDate = sf.parse(dbregDate);
		 	 
	 }
	 
	 // 현재 시간을 위의 폼으로 불러오기
	 String curDate = sf.format(new Date());
	 // Date 타입으로 변환
	 Date mod_curDate = sf.parse(curDate);
	 
	 // 현재 시간에서 DB의 시간 빼기
	 long differTime = mod_curDate.getTime()-regDate.getTime();	 
	 // 일 수로 나타내기 위해 int로 캐스팅(기본 : milliSec)
	 int days = (int) (differTime / (1000*60*60*24));
	 
	 String resetMsg = null;
%>	 
	
<script>
	alert("<%=msg%>");
	
<%
	if(days > 1) {
		 
		resetMsg = "비밀번호 재설정해라."; %>
		alert("<%=resetMsg%>");
<%	}%>

	
	location.href = "<%=url%>";
</script>