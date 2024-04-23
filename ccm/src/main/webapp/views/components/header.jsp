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
		<div class="header_col_7">
			<a class="headerLinks" onclick="location.href='/coffeelist.do '">Product</a>
		</div>
		<div class="header_col_8">
			<a class="headerLinks" onclick="location.href='/main.do'">Calculator</a>
		</div>
		<div class="header_col_9">
			<a class="headerLinks" onclick="location.href='/CustomBoardListHandler.do'">Custom</a>
		</div>
		<div class="header_col_10">
			<a class="headerLinks">MyPage</a><!-- 추가 -->
		</div>
		<div class="header_col_11">
			<a class="headerLinks" onclick="location.href='/LoginHandler.do'">Login</a>
		</div>
	</header>

</body>
</html>