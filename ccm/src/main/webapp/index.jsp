<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="coffeeList.dto.Coffee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <h1> Test</h1>
        <div>
        <a href="/test.do">test</a>
        <% String testresult = (String) request.getAttribute("test"); %>
        <h1><%=testresult %></h1>
        back_pastelq
        </div>
        
        <h1>일본식 교란말이</h1>
        <form action="coffeeList.do" method="get">
        <input type="submit">
        </form>

        <a href="mypage.do">My Page</a>
        </div>
  </body>
  </html>