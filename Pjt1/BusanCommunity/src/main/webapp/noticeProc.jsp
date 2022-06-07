<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="BusanCommunityPack.NoticeBean"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="sMgr" class="BusanCommunityPack.SystemMgr"/>
<jsp:useBean id="noticeBean" class="BusanCommunityPack.NoticeBean"/>

<%
	request.setCharacterEncoding("UTF-8");
	int noticeSeq = Integer.parseInt(request.getParameter("1"));
	
	Vector<NoticeBean> vlist = sMgr.selectNotice(noticeSeq);
%>