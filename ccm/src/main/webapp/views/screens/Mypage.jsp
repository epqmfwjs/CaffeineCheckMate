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
<title>Mypage</title>
</head>
<body>
	<h2>Mypage 입니당</h2>
	
	<hr>
	<h2>내 프로필</h2>
	<!-- 프로필 수정 버튼 -->
	<!-- <form action="EditMyProfile.do">
		<input type="submit" value="프로필 수정"/>
	</form> -->
	<table align="center" border="1">
        <tr align="center" bgcolor="#79e5cb">
            <td width="%"><b>닉네임</b></td>
            <td width="%"><b>아이디</b></td>
            <td width="%"><b>프로필이미지</b></td>
        </tr>
        <c:choose>
            <c:when test="${empty mypages}">
                <tr align="center">
                <td colspan="3">
                    <b>등록된 회원이 없습니다.</b>
                </td>
                </tr>
            </c:when>
            <c:otherwise>
            	<tr align="center">
            	<td>${mypages.userProfileDTO.m_NICKNAME }
            	<td>${mypages.userProfileDTO.m_ID }</td>
            	<td>${mypages.userProfileDTO.p_IMG_COPY }</td>
            </c:otherwise>
        </c:choose>
    </table>


	<hr>
	<h2>카페인 신호등</h2>
	<p>오늘 섭취한 카페인량 : ${mypages.healthLightDTO.cAL_DAILYCF }</p>
	
	<hr>
	<h2>내가 작성한 레시피</h2>
		<table align="center" border="1">
    <tr align="center" bgcolor="#79e5cb">
        <td width="%"><b>게시판 번호</b></td>
        <td width="%"><b>제목</b></td>
        <td width="%"><b>첨부사진</b></td>
    </tr>
    <c:choose>
        <c:when test="${empty mypages}">
            <tr align="center">
                <td colspan="4">
                    <b>등록된 즐겨찾기목록이 없습니다.</b>
                </td>
            </tr>
        </c:when>
        <c:otherwise>
	        <c:forEach var="myrecipe" items="${mypages.myRecipeDTO}">
			<tr align="center">
			<td>${myrecipe.CUS_NO }</td>
			<td>${myrecipe.CUS_TITLE }</td>
			<td>${myrecipe.CUS_IMG_COPY }</td>
		</tr>
	</c:forEach>
        </c:otherwise>
    </c:choose>
</table>
	
	<hr>
	<h2>즐겨찾기 목록</h2>
	<table align="center" border="1">
    <tr align="center" bgcolor="#79e5cb">
        <td width="%"><b>제품넘버</b></td>
        <td width="%"><b>제품이름</b></td>
        <td width="%"><b>카페인 함량</b></td>
        <td width="%"><b>사진</b></td>
    </tr>
    <c:choose>
        <c:when test="${empty mypages}">
            <tr align="center">
                <td colspan="4">
                    <b>등록된 즐겨찾기목록이 없습니다.</b>
                </td>
            </tr>
        </c:when>
        <c:otherwise>
	        <c:forEach var="favorite" items="${mypages.favoriteListDTO}">
			<tr align="center">
			<td>${favorite.c_NO }</td>
			<td>${favorite.c_NAME }</td>
			<td>${favorite.c_CAFFEINE }mg</td>
			<td>${favorite.c_IMG_COPY }</td>
		</tr>
	</c:forEach>
        </c:otherwise>
    </c:choose>
</table>
<!-- 홈으로 돌아가기 -->
	<form action="testView.jsp">
		<input type="submit" value="GO TO TESTVIEW"/>
	</form>
	
</body>
</html>