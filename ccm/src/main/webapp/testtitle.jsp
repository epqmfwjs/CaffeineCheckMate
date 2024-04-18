<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="searchInput" placeholder="검색어를 입력하세요...">
<div id="searchResult"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $('#searchInput').keypress(function(event) {
        if (event.which === 13) { // Enter 키 코드
            var searchTerm = $('#searchInput').val();

            $.ajax({
                url: '/Jsontest.do',
                type: 'post',
               	data : {"searchTerm":searchTerm},
               	datatype : "json",
                success: function(data) {
                	console.log('hi:');
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
        }
    });

});
</script>
</body>
</html>