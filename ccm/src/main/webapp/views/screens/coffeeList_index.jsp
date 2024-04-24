<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

    .coffee-box{
        margin-top: 20px; 
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .coffeelist-item {
        flex: 0 1 18%; 
        box-sizing: border-box;
        margin: 10px 50px;
        border: 1px solid black;
        text-align: center;
        padding: 10px;
    }

    .coffeelist-item img {
        max-width: 100%; 
        height: auto;
    }

    .pagination {
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="coffeelist-column">
        <div class="coffeeListSearch">
            <h3>커피 리스트</h3>
            
            <form action="coffeeList.do" method="get">
                <select name="searchType">
                    <option value="name">제품명</option>
                    <option value="brand">브랜드</option>
                </select>	
                검색 <input type="text" name="searchQuery" required="required">
                <input type="submit" value="검색"><br/>
                해당 부분에서 제목별 검색이 가능합니다
            </form>
        </div>
        <c:if test="${isAdmin}">
            <div>
                <a href="./views/screens/coffeeList_Add.jsp">관리자 게시글 삽입</a>
            </div>
        </c:if>
        <div class="coffee-box">
            <c:forEach var="coffeeV" items="${CoffeeListPage.coffeeList}" varStatus="status">
                <c:if test="${status.index % 2 == 0}">
                    <div style="width: 100%;"></div>
                </c:if>
                <div class="coffeelist-item" value="C_NO=${coffeeV.c_NO}">
                    <img src="${pageContext.request.contextPath}${coffeeV.c_IMG_COPY}" alt="${coffeeV.c_NAME} Image"/>
                    <h4><a href="coffeeListDetail.do?coffeeNo=${coffeeV.c_NO}&pageNo=${CoffeeListPage.currentPage}">${coffeeV.c_NAME}</a></h4>
                    <!-- 회원만 조회할 수 있는 즐겨찾기 버튼 -->
                    <c:if test="${not empty sessionScope.AUTH_USER_ID}">
                        <button style="display: inline-block;" class="addFav-btn">+</button>
                    </c:if>
                    <p>${coffeeV.c_BRAND}</p>
                    <p>Caffeine: ${coffeeV.c_CAFFEINE} mg</p>
                </div>
            </c:forEach>
        <%-- 게시글이 없으면 보여줄 내용--%>
            <c:if test="${CoffeeListPage.hasNoCoffeeList()}">
                <div>찾는 게시물이 없습니다</div>
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
                                <a href="?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                 <c:if test="${CoffeeListPage.endPage < CoffeeListPage.totalPage}">
                        <a href="?page=${CoffeeListPage.endPage + 1}">다음</a>
                 </c:if>	
            </c:when>
            <c:otherwise>
                <a href="/coffeeList.do"><button type="button">기본 리스트로 돌아가기</button></a>
            </c:otherwise>
        </c:choose>  
        </div>
    </div>
    <div class="coffeelist-column">
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
<script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script> 
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script> 
<script src="/resources/js/favoritelist.js" type="text/babel"></script>
</html>