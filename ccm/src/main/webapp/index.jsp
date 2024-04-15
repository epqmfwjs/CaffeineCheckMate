<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        </div>
</body>
</html>