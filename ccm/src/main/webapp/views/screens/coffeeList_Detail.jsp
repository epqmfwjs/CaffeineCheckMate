<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEELIST Detail</title>
</head>
<body>
<h3>요기는 상세 페이지 임시 거처입니당 :D</h3>
	<div>
		관리자 전용<br/>
		<a href="coffeeListDelete.do?coffeeNo=${coffeeDetail.c_NO}">Delete</a>
		<a href="coffeeListUpdate.do?coffeeNo=${coffeeDetail}">Update</a>
		
		
	</div>
	<form method="post" action="/coffeeListDelete.do">
		<input type="hidden" id="coffeeNo" name="coffeeNo" value="${coffeeDetail.c_NO}"/>
		<input type="submit" value="삭제">
	</form>
	
	<form  method="post" accept-charset="UTF-8" action="<%=request.getContextPath()%>/views/screens/coffeeList_Update.jsp" accept-charset="UTF-8">
			<input type="hidden" id="hiddenNo" name="hiddenNo" value="${coffeeDetail.c_NO}"/>		
			<input type="hidden" id="hiddenName" name="hiddenname" value="${coffeeDetail.c_NAME}"/>		
			<input type="hidden" id="hiddenbrand" name="hiddenbrand" value="${coffeeDetail.c_BRAND}"/>		
			<input type="hidden" id="hiddencaffeine" name="hiddencaffeine" value="${coffeeDetail.c_CAFFEINE}"/>		
			<input type="hidden" id="hiddensaccharide" name="hiddensaccharide" value="${coffeeDetail.c_SACCHARIDE}"/>		
			<input type="hidden" id="hiddencalorie" name="hiddencalorie" value="${coffeeDetail.c_CALORIE}"/>		
			<input type="hidden" id="hiddencontent" name="hiddencontent" value="${coffeeDetail.c_CONTENT}"/>
			<input type="hidden" id="hiddentype" name="hiddentype" value="${coffeeDetail.c_TYPE}"/>
			<input type="hidden" id="hiddenstage" name="hiddenstage" value="${coffeeDetail.c_STAGE}"/>
			<input type="hidden" id="hiddenimgreal" name="hiddenimgreal" value="${coffeeDetail.c_IMG_REAL}"/>
			<input type="hidden" id="hiddenimgcopy" name="hiddenimgcopy" value="${coffeeDetail.c_IMG_COPY}"/>
		<input type="submit" value="수정">
	</form>
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
			  <td>${coffeeDetail.c_CAFFEINE}</td>
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