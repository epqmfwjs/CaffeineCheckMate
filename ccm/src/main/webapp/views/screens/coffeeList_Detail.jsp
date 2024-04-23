<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEELIST Detail</title>
</head>
<body>
<h3>요기는 상세 페이지 임시 거처입니당 :D</h3>
<c:if test="${sessionScope.isAdmin}">
	<div>
		관리자 전용<br/>
		<a href="coffeeListDelete.do?coffeeNo=${coffeeDetail.c_NO}">Delete</a>
		<a href="coffeeListUpdateForm.do?coffeeNo=${coffeeDetail.c_NO}">Update</a>
	</div><br/>
</c:if>
<table border="1">
	<tr><td>이미지</td><td><img src="${pageContext.request.contextPath}${coffeeDetail.c_IMG_COPY}" width="300" height="200" alt="커피 이미지"></td></tr>
	<tr><td>제품명</td><td>${coffeeDetail.c_NAME}</td></tr>
	<tr><td>브랜드</td><td>${coffeeDetail.c_BRAND}</td></tr>
	<tr><td>카페인</td><td>${coffeeDetail.c_CAFFEINE}</td></tr>
	<tr><td>당도</td><td>${coffeeDetail.c_SACCHARIDE}</td></tr>
	<tr><td>칼로리</td><td>${coffeeDetail.c_CALORIE}</td></tr>
	<tr><td>제품 설명</td><td>${coffeeDetail.c_CONTENT}</td></tr>
</table><br/>
<div>
	<a href="javascript:history.back();"><button>이전 페이지</button></a>
	<a href="/coffeelist.do"><button>커피리스트 메인 페이지</button></a>
</div>
</body>
</html>