<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="global.dto.Main" %>
<%@ page import="favorite.dto.Favorite" %>
<!DOCTYPE html>
<html>
<head>
<!-- 
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,300,600,800,900" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/progressbar.js@1.1.1/local-dev/main.min.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	 -->
	<meta charset="UTF-8">
	<meta http-equiv="Compatible" content="no-cache"/>
	<title>Insert title here</title>
	<style>
		.calc-box {
			border: 2px solid black;
			height: 120px;
			width: 300px;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		.calc-box__item {
			height: 20px;
			width: 50px;
			border: 1px solid black;
		}
		.calc-container{
			margin: 20px;
			width: 200px;
			height: 100px;
		}
		#aa{
			color: var(--main-color);
		}
	</style>
</head>
<body>
<%
request.getSession().setAttribute("M_Id", "a12345");
%>
	<a id="aa" href="/addfav.do?C_NO=1">C_NO=1 즐겨찾기 추가</a>
	<a href="/addfav.do?C_NO=2">C_NO=2 즐겨찾기 추가</a>
	<a href="/deletefav.do?C_NO=1">C_NO=1 즐겨찾기 삭제</a>
	<a href="/calculate.do?C_NO=1">C_NO=1 카페인계산</a>
	<a href="/calculate.do?C_NO=2">C_NO=2 카페인계산</a>
	<a href="/reset.do">카페인양 리셋</a>
	<button id="btn" class="1">Async</button>
	<div class="calc-box">
		<input id="calc-box__input" type="text" placeholder="cno"/>
		<button id="calc-box__btn-calc">c_no 1</button>
		<button id="calc-box__btn-reset">reset</button>
		<div id="calc-box__caf" class="calc-box__item">0</div>
		<div id="calc-box__total" class="calc-box__item">0</div>
		<div id="calc-box__percent" class="calc-box__item">0%</div>
		<div id="calc-box__color" class="calc-box__item"></div>
	</div>
	<div class="calc-container"></div>
<%
 Main main = (Main) request.getAttribute("main");
if (main != null) {
	int caffeine = main.getCalculationResult();
	Map<Integer, Object> favorites = main.getFavorties();	
%>
	<div>
	<h2>즐겨찾기 목록</h2>
	<%
	if (favorites != null) {
		Set favkey = favorites.keySet();
		Iterator favIter =  favkey.iterator();
		while(favIter.hasNext()) {
			String cName = ((Favorite)favorites.get(favIter.next())).getC_NAME();
			out.print("<h3>"+cName+"</h3>");
		}

	%>
	</div>
	<h2>카페인 섭취량 : <%=caffeine %></h2>
<%} }%>
</body>
<!-- 
<script src="https://cdn.jsdelivr.net/npm/progressbar.js@1.1.1/dist/progressbar.min.js" integrity="sha256-CjGwkk3nsu5BkdGgSjediSja+n8zB6HARhF/eZxtO0g=" crossorigin="anonymous"></script>
<script src="/resources/js/calculator.js"></script>
<script src="/resources/js/async.js"></script>
<script src="/resources/js/asynccalc.js"></script>
 -->
</html>