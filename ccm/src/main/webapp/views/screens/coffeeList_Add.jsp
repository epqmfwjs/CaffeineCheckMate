<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/coffeeadd.css">
<script src="/resources/js/coffeeList.js"></script>
<title>COFFEELIST ADD(master)</title>
</head>
<body>
<h2>COFFEE ADD</h2>
	<!-- 폼 섹션 -->
	<form action="/coffeeListAdd.do" method="post" accept-charset="UTF-8" enctype="multipart/form-data" onsubmit="return coffee_FileExtensionsError()">
		<div class="form-detail">
			<div class="detail">
				<label>제품 이름</label>
				<input type="text" id="cname" name="cname" required>
				
				<label>브랜드</label>
				<input type="text" id="cbrand" name="cbrand" required>
				
				<label>카페인 함량</label>
				<input type="number" id="ccaffeine" name="ccaffeine" required>
				
				<label>당류 함량</label>
				<input type="number" id="csaccharide" name="csaccharide" required>
				
				<label>칼로리</label>
				<input type="number" id="ccalorie" name="ccalorie" required>
				
				<label>상세 내용</label>
				<textarea id="ccontent" name="ccontent" required></textarea>
				
				<label>음료 타입</label>
				<select id="ctype" name="ctype" required>
				    <option value="COF">Coffee</option>
				    <option value="BEV">Beverage</option>
				    <option value="TEA">Tea</option>
				</select>
		                
				<label>카페인 정도</label>
				<select id="cstage" name="cstage" required>
				    <option value="1">낮음</option>
				    <option value="2">중간</option>
				    <option value="3">높음</option>
				</select>
			</div>
		</div>
		<div class="form-image">
			<div class="image">
				<!-- 이미지 업로드 및 미리보기 섹션 -->
				<img id="coffeePreviewImage" src="http://localhost:8080/resources/imgs/coffeelistb.jpg"  style="width:300px; height:400px;">
				<label>이미지 파일 업로드</label>
				<input type="file" id="cimgreal" name="cimgreal" onchange="coffee_PreviewImage()" required>
				
			  	<input class="mainbuttonOk" type="submit" value="추가하기">
				<button class="mainbuttonSub" type="button" onclick="history.back()">뒤로 가기</button>
			  	<a href="/coffeelist.do"><button class="mainbuttonSub" type="button">커피 리스트</button></a>
			</div>
		</div>	
	</form>
</body>
<script src="/resources/js/coffeelist-add.js"></script>
</html>