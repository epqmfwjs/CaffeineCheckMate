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
<title>Insert title here</title>
</head>
<body>
	<h2>Mypage 입니당</h2>
	
	<hr>
	<h2>내 프로필</h2>
	<table align="center" border="1">
        <tr align="center" bgcolor="#79e5cb">
            <td width="%"><b>아이디</b></td>
            <td width="%"><b>프로필이미지</b></td>
        </tr>
        <c:choose>
            <c:when test="${empty mypages}">
                <td colspan="5" align="center">
                    <b>등록된 회원이 없습니다.</b>
                </td>
            </c:when>
            <c:when test="${not empty mypages }">
                <c:forEach var="mypages" items="${mypages }">
                    <tr align="center">
                        <td>${mypages.M_ID }</td>
                        <td>${mypages.P_IMG_COPY }</td>
                    </tr>
                </c:forEach>
            </c:when>
        </c:choose>
    </table>

	
	<hr>
	<h2>카페인 신호등</h2>
	
	
	<hr>
	<h2>내가 작성한 레시피</h2>
	
	
	<hr>
	<h2>즐겨찾기 목록</h2>
	
	
	
</body>
</html>