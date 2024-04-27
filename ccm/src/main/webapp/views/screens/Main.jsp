<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="global.dto.Main" %>
<%@ page import="favorite.dto.Favorite" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <%
	boolean isAuth = request.getSession().getAttribute("AUTH_USER_ID") != null ? true:false;
	pageContext.setAttribute("isAuth", isAuth);
	%>

    <link rel="stylesheet" href="/resources/css/main.css">

<meta charset="UTF-8">
<title>CaffeinCheckMate</title>
</head>
<body id="main">
	<div class="wrapper">
		<!-- 헤더 -->
		<jsp:include page="/views/components/header.jsp" />


		<div class="fav-calc">
			<div class="fav-title"></div>
			<button class="fav-btn__go-coffeelist clickable"><i class="fa-solid fa-plus"></i></button>
			<button class="fav-btn__togle-fav-del clickable">Remove</button>
			<div class="fav-area">
				<!--즐겨찾기 include 부분-->
				<jsp:include page="/views/components/favorites.jsp"></jsp:include>
			</div>
			<div class="calc-area">
				<!--계산기 include 부분 -->
				<jsp:include page="/views/components/calculator.jsp"></jsp:include>
			</div>
		</div>
		<div id="imgboard" class="slideshow-container">
	<h2>랜덤 레시피</h2>
    <c:forEach var="item" items="${main.customBoardListDao}">
        <div class="mySlides fade">
            <a href="CustomBoardViewHandler.do?CUS_NUM=${item.cus_num}">
                <div class="boardTextBox">
                    <img src="upload/${item.cus_img_realname}" alt="Image" id="img">
                </div>
            </a>
        </div>
    </c:forEach>
</div>


 <script>
 //슬라이드 스크립트
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var slides = document.getElementsByClassName("mySlides");
            for (var i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {
                slideIndex = 1;
            }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 3000); // 3초마다 전환
        }
    </script>
</div>


</body>

<script>
	let calcResult = "${main.calculationResult}";
	const isAuth = "${isAuth}"==="true"? true : false;
	const hasCoffees = false;
    const hasCalc = true;
</script>

<script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script> 
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script> 

<script src="https://kit.fontawesome.com/9e2cfcdf3a.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/progressbar.js@1.1.1/dist/progressbar.min.js" integrity="sha256-CjGwkk3nsu5BkdGgSjediSja+n8zB6HARhF/eZxtO0g=" crossorigin="anonymous"></script>

<script src="/resources/js/favoritelist.js" type="text/babel"></script>
<script src="/resources/js/calculator.js"></script>
<script src="/resources/js/main.js" type="text/babel"></script>

</html>