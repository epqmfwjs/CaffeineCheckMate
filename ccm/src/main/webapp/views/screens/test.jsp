<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="global.dto.Main" %>
<%@ page import="favorite.dto.Favorite" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,300,600,800,900" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/progressbar.js@1.1.1/local-dev/main.min.css">
	<meta charset="UTF-8">
	<meta http-equiv="Compatible" content="no-cache"/>
	<title>Insert title here</title>
	<style>
		.calc-box {
			border: 2px solid black;
			height: 80px;
			width: 80px;
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
		.fav-item {
			display: inline-block;
			height: 70px;
			width: 50px;
			border: 1px solid black;
			position: relative;
			margin: 30px;
		}
		.fav-item__img {
			height: 40px;
			width: 40px;
			background-color: aqua;
		}
		.fav-item__delete-btn{
			position: absolute;
			top: -20px;;
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
	<br/>
	<br/>
	<br/>
	<h2>calc-box</h2><br/>
	<div class="calc-box">
		<button id="calc-box__btn-reset">reset</button>
		<div>카페인 양</div>
		<div class="calc-box__dailyc">0</div>
	</div>
	<div class="calc-container"></div>
	<br/>
	<br/>
	<h2>fav-box</h2>
	<div class="fav-box">
        <div class="fav-item" id="fi_1" value="C_NO=1">
            <button class="fav-item__delete-btn"><i class="fa-solid fa-x"></i></button>
            <div class="fav-item__img">1</div>
            <div class="fav-item__info"></div>
        </div>

        <div class="fav-item" id="fi_2" value="C_NO=2">
            <button class="fav-item__delete-btn"><i class="fa-solid fa-x"></i></button>
            <div class="fav-item__img">2</div>
            <div class="fav-item__info"></div>
        </div>

        <div class="fav-item" id="fi_3" value="C_NO=3">
            <button class="fav-item__delete-btn"><i class="fa-solid fa-x"></i></button>
            <div class="fav-item__img">3</div>
            <div class="fav-item__info"></div>
        </div>

        <div class="fav-item" id="fi_4" value="C_NO=4">
            <button class="fav-item__delete-btn"><i class="fa-solid fa-x"></i></button>
            <div class="fav-item__img">4</div>
            <div class="fav-item__info"></div>
        </div>

        <div class="fav-item" id="fi_5" value="C_NO=5">
            <button class="fav-item__delete-btn"><i class="fa-solid fa-x"></i></button>
            <div class="fav-item__img">5</div>
            <div class="fav-item__info"></div>
        </div>
    </div>
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
<script src="https://kit.fontawesome.com/9e2cfcdf3a.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/progressbar.js@1.1.1/dist/progressbar.min.js" integrity="sha256-CjGwkk3nsu5BkdGgSjediSja+n8zB6HARhF/eZxtO0g=" crossorigin="anonymous"></script>
<script src="/resources/js/calculator.js"></script>
</html>