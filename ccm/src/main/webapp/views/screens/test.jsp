<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="global.dto.Main" %>
<%@ page import="favorite.dto.Favorite" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>	
	<%
	Main main = (Main) request.getAttribute("main");
	HashMap<Integer, Favorite> favMap = main.getFavorties();
	int calculationResult = main.getCalculationResult();
	double ri = main.getRecommendedIntake();
	pageContext.setAttribute("calcResult",calculationResult);
	pageContext.setAttribute("favMap", favMap);
	%>
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,300,600,800,900" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/progressbar.js@1.1.1/local-dev/main.min.css">
	<meta charset="UTF-8">
	<meta http-equiv="Compatible" content="no-cache"/>
	<title>Insert title here</title>
</head>
<body>
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
		<div class="calc-box__dailyc">${calcResult}</div>
	</div>
	<div class="calc-container"></div>
	<br/>
	<br/>
	<h2>fav-box</h2>
	<div class="fav-box">
	<c:set var="favMap" value="${pageScope.favMap}"/>
	<c:forEach var="favorite" items="${favMap}">
			<div class="fav-item" id="fi_${favorite.key}" value="C_NO=${favorite.key}">
            <button class="fav-item__delete-btn"><i class="fa-solid fa-x"></i></button>
            <div class="fav-item__img">${favorite.value.coffeeImage}</div>
            <div class="fav-item__info">${favorite.value.coffeeName}</div>
        </div>
	</c:forEach>
    </div>
</body>
<script>let calcResult = "${calcResult}"</script>
<script src="https://kit.fontawesome.com/9e2cfcdf3a.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/progressbar.js@1.1.1/dist/progressbar.min.js" integrity="sha256-CjGwkk3nsu5BkdGgSjediSja+n8zB6HARhF/eZxtO0g=" crossorigin="anonymous"></script>
<script src="/resources/js/calculator.js"></script>
</html>