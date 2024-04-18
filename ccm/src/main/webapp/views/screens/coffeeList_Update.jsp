<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEELIST UPDATE(master)</title>
</head>
<body>
<h2>커피를 열심히 변경하주오</h2>
<div> Coffee Number : ${coffeeDetail.c_NO}</div>
	<form action="../../coffeeListAdd.do" method="post" accept-charset="UTF-8">
		제품 이름:<br/>
		<input type="text" id="cname" name="cname" value="${coffeeDetail.c_NAME}" required><br/>
		        
		브랜드:<br/>
		<input type="text" id="cbrand" name="cbrand" value="${coffeeDetail.c_BRAND}"required><br/>
		        
		카페인 함량:<br/>
		<input type="number" id="ccaffeine" name="ccaffeine" value="${coffeeDetail.c_CAFFEINE}" required><br/>
		        
		당류 함량:<br/>
		<input type="number" id="csaccharide" name="csaccharide" value="${coffeeDetail.c_SACCHARIDE}" required><br/>
		        
		칼로리:<br/>
		<input type="number" id="ccalorie" name="ccalorie" value="${coffeeDetail.c_CALORIE}" required><br/>
		        
		상세 내용:<br/>
		<textarea id="ccontent" name="ccontent" value="${coffeeDetail.c_CONTENT}" required></textarea><br/>
		        
		음료 타입:<br/>
			<select id="ctype" name="ctype" required>
				<option value="COF">Coffee</option>
				<option value="BEV">Beverage</option>
				<option value="TEA">Tea</option>
			</select><br/>
		        
		카페인 정도:<br/>
			<select id="cstage" name="cstage" required>
				<option value="1">낮음</option>
				<option value="2">중간</option>
				<option value="3">높음</option>
			</select><br/>
        
		Image URL:<br/>
		<input type="text" id="cimgreal" name="cimgreal" value="${coffeeDetail.c_IMG_REAL}" required><br>
        
        <input type="submit" value="찔러찔로">
    </form>
</body>
</html>