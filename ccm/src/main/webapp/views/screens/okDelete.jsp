<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴완료페이지</title>

<style>
/* 전체 body 스타일 */
body {
    font-family: 'Noto Sans KR', sans-serif; /* 폰트 설정 */
    background-color: #E1DDDB; /* 배경색 설정 */
    display: flex; /* Flexbox 레이아웃 사용 */
    flex-direction: column; /* 세로 방향 정렬 */
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    height: 100vh; /* 뷰포트 높이에 맞게 설정 */
}

/* 제목 스타일 */
h1,h3 {
    color: #EF6C33; /* 글자색 설정 */
    margin-bottom: 20px; /* 하단 여백 설정 */
    text-align: center; /* 가운데 정렬 */
}

/* 버튼 스타일 */
form {
    display: flex;
    justify-content: center;
    gap: 10px;
}

form input[type="submit"], form input[type="button"] {
    width: 200px; /* 버튼 너비 설정 */
    padding: 10px; /* 안쪽 여백 설정 */
    border: none; /* 테두리 없애기 */
    border-radius: 5px; /* 테두리 반경 설정 */
    background-color: #0C4A60; /* 배경색 설정 */
    color: white; /* 글자색 설정 */
    cursor: pointer; /* 커서 설정 */
}

/* 버튼 호버 효과 */
form input[type="submit"]:hover, form input[type="button"]:hover {
    background-color: #EF6C33; /* 호버 시 배경색 변경 */
}
</style>
</head>
<body>
<%
String dday = (String)session.getAttribute("D_day");
System.out.println(dday);
session.invalidate();%>
<div>
	<h1>탈퇴진행중입니다...</h1>
	<br/>
	<h3> 탙퇴는 신청을하고 7일 후 완료됩니다.</h3>
</div>
<% if(dday!=null){%>
  	<h1>탈퇴까지 남은 시간</h1>
  <div>
  	<h2 id="deleteTime"></h2>
  	<br/><br/>
  </div>
  <%}%>
  <div>
	<form action="/views/screens/identify.jsp" name="deleteCancelForm" id="deleteCancelForm" method="post">
	    <input type="hidden" value="deleteCancel" name="Value"/>
	    <input type="submit" value="탈퇴취소"/>
	    <input type="button" value="홈으로" onclick="location.href='/views/screens/testView.jsp'">
	</form>
</div>


  <script>
	const countDownTimer = function (id, date) {
		var _vDate = new Date(date); // 전달 받은 일자
		// 시간 단위 변환을 위한 상수 정의
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;

		function showRemaining() {
			var now = new Date(); //현재시간 변수설정
			var distDt = _vDate - now; // 남은시간 계산

			// 카운트 0 도달시 타이머 종료
			if (distDt < 0) {
				clearInterval(timer);
				// 종료 메시지 표시
				document.getElementById(id).textContent = '탈퇴가 완료 되었습니다!';
				return;
			}
			// Math 함수 이용 남은시간 계산
			var days = Math.floor(distDt / _day);
			var hours = Math.floor((distDt % _day) / _hour);
			var minutes = Math.floor((distDt % _hour) / _minute);
			var seconds = Math.floor((distDt % _minute) / _second);

			// 남은 시간 표시
			document.getElementById(id).textContent = days + '일 ';
			document.getElementById(id).textContent += hours + '시간 ';
			document.getElementById(id).textContent += minutes + '분 ';
			document.getElementById(id).textContent += seconds + '초';
		}
		 // 1초마다 showRemaining 함수 실행
		timer = setInterval(showRemaining, 1000);
	}
	var dday = '<%= dday %>';
	var dateObj = new Date();
	dateObj.setDate(dateObj.getDate() + 7);
	countDownTimer('deleteTime', dday); // 월/일/년 시:초 am 형식 포맷으로 바꿔 넘김 
</script>
</body>
</html>