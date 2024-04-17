<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String UpdateID = (String)session.getAttribute("AUTH_USER_UPDATEID");
String UpdatePW = (String)session.getAttribute("AUTH_USER_UPDATEPASSWORD");
%>
<div>
<h1>비밀번호 변경 페이지</h1>
	<form action="/UpdateMemberHandler.do" method="post">
		기존비밀번호 : <input type="password" name="updatePw0" id="updatePw0" placeholder="기존비밀번호" required="required"/><br/>
		비밀번호 : <input type="password" name="updatePw1" id="updatePw1" placeholder="새비밀번호" required="required"/><br/>
		비밀번호확인 : <input type="password" name="updatePw2" id="updatePw2" placeholder="비밀번호확인" required="required"/><br/>
		<input type="hidden" value="passwordChange" name="passwordvalue">
		<input type="submit" value="변경"/>
		<button onclick="location.href='updateRequest.jsp'">취소</button>
		
	</form>
</div>

</body>
</html>