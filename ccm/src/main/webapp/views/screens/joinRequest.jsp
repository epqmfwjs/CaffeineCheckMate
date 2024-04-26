<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/joinRequest.css"rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
<%session.setAttribute("find","mailCheck"); %>
<h1>회원가입</h1>
	<form action="<%=request.getContextPath() %>/JoinMemberHandler.do" name=joinForm method = "post" onsubmit="return validateForm()">
		
		아이디<br/><input type="text" name="joinId" id="joinId" placeholder="아이디" size=10 />
				  <input type="button" value="중복체크" onclick="return checkId()"/><br/>
		
		비밀번호<br/><input type="password" name="joinPw1" id="joinPw1" placeholder="비밀번호" required="required"/><br/>
		비밀번호확인<br/><input type="password" name="joinPw2" id="joinPw2" placeholder="비밀번호확인" required="required"/><br/>
		
		이름<br/><input type="text" name="joinName" id="joinName" placeholder="이름" required="required"/><br/>
		생년월일<br/>
					<select name="birth-year" id="birth-year">
					    <option disabled selected>출생 연도</option>
					</select>
					<select name="birth-month" id="birth-month">
					    <option disabled selected>월</option>
					</select>
					<select name="birth-day" id="birth-day">
					    <option disabled selected>일</option>
					</select>

				<p style="color:red">메일인증필수</p>			
    			<input type="button" value="메일인증" onclick="joinEmail()"/><br/>

   	   닉네임<br/><input type="text" name="joinNick" id="joinNick" placeholder="닉네임" size=10 maxlength=10 minlength=2 required="required"/>
				<input type="button" value="중복체크" onclick="return checkNick()"/><br/>

	전화번호<br/><input type="text" class="tel" name="joinTel1" id="joinTel1" placeholder="010" maxlength=3  minlength=3 size=3 required="required"/>-
			   <input type="text" name="joinTel2" id="joinTel2" placeholder="0000" maxlength=4  minlength=4 size=4 required="required"/>-
			   <input type="text" name="joinTel3" id="joinTel3" placeholder="0000" maxlength=4  minlength=4 size=4 required="required"/><br/>
		
			
		성별<br/><input type="radio" name="joinMW" id="joinM" value="M" checked="checked"/>남성
				<input type="radio" name="joinMW" id="joinW" value="W" required="required"/>여성
			<br/>
		sns수신여부
			<br/>  
				<input type="radio" name="joinSnsYN" id="joinSnsY" value="Y" checked="checked"/>동의함
				<input type="radio" name="joinSnsYN" id="joinSnsN" value="N" required="required"/>동의안함
				<br/><br/>
		 		<input type="submit" value="가입"/>

			<input type="button" onclick="location.href='/views/screens/login.jsp'" value="취소"/>
	</form>
</div>
<script type="text/javascript" src="/resources/js/memberJoinRequest.js"></script>
</body>
</html>