<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/custom.css">
<meta charset="UTF-8">
<title>CCM</title>
<%
// 세션에서 AUTH_USER_ID 값을 가져와서 JavaScript 변수에 할당
HttpSession sessionId = request.getSession(false);
String m_id = (String) sessionId.getAttribute("AUTH_USER_ID");
%>
<input type="hidden" id="m_id_hidden" value="<%=m_id%>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<span class="wrapper" style="display: inline-block;">
		<!-- 헤더 -->
		<%@ include file="/views/components/header.jsp" %>
		<!-- 섹션 시작 -->

		<div class="view_form">
			<c:forEach var="item" items="${list}">
				<div class="view_left_content">
					<p><img src="upload/${item.cus_img_realname}" alt="Image" width="150"></p>
				</div>	
				<div class="view_right_content">
					<div>회원아이디: ${item.m_id}</div>
					<p>제품아이디: ${item.c_no}</p>
					<p>게시글제목: ${item.cus_title}</p>
					<p>글내용: ${item.cus_content}</p>
					<p>게시일: ${item.cus_regdate}</p>
				</div>
				<div class="view_right_content_row2">
					<div class="option_tag">
						<div>#${item.shot}샷</div>
						<div>#${item.milkType}</div>
						<div>#${item.syrupType}</div>
						<div>#${item.toppingType}</div>
						<div>#${item.decaffeinated}</div>
					</div>
					<div>
						<!-- 댓글 버튼 -->
						<button onclick="showReplyModal('${item.cus_no}')">댓글</button>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 모달을 나타내는 HTML -->
		<div id="modal" class="modal-container">
			<button onclick="closeModal()">닫기</button>
			<div class="modal-content" id="modal-content"></div>
		</div>

</body>

<script>
	    // 댓글 모달을 보여주는 함수
	    function showReplyModal(cus_no) {
	        var modal = document.getElementById("modal");
	        modal.style.display = "block";
	
	        // AJAX를 통해 다른 JSP 페이지를 불러와 모달에 표시
	        var xhr = new XMLHttpRequest();
	        
	        var encodedCusNo = encodeURIComponent(cus_no);
	        var m_id = document.getElementById("m_id_hidden").value;
	        
	        xhr.open("POST", "<%=request.getContextPath()%>/views/screens/customReply.jsp?cus_no=" + encodedCusNo);
	        xhr.send();
	        
	        xhr.onreadystatechange = function() {
	            if (xhr.readyState == 4 && xhr.status == 200) {
	                var modalContent = document.getElementById("modal-content");
	                modalContent.innerHTML = xhr.responseText;
	
	                // 외부 JavaScript 파일의 경로
	                var jsFilePath = "<%=request.getContextPath()%>/resources/js/customReply.js";

				// 외부 JavaScript 파일을 가져와서 모달에 추가
				var scriptElement = document.createElement("script");
				scriptElement.src = jsFilePath;
				modalContent.appendChild(scriptElement);
			}
		};
	}

	// 모달을 닫는 함수
	function closeModal() {
		var modal = document.getElementById("modal");
		modal.style.display = "none";
	}
</script>
</html>