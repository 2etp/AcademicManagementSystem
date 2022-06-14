<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="BusanCommunityPack.BoardBean"%>
 
<% 
	  request.setCharacterEncoding("UTF-8");
	  int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String boardTitle = bean.getBoardTitle();
	  String boardWriter = bean.getBoardWriter(); 
	  String boardContent = bean.getBoardContent(); 
%>

<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check() {

	   alert("수정이 완료 되었습니다.");
	   document.updateFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/><br/>
<table width="600" cellpadding="3">
  <tr>
   <td bgcolor="#FF9018"  height="21" align="center">수정하기</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table width="600" cellpadding="7">
 <tr>
  <td>
   <table>
    <tr>
     <td width="20%">성 명</td>
     <td width="80%">
	  <input name="name" value="<%=boardWriter%>" size="30" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td>제 목</td>
     <td>
	  <input name="subject" size="50" value="<%=boardTitle%>" maxlength="50">
	 </td>
    <tr>
     <td>내 용</td>
     <td>
	  <textarea name="content" rows="10" cols="50"><%=boardContent%></textarea>
	 </td>
    </tr>

	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="수정완료" onClick="check()">
      <input type="reset" value="다시수정"> 
      <input type="button" value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage%>">
 <input type='hidden' name="num" value="<%=boardSeq%>">
</form> 
</div>
</body>
</html>