<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>프로필 수정</title>
    <!-- 부트스트랩 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style type="text/css">
    	<!-- CSS로 파일 입력 필드 감추기 -->
        .custom-file-input {
            position: absolute;
            left: -9999px;
        }
        .custom-file-label {
            display: inline-block;
            cursor: pointer;
        }
        .profile-image {
            display: block;
            margin: auto;
            width: 300px;
            height: 300px;
            object-fit: cover;
        }
    </style>    
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">프로필 수정</h2>
        <form action="/editMyProfileUpdate.do" method="post" enctype="multipart/form-data"> <!-- 프로필 수정 처리 URL -->
	        <c:if test="${not empty profile.userProfileDTO.p_IMG_COPY}">
	       		<img src="/resources/profile/${profile.userProfileDTO.p_IMG_COPY}" class="profile-image" alt="프로필 이미지"> <!-- 프로필 사진 표시 -->
	        	<input type="hidden" value="${profile.userProfileDTO.p_IMG_COPY}" name="p_IMG_COPY">
	        </c:if>
            <div class="form-group">
                <label for="userid">아이디</label>
                <input type="text" class="form-control" id="m_ID" name="m_ID" value="${profile.userProfileDTO.m_ID}" readonly>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" class="form-control" id="m_NICKNAME" name="m_NICKNAME" value="${profile.userProfileDTO.m_NICKNAME}">
            </div>
            <div class="form-group">
                <label for="userid">몸무게</label>
                <input type="text" class="form-control" id="p_WEIGHT" name="p_WEIGHT" value="${profile.userProfileDTO.p_WEIGHT}">
            </div>
            <div class="form-group">
                <label for="profileImage">프로필 이미지</label>
                <div class="custom-file">  <!-- 파일 업로드 필드 감추기 -->
                    <input type="file" class="custom-file-input" id="p_IMG_REAL" name="p_IMG_REAL">
                    <label class="custom-file-label" for="p_IMG_REAL">파일 선택</label>  <!-- "파일 선택" 텍스트 -->
                </div>
                <input type="text" class="form-control mt-2" id="fileNameDisplay" value="${profile.userProfileDTO.p_IMG_REAL}" readonly>  <!-- 파일명 표시 -->
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">수정하기</button>
                <a href="mypage.do" class="btn btn-secondary">취소</a> <!-- 마이페이지로 돌아가기 -->
            </div>
        </form>
    </div>

    <!-- 부트스트랩 JS 및 의존성 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- jQuery 이벤트로 파일 이름 표시 -->
	<script>
		$(document).ready(function() {
  			$('#p_IMG_REAL').on('change', function() {
                var fileName = $(this).val().split('\\').pop();  // 파일 이름 추출
                $('#fileNameDisplay').val(fileName);  // 텍스트 영역에 파일 이름 표시
                $('.custom-file-label').text(fileName);  // 커스텀 파일 라벨에 파일 이름 표시
            });
        });
    </script>
</body>
</html>