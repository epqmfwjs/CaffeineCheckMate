<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/custom.js"></script>   
<meta charset="UTF-8">
<title>CCM</title>

</head>
<body>

    <form action="/views/screens/CustomBoardUpdate.jsp" method="post" id="updateform">
<c:forEach var="item" items="${list}">
    <li style="display: inline-block; width: 20%;">
        <div>
	 <input type="hidden" id="num" name="num" value="${item.cus_num}" />    
     <input type="hidden" name="content" id="content" value="${item.cus_content}" />
     <input type="hidden" name="title" id="title" value="${item.cus_title}" />
     <input type="hidden" name="img" id="img" value="${item.cus_img_realname}" />
	 <h3>${itme.cus_num}</h3>     
          <p>이미지: <img src="upload/${item.cus_img_realname}" alt="Image" width="150"></p>
		  <p>회원아이디: ${item.m_id}</p>
          <p>제품아이디: ${item.c_no}</p>
          <p>게시글제목: ${item.cus_title}</p>
          <p>글내용: ${item.cus_content}</p>
        </div>
    </li>
          <p>#${item.shot}샷#${item.milkType}#${item.syrupType}
          #${item.toppingType}#${item.decaffeinated}</p>
         <%--  <p>누적 좋아요 수: ${item.cus_sumgood}</p>
          <p>이미지번호: ${item.cus_img_no}</p> --%>
          </c:forEach>  
<div style="display: flex; align-items: center;">
        <input type="hidden" name="no" value="${param.CUS_NUM}" />
        <input type="submit" value="수정">
    </form>   
</div>
<button type="button"id="delbutton" onclick="location.href='/CustomBoardDelete.do?num=${param.CUS_NUM}'">삭제</button>
</body>
</html>