<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>요기는 상세 페이지 임시 거처입니당 :D</h3>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
        <table border="1">
			 <tr>
			  <td>제품명</td>
			  <td>${coffeeDetail.c_NAME}</td>
			  </tr>
			 <tr>
			  <td>브랜드</td>
			  <td>${coffeeDetail.c_BRAND}</td>
			 </tr> 
			 <tr>
			  <td>카페인</td>
			  <td>${coffeeDetail.c_CAFFAINE}</td>
			 </tr> 
			 <tr>
			  <td>당도</td>
			  <td>${coffeeDetail.c_SACCHARIDE}</td>
			 </tr> 
			 <tr>
			  <td>칼로리</td>
			  <td>${coffeeDetail.c_CALORIE}</td>
			 </tr> 
			 <tr>
			  <td>제품 설명</td>
			  <td>${coffeeDetail.c_CONTENT}</td>
			 </tr> 
			 <tr>
			  <td>이미지</td>
			  <td>${coffeeDetail.c_IMG_COPY}</td>
			 </tr> 
		</table><hr/>
		
</body>
</html>