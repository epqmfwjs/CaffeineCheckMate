<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/custom.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<a><h3>커스텀레시피</h3></a>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript"> var allcount = ${allcount}; </script>
<script type="text/javascript" src="/resources/js/custom.js"></script>

</head>
<body>
<button type="button" onclick="location.href='/views/screens/CustomBoardAdd.jsp'">글 작성</button>
검색: <input type="text" id="search" onkeypress="show_name(event)" placeholder="Search"><br/>

<div class="dropdown">
    <button id="milkButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        우유 종류
    </button>
    <div id="fruitList" class="dropdown-menu">
     <a class="dropdown-item" href="#" data-value="noMilk">우유 변경 없음</a>
<a class="dropdown-item" href="#" data-value="저지방우유">저지방 우유</a>
<a class="dropdown-item" href="#" data-value="아몬드브리즈">아몬드 브리즈</a>
<a class="dropdown-item" href="#" data-value="오토믹스">오트 믹스</a>
<a class="dropdown-item" href="#" data-value="두유">두유</a>
<a class="dropdown-item" href="#" data-value="코코넛밀크">코코넛 우유</a>
    </div>
</div>
<div class="dropdown">
    <button id="syrupButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        시럽 종류
    </button>
    <div id="syrupList" class="dropdown-menu">
        <a class="dropdown-item" href="#" data-value="noSyrup">시럽 추가 없음</a>
        <a class="dropdown-item" href="#" data-value="바닐라시럽">바닐라 시럽</a>
        <a class="dropdown-item" href="#" data-value="카라멜시럽">카라멜 시럽</a>
        <a class="dropdown-item" href="#" data-value="헤이즐넛시럽">헤이즐넛 시럽</a>
        <a class="dropdown-item" href="#" data-value="모카시럽">모카 시럽</a>
        <a class="dropdown-item" href="#" data-value="시나몬시럽">시나몬 시럽</a>
        <a class="dropdown-item" href="#" data-value="메이플시럽">메이플 시럽</a>
    </div>
</div>
<div class="dropdown">
    <button id="toppingButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        토핑 종류
    </button>
    <div id="toppingList" class="dropdown-menu">
        <a class="dropdown-item" href="#" data-value="noTopping">토핑 추가 없음</a>
        <a class="dropdown-item" href="#" data-value="휘핑크림">휘핑 크림</a>
        <a class="dropdown-item" href="#" data-value="초콜릿토핑">초콜릿 토핑</a>
        <a class="dropdown-item" href="#" data-value="카라멜드리즐">카라멜 드리즐</a>
        <a class="dropdown-item" href="#" data-value="마시멜로">마시멜로</a>
        <a class="dropdown-item" href="#" data-value="코코아파우더">코코아 파우더</a>
        <a class="dropdown-item" href="#" data-value="쿠키크럼블">쿠키 크럼블</a>
        <a class="dropdown-item" href="#" data-value="펄">펄</a>
    </div>
</div>

<div class="dropdown">
    <button id="decafButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        디카페인 종류
    </button>
    <div id="decafList" class="dropdown-menu">
        <a class="dropdown-item" href="#" data-value="일반">일반</a>
        <a class="dropdown-item" href="#" data-value="디카페인">디카페인</a>
    </div>
</div>


<ul id="board"></ul>
</body>
</html>