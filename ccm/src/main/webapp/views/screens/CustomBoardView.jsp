<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCM</title>
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
	<button onclick="moveToReplyPage(${item.cus_no})">댓글</button><!-- 댓글 페이지 이동버튼 추가했어용 -->
          </c:forEach>  
	<script>
    function moveToReplyPage(cus_no) {
    	var encodedCusNo = encodeURIComponent(cus_no);
        window.location.href = "<%=request.getContextPath()%>/views/screens/customReply.jsp?cus_no=" + encodedCusNo;
    }
	</script>

</body>
</html>