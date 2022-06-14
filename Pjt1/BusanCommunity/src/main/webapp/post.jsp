<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="java.util.*"%>

<%
	String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br/><br/>
<table width="600" cellpadding="3">
	<tr>
		<td bgcolor="84F399" height="25" align="center">글쓰기</td>
	</tr>
</table>
<br/>
<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td>제 목</td>
				<td>
				<input name="boardTitle" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="boardContent" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
			 <tr>
     			<td>파일찾기</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>
 			<tr>
 				<td>내용타입</td>
 				<td> HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked>
  			 	</td>
 			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="등록">
					 <input type="reset" value="다시쓰기">
					 <input type="button" value="리스트" onClick="javascript:location.href='community.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<!-- 게시물을 등록한 사용자의 IP 주소를 가져옴 -->
<input type="hidden" name="boardIp" value="<%=request.getRemoteAddr()%>">
<input type="hidden" name="boardWriter" value="<%=id%>">
</form>
</div>
</body>
</html>