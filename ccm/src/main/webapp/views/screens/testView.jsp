<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="location.href='/CustomBoardListHandler.do'">CustomBoardListHandler.do</button>

<button onclick="location.href='/views/screens/test.jsp'">test.jsp 즐겨찾기</button>

<button onclick="location.href='/main.do'">계산기/즐겨찾기</button>


<%
	if(session.getAttribute("AUTH_USER_ID") != null){
%>	
	<div>
	<h1>다돌고  결과 viewPage 돌아오기 완료됨</h1>
	  <strong><%= session.getAttribute("AUTH_USER_NICKNAME") %></strong> 님 안녕하세요
		<form action="<%=request.getContextPath() %>/Logout">
			<input type="submit" value="로그아웃"  class="login-button" onclick="alert('로그아웃되었습니다.')"/>
		</form>
		<form action="<%=request.getContextPath() %>/views/screens/identify.jsp">
			<input type="hidden" value="edit" name="Value"/>
			<input type="submit" value="정보수정"/>
		</form>
		<!-- 마이페이지 버튼 추가 -->
		<form action="/mypage.do">
			<input type="submit" value="My Page" />
		</form>
	</div>
	<%}else{%>
	<div class="container">
	<h1>임시 메인페이지</h1>
		<form action="<%= request.getContextPath()%>/views/screens/login.jsp" name="loginFrm" method="post">
			<input type="submit" value="로그인" class="login-button"/>
		</form>
	</div>
<%}%>
	<h1>커피리스트</h1>
	<form action="/coffeeList.do" method="get">
		<input type="submit" value="coffeelist">
	</form>
</body>
</html>