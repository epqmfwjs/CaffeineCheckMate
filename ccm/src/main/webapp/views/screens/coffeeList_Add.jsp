<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COFFEELIST ADD(master)</title>
</head>
<body>
	<h2>커피를 열심히 추가하쟈</h2>
	<form action="/coffeeListAdd.do" method="post" accept-charset="UTF-8">
		제품 이름:<br/>
		<input type="text" id="cname" name="cname" required><br/>
		        
		브랜드:<br/>
		<input type="text" id="cbrand" name="cbrand" required><br/>
		        
		카페인 함량:<br/>
		<input type="number" id="ccaffeine" name="ccaffeine" required><br/>
		        
		당류 함량:<br/>
		<input type="number" id="csaccharide" name="csaccharide" required><br/>
		        
		칼로리:<br/>
		<input type="number" id="ccalorie" name="ccalorie" required><br/>
		        
		상세 내용:<br/>
		<textarea id="ccontent" name="ccontent" required></textarea><br/>
		        
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
		<input type="text" id="cimgreal" name="cimgreal" required><br>
        
        <input type="submit" value="찔러찔로">
    </form>
</html>