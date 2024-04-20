<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>COFFEE LIST INDEX</title>
<!-- gpt짱.. ㅠ -->
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
</head>
<body>

<div class="coffeeListSearch">
    <h3>커피 리스트</h3>
    검색 <input type="text" value="kongnamuel"/>
    <input type="submit" value="검색"/><br/>
    해당 부분에서 제목별 검색이 가능합니다
</div>
<div>
    <a href="./views/screens/coffeeList_Add.jsp">순댓국 고기 추가</a>
</div>

<div class="coffeeListView">
    <c:forEach var="coffeeV" items="${CoffeeListPage.coffeeList}" varStatus="status">
        <c:if test="${status.index % 2 == 0}">
            <div style="width: 100%;"></div>
        </c:if>
        <div class="card">
            <img src="${coffeeV.c_IMG_COPY}" alt="${coffeeV.c_NAME}"/>
            <h4><a href="coffeeListDetail.do?coffeeNo=${coffeeV.c_NO}">${coffeeV.c_NAME}</a></h4>
	        <!-- 회원만 조회할 수 있는 즐겨찾기 버튼 -->
	        <c:if test="${not empty sessionScope.AUTH_USER_ID}">
	            <button type="button">즐겨찾기버튼</button>
	        </c:if>
            <p>${coffeeV.c_BRAND}</p>
            <p>Caffeine: ${coffeeV.c_CAFFEINE} mg</p>
        </div>
    </c:forEach>
</div>

<!-- 페이지네이션 아래 블럭을 담당하느 부분 -->
<div class="pagination">
	<c:if test="${not empty CoffeeListPage and CoffeeListPage.totalPage > 0}">
        <c:forEach begin="1" end="${CoffeeListPage.totalPage}" var="i">
            <c:choose>
                <c:when test="${i == CoffeeListPage.currentPage}">
                    <span><strong>${i}</strong></span>
                </c:when>
                <c:otherwise>
                    <a href="?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>
</div>

</body>
</html>