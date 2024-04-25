<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/common.css">
<script src="../../resources/js/coffeeList.js">
</script>
<title>COFFEELIST ADD(master)</title>
</head>
<body>
	<h2>커피 추가(admin만 접속 가능)</h2>
	<!-- 
	이미지 추가 기능 : enctype="multipart/form-data"
	HTML 폼의 기본 인코딩은 간단한 텍스트 데이터만 처리 가능(파일 업로드 지원 X)
	cos 라이브러리를 이용 (multipart/form-data) :
	 폼데이터를 서버로 전송할 때 인코딩 타입을 지정하는 속성
	onsubmit="return validateForm()" > 
	 유효성 검사 함수를 호출하고, 검사가 성공한 경우에만 서버로 데이터를 전송
	-->
	<form action="/coffeeListAdd.do" method="post" 
		  accept-charset="UTF-8" enctype="multipart/form-data"
		  onsubmit="return coffee_FileExtensionsError()">
		<label>제품 이름:<br/></label>
		<input type="text" id="cname" name="cname" required><br/>
		        
		<label>브랜드:<br/></label>
		<input type="text" id="cbrand" name="cbrand" required><br/>
		        
		<label>카페인 함량:<br/></label>
		<input type="number" id="ccaffeine" name="ccaffeine" required><br/>
		        
		<label>당류 함량:<br/></label>
		<input type="number" id="csaccharide" name="csaccharide" required><br/>
		        
		<label>칼로리:<br/></label>
		<input type="number" id="ccalorie" name="ccalorie" required><br/>
		        
		<label>상세 내용:<br/></label>
		<textarea id="ccontent" name="ccontent" required></textarea><br/>
		        
		<label>음료 타입:<br/></label>
			<select id="ctype" name="ctype" required>
				<option value="COF">Coffee</option>
				<option value="BEV">Beverage</option>
				<option value="TEA">Tea</option>
			</select><br/>
		        
		<label>카페인 정도:<br/></label>
			<select id="cstage" name="cstage" required>
				<option value="1">낮음</option>
				<option value="2">중간</option>
				<option value="3">높음</option>
			</select><br/>
        
        <!-- preview 미리보기 단락 -->
        <p>
        <img id="coffeePreviewImage" src="#" width="300" height="200" alt="파일 미리보기">
        </p>
		<label>Image 파일 업로드</label> <br/>
		
		<!-- onchange -->
		<input type="file" id="cimgreal" name="cimgreal" onchange="coffee_PreviewImage()" required><br>
		
		<!-- 이것도 유효성 검사 가능 신기하네
        <input type="file" accept="image/png, image/jpeg"> 
		<input type="file" accept=".png, .jpeg"> -->
        <input class="coffee__add-btn" type="submit" value="추가하기">
    </form>
<div>
	<a href="javascript:history.back();"><button>이전 페이지</button></a>
	<a href="/coffeelist.do"><button>커피리스트 메인 페이지</button></a>
</div>
<script src="/resources/js/coffeelist-add.js"></script>
</html>