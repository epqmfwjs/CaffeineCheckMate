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
		<div class="header_col_3-to-4">
			<span>
				<a class="headerLinks" onclick="location.href='/coffeelist.do '">Product</a>
			</span>
			<span>
				<a class="headerLinks" onclick="location.href='/main.do'">Calculator</a>
			</span>
			<span>
				<a class="headerLinks" onclick="location.href='/CustomBoardListHandler.do'">Custom</a>
			</span>
			<span>
				<a class="headerLinks">MyPage</a><!-- 추가 -->
			</span>
			<span>
				<a class="headerLinks" onclick="location.href='/LoginHandler.do" style="margin-left: 5vw; ">Login</a>
			</span>
		</div>
	</header>

</body>
</html>