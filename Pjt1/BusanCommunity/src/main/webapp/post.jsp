<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%> 
<%@ page import="java.util.*"%>

<%
	String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
<title>JSP Board</title>
  	<link href="style.css" rel="stylesheet" type="text/css">
  	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
  
<script type="text/javascript">
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  width: 1000,				   	// 에디터 넓이
			  height: 500,                 	// 에디터 높이
			  minHeight: null,             	// 최소 높이
			  maxHeight: null,             	// 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	});
</script>
</head>

<body>

<form name="postFrm" method="post" action="boardPost" enctype="multipart/form-data">
	<table>
         <colgroup>
             <col style="width:150px">
             <col style="width:850px">
         </colgroup>
         <tbody>
             <tr>
                 <th>TITLE</th>
                 <td><input type="text" name="boardTitle" value=""></td>
             </tr>
             <tr>
                 <th>CONTENTS</th>
                 <td>
                     <textarea name="contents" id="summernote"></textarea>
                 </td>
             </tr>
         </tbody>
	</table>
	<div>
		<input type="submit" value="등록">
		<input type="reset" value="다시쓰기">
		<input type="button" value="리스트" onClick="javascript:location.href='community.jsp'">
	</div>
	
	<!-- 게시물을 등록한 사용자의 IP 주소를 가져옴 -->
	<input type="hidden" name="boardIp" value="<%=request.getRemoteAddr()%>">
	<input type="hidden" name="boardWriter" value="<%=id%>">
</form>
<!-- <div align="center">
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
 -->
</body>
</html>