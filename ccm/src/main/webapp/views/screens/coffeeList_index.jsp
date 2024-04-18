<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커피리스트 게시판 리스트</title>
<style>
    div.search{
        text-align: center;
    }

    div.content {
        margin-top: 20px; 
        display: flex;
        justify-content: center;
    }

    div.left, div.right {
        width: 500px; 
        height: 550px; 
        border: 2px solid black;
        box-sizing: border-box;
        padding: 30px;
        margin: 0 10px;   /* 좌우마진 수정 */
        overflow-y: auto;
    }
</style>
</head>
<body>

<div class="search">
    <h3>커피 리스트</h3>
    검색 <input type="text" value="kongnamuel"/>
        <input type="submit" value="검색"/><br/>
        해당 부분에서 제목별 검색이 가능합니다
</div>
<div>
	<a href="./views/screens/coffeeList_Add.jsp">순댓국 고기 추가</a>
</div>

<div class="content">
    <div class="left">
        <table border="1">
        
			<c:forEach var="coffeeV" items="${CoffeeListPage.coffeeList}">
			 <tr>
			  <td><a href="coffeeListDetail.do?coffeeNo=${coffeeV.c_NO}">${coffeeV.c_NAME}</a></td>
			  <td>${coffeeV.c_BRAND}</td>
			  <td>${coffeeV.c_CAFFEINE}</td>
			  <td>${coffeeV.c_IMG_COPY}</td>
			  <td>관리자 전용<br/>
				<a href="coffeeListDelete.do?coffeeNo=${coffeeV.c_NO}">Delete</a>
				<a href="coffeeListUpdate.do?coffeeNo=${coffeeV.c_NO}">Update</a>
			  </td>
			 </tr>
			</c:forEach>
		</table>
    </div>
    <div class="right"></div>
	</div>

</body>
</html>