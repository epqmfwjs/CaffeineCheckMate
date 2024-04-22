<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCM</title>
<%
    // 세션에서 AUTH_USER_ID 값을 가져와서 JavaScript 변수에 할당
    HttpSession sessionId = request.getSession(false);
    String m_id = (String) sessionId.getAttribute("AUTH_USER_ID");
%>
<input type="hidden" id="m_id_hidden" value="<%= m_id %>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    /* 모달을 위한 스타일 */
    .modal-container {
        display: none; 
        position: fixed;
        top: 0vh;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); 
        z-index: 9999; 
    }

    .modal-content {
        background-color: #fff;
        width: 500px;
        margin: 100px auto;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
   		max-height: 60vh; 
    }
</style>

</head> 
<body>
<c:forEach var="item" items="${list}">
    <li style="display: inline-block; width: 20%;">
        <div>
         <%--  <p>글번호: ${item.cus_no}</p> --%>
          <p>이미지: <img src="upload/${item.cus_img_realname}" alt="Image" width="150"></p> 
          <p>회원아이디: ${item.m_id}</p>
          <p>제품아이디: ${item.c_no}</p>
          <p>게시글제목: ${item.cus_title}</p>
          <p>글내용: ${item.cus_content}</p>
          <p>게시일: ${item.cus_regdate}</p>
        </div>
    </li>
          <p>#${item.shot}샷#${item.milkType}#${item.syrupType}
          #${item.toppingType}#${item.decaffeinated}</p>
         <%--  <p>누적 좋아요 수: ${item.cus_sumgood}</p>
          <p>이미지번호: ${item.cus_img_no}</p> --%>
          <!-- 댓글 버튼 -->
    <button onclick="showReplyModal('${item.cus_no}')">댓글</button>
          </c:forEach>  
          
	<!-- 모달을 나타내는 HTML -->
	<div id="modal" class="modal-container">
	    <button onclick="closeModal()">닫기</button>
	    <div class="modal-content" id="modal-content">
	    </div>
	</div>
	          
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
</body>
</html>