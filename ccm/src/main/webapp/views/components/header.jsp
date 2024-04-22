<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/common.css" />
<title>header</title>
</head>
<body>

	<header class="container">
		<div class="header_col_1">
			<a class="headerLinks">CCM</a><!-- 추가- 시간날 때 포스터 같은 느낌으로 정체성 표시해주면 좋을듯 -->
		</div>
		<div class="header_col_7">
			<a class="headerLinks" onclick="location.href='/coffeelist.do '">커피리스트</a>
		</div>
		<div class="header_col_8">
			<a class="headerLinks" onclick="location.href='/main.do'">카페인계산기</a>
		</div>
		<div class="header_col_9">
			<a class="headerLinks" onclick="location.href='/CustomBoardListHandler.do'">커스텀레시피</a>
		</div>
		<div class="header_col_10">
			<a class="headerLinks">마이페이지</a><!-- 추가 -->
		</div>
		<div class="header_col_11">
			<a class="headerLinks" onclick="location.href='/LoginHandler.do'">로그인</a>
		</div>
	</header>

</body>
</html>