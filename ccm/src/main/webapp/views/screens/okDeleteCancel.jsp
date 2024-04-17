<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>임시 탈퇴취소페이지</h1>
	
	<h3>탈퇴가 취소되었습니다. 감사합니다.</h3>
		<form action="<%= request.getContextPath()%>/views/screens/testView.jsp" name="loginFrm" method="post">
			<input type="submit" value="홈으로" class="login-button"/>
		</form>

</body>
</html>