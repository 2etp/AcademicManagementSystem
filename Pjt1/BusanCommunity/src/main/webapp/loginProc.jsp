<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
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

	boolean result = sMgr.loginCheck(id, pw);
	Vector<MemberBean> vlist = sMgr.resetPw(id, pw);
	
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
/* 	
	String regDate = null;
	for(int i = 0; i < vlist.size(); ++i) {
		
		MemberBean bean = vlist.get(i);
		regDate = bean.getRegDate();
	}
	 */

	
%>
	
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>