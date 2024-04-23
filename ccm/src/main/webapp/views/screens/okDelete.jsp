<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴완료페이지</title>
</head>
<body>
<%session.invalidate();%>
<h1>회원탈퇴 진행중입니다.</h1>

<h3>탈퇴는 탈퇴신청일로부터 7일 후 완료됩니다.</h3>

	<button onclick="location.href='/views/screens/testView.jsp'">홈으로</button>
<form action="/views/screens/identify.jsp" name="deleteCancelForm" id="deleteCancelForm" method="post">
	<input type="hidden" value="deleteCancel" name="Value"/>
	<input type="submit" value="탈퇴취소"/>
</form>
</body>
</html>