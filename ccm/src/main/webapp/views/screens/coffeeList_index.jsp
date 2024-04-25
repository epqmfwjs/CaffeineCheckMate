<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/coffeelist.css">
    <%
	boolean isAuth = request.getSession().getAttribute("AUTH_USER_ID") != null ? true:false;
	pageContext.setAttribute("isAuth", isAuth);
	%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>COFFEE LIST INDEX</title>
<style>
    .coffeeListSearch{
        text-align: center;
    }

    .coffeeListView{
        margin-top: 20px; 
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .card {
        flex: 0 1 18%; 
        box-sizing: border-box;
        margin: 10px 50px;
        border: 1px solid black;
        text-align: center;
        padding: 10px;
    }

    .card img {
        max-width: 100%; 
        height: auto;
    }

    .pagination {
        text-align: center;
        margin-top: 20px;
    }
</style>
<script src="../../resources/js/coffeeList.js"></script>
</head>
<body id="coffeelist">
    <div class="coffeelist-column_1">
        <div class="coffeelist-column__header">
            <div class="coffeelist-title">Coffees</div><br/>
            <div class="coffeelist-searchbox">
                <form action="coffeeList.do" method="get">
                    <select class="coffeelist-searchbox__select" name="searchType">
                        <option value="name">제품명</option>
                        <option value="brand">브랜드</option>
                    </select>	
                    <input class="coffeelist-searchbox__input" type="text" name="searchQuery" required="required">
                    <button class="coffeelist-searchbox__btn clickable"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <div class="coffeelist-add">
                <c:if test="${isAdmin}">
                    <a href="./views/screens/coffeeList_Add.jsp">관리자 게시글 삽입</a>
                </c:if>
            </div>
        </div>
        <div class="coffee-box">
            <c:forEach var="coffeeV" items="${CoffeeListPage.coffeeList}" varStatus="status">
				<!-- 모달 창 시작-->
				<div id="cdelete" class="coffeelist-modal">
					<span onclick="coffee_closeModal('cdelete')" class="coffeelist-modalclosebtn" title="Close Modal">x</span>
					<form class="coffeelist-modalcontent" method="post" action="coffeeListDelete.do?coffeeNo=${coffeeV.c_NO}">
						<div class="coffeelist-modalcontainer">
							<h1>Delete Account</h1>
							<p>삭제된 게시물은 되돌릴 수 없습니다. 정말로 삭제하시겠습니까?</p>
							<div class="coffeelist-modalclearfix">
								<input class="coffeelist-modalcancelbtn" type="button" onclick="coffee_closeModal('cdelete')" value="돌아가기"/>
								<input class="coffeelist-modalOkbtn" type="submit" value="삭제하기"/>
							</div>
						</div>
					</form>
				</div>
				<!-- 모달 창 끝-->            
                <div class="coffeelist-container">
                
                    <div class="coffeelist-item" value="C_NO=${coffeeV.c_NO}">
                        <img class="coffeelist-item__img" src="${pageContext.request.contextPath}${coffeeV.c_IMG_COPY}" alt="${coffeeV.c_NAME} Image"/>
                        <div class="clickable">
                       		<a href="coffeeListDetail.do?coffeeNo=${coffeeV.c_NO}" 
                       		onclick="window.open(this.href, '_blank', 'width=450, height=550, top=(screen.height - 550) / 2, left=(screen.width - 450) / 2'); return false;">${coffeeV.c_NAME}</a>
                        </div>
                        
                        
                        <!-- 회원만 조회할 수 있는 즐겨찾기 버튼 -->
                        <div>${coffeeV.c_BRAND}</div>
                        <div>Caffeine: ${coffeeV.c_CAFFEINE} mg</div>
                        <c:if test="${not empty sessionScope.AUTH_USER_ID}">
                            <button style="display: inline-block;" class="addFav-btn">+</button>
                            <c:if test="${isAdmin}">
	                            <a href="coffeeListUpdateForm.do?coffeeNo=${coffeeV.c_NO}"><button type="button">수정</button></a>
	                            <!-- <a href="coffeeListDelete.do?coffeeNo=${coffeeV.c_NO}"><button type="button">삭제</button></a> -->
	                            <button type="button" onclick="coffee_openModal('cdelete')">관리자 삭제</button>
                        	</c:if>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${CoffeeListPage.hasNoCoffeeList()}">
                <div class="coffeelist-item">찾는 게시물이 없습니다</div>
            </c:if>
            
        </div>
        
        <!-- 페이지네이션 아래 블럭을 담당하는 부분 -->
        
        <div class="pagination">
        <c:choose>
            <c:when test="${CoffeeListPage.hasCoffeeList()}">
                <!-- 게시물이 있을 경우 페이징 넘버 처리 -->
                <c:if test="${CoffeeListPage.startPage > 1}">
                    <a href="?page=${CoffeeListPage.startPage - 1}">이전</a>
                </c:if>
                    <c:forEach begin="${CoffeeListPage.startPage}" 
                               end  ="${CoffeeListPage.endPage}"  var="i">
                        <c:choose>
                            <c:when test="${i == CoffeeListPage.currentPage}">
                                <span><b>${i}</b></span>
                            </c:when>
                            <c:otherwise>
                                <a class="clickable" href="?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                 <c:if test="${CoffeeListPage.endPage < CoffeeListPage.totalPage}">
                        <a class="clickable" href="?page=${CoffeeListPage.endPage + 1}">다음</a>
                 </c:if>	
            </c:when>
            <c:otherwise>
                <a href="/coffeeList.do"><button type="button">기본 리스트로 돌아가기</button></a>
            </c:otherwise>
        </c:choose>  
        </div>
    </div>



    <div class="coffeelist-column_2">
        <c:if test="${not empty sessionScope.AUTH_USER_ID}">
            <div class="favbox">
                <!--즐겨찾기 include 부분-->
                <jsp:include page="/views/components/favorites.jsp"></jsp:include>
            </div>
        </c:if>
    </div>

</body>
<script>
	const isAuth = "${isAuth}"==="true"? true : false;
	const hasCoffees = true;
    const hasCalc = false;
</script>
<script src="https://kit.fontawesome.com/9e2cfcdf3a.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script> 
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script> 
<script src="/resources/js/favoritelist.js" type="text/babel"></script>
</html>