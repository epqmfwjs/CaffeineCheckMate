<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/coffeelist.css">
<meta charset="UTF-8">
<title>COFFEELIST UPDATE(master)</title>
<script src="../../resources/js/coffeeList.js"></script>

</head>
<body>
<%request.setCharacterEncoding("utf-8");%>

<h2>커피 수정 폼</h2>
<form action="coffeeListUpdate.do" method="post" enctype="multipart/form-data" onsubmit="return coffee_FileExtensionsError()">
    <input type="hidden" name="coffeeNo" value="${coffeeUpdateForm.c_NO}"/>
    제품 이름:<br/>
    <input type="text" name="cname" value="${coffeeUpdateForm.c_NAME}" required><br/>
    
    브랜드:<br/>
    <input type="text" name="cbrand" value="${coffeeUpdateForm.c_BRAND}" required><br/>
    
    카페인 함량:<br/>
    <input type="number" name="ccaffeine" value="${coffeeUpdateForm.c_CAFFEINE}" required><br/>
    
    당류 함량:<br/>
    <input type="number" name="csaccharide" value="${coffeeUpdateForm.c_SACCHARIDE}" required><br/>
    
    칼로리:<br/>
    <input type="number" name="ccalorie" value="${coffeeUpdateForm.c_CALORIE}" required><br/>
    
    상세 내용:<br/>
    <textarea name="ccontent" required>${coffeeUpdateForm.c_CONTENT}</textarea><br/>
    
    음료 타입:<br/>
    <select name="ctype" required>
        <option value="COF" ${"COF".equals(coffeeUpdateForm.c_TYPE) ? "selected" : ""}>Coffee</option>
        <option value="BEV" ${"BEV".equals(coffeeUpdateForm.c_TYPE) ? "selected" : ""}>Beverage</option>
        <option value="TEA" ${"TEA".equals(coffeeUpdateForm.c_TYPE) ? "selected" : ""}>Tea</option>
    </select><br/>
    
    카페인 정도:<br/>
    <select name="cstage" required>
        <option value="1" ${"1".equals(coffeeUpdateForm.c_STAGE) ? "selected" : ""}>낮음</option>
        <option value="2" ${"2".equals(coffeeUpdateForm.c_STAGE) ? "selected" : ""}>중간</option>
        <option value="3" ${"3".equals(coffeeUpdateForm.c_STAGE) ? "selected" : ""}>높음</option>
    </select><br/>
    
    현재 이미지:<br/>
    <img id="coffeePreviewImage" src="${coffeeUpdateForm.c_IMG_COPY}" alt="기존 이미지" style="width:300px;"><br/>
    
    변경할 이미지(기존 이미지 유지 희망 시 선택X)<br/>
    <input type="file" id="cimgreal" name="cimgreal" onchange="coffee_PreviewImage()"><br/>
    <!-- 수정하지 않으면 이전 값 히든으로 넘김 -->
    <input type="hidden" name="defaultImage" value="${coffeeUpdateForm.c_IMG_REAL}">
    <input type="button" onclick="coffee_openModal('cupdate')" value="수정">
    
    <!-- 모달 창 시작-->
	<div id="cupdate" class="coffeelist-modal">
		<span onclick="coffee_closeModal('cupdate')" class="coffeelist-modalclosebtn" title="Close Modal">x</span>
		<div class="coffeelist-modalcontent">
			<div class="coffeelist-modalcontainer">
				<h1>Update</h1>
				<p>정말로 수정하시겠습니까?</p>
				<div class="coffeelist-modalclearfix">
					<input class="coffeelist-modalcancelbtn" type="button" onclick="coffee_closeModal('cupdate')" value="돌아가기"/>
					<input class="coffeelist-modalOkbtn" type="submit" value="수정하기"/>
				</div>
			</div>
		</div>
	</div>
<!-- 모달 창 끝--> 
</form>
<div>
	<a href="javascript:history.back();"><button>이전 페이지</button></a>
	<a href="/coffeelist.do"><button>커피리스트 메인 페이지</button></a>
</div>
</body>
</html>