<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* 컨테이너 스타일 */

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    width: 100%;
    margin-top: 20px;
}

/* 입력 필드 스타일 */
input[type="text"] {
    padding: 8px;
    margin: 5px 0; /* 상하 마진 조정 */
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 60%; /* 너비 조정 */
}


/* 기존 버튼 스타일 */
input[type="button"], input[type="submit"] {
    padding: 8px 15px; /* 패딩 조정 */
    margin-top: 10px; /* 상단 마진 추가 */
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 20%; /* 버튼 너비 조정 */
}

input[type="button"]:hover, input[type="submit"]:hover {
    background-color: #45a049;
}
/* 비밀번호 입력 필드 스타일 */
input[type="password"] {
    padding: 8px;
    margin: 5px 0; /* 상하 마진 조정 */
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 60%; /* 너비 조정 */
    display: inline-block;
    box-sizing: border-box; /* 박스 크기 조정 */
}

input[type="password"]:focus {
    border-color: #4A90E2;
}
/* 버튼 및 서브밋 스타일 조정 */
input[type="button"], input[type="submit"] {
    padding: 8px 15px; /* 패딩 조정 */
    margin-top: 10px; /* 상단 마진 추가 */
    background-color: #4CAF50; /* 배경색 */
    color: white; /* 글자색 */
    border: none; /* 테두리 제거 */
    border-radius: 4px; /* 모서리 둥글게 */
    cursor: pointer; /* 커서 모양 변경 */
    width: 60%; /* 너비 조정 */
}

input[type="button"]:hover, input[type="submit"]:hover {
    background-color: #45a049; /* 호버 시 배경색 변경 */
}
</style>
</head>
<body>
<div class="container">
<h1>회원정보수정</h1>

<% 
	String UpdateID = (String)session.getAttribute("AUTH_USER_ID");
	String UpdateNAME = (String)session.getAttribute("AUTH_USER_NAME");
	String UpdateSSN = (String)session.getAttribute("AUTH_USER_SSN");
	String UpdateEMAIL = (String)session.getAttribute("AUTH_USER_EMAIL");
	String UpdateNICKNAME = (String)session.getAttribute("AUTH_USER_UPDATENICKNAME");
	String UpdateTEL = (String)session.getAttribute("AUTH_USER_UPDATETEL");
	String UpdateGENDER = (String)session.getAttribute("AUTH_USER_GENDER");
	String UpdateSNS = (String)session.getAttribute("AUTH_USER_SNS");
%>
	<form action="/UpdateMemberHandler.do" name="updateForm" id="updateForm" method="post">

		아이디 :<input type="text" value="<%= UpdateID%>"  style="border:none" readonly/></br>
		비밀번호 :
				<input type="button" value="변경" onclick="location.href='/views/screens/passwordChange.jsp'"/><br/>
		이름 :<input type="text" value="<%= UpdateNAME%>"  style="border:none" readonly/></br>
		생년월일 :<input type="text" value="<%= UpdateSSN%>"  style="border:none" readonly/></br>
		E_mail :<input type="text" value="<%= UpdateEMAIL%>"  style="border:none" readonly/></br>
		닉네임 :<input type="text" value="<%= UpdateNICKNAME%>"  style="border:none" readonly/></br>
		TEL :<input type="text" value="<%= UpdateTEL%>" name="updateTel" id="updateTel" style="border:none" size=10 readonly/>
		<input type="button" value="변경" onclick="updateTEL()"/><br/>
				<script>
				function updateTEL(){
						  var url = "/views/screens/updateTEL.jsp"
						  		window.open(url,"_blank_1","width=500,height=300, toolbar=no,menubar=no,resizble=no,scrollbars=yes")
				}
				</script>
		성별 :<input type="text" value="<%= UpdateGENDER%>"  style="border:none" readonly/></br>
		SNS 수신여부 :<input type="text" value=" <%= UpdateSNS%>" size=3 style="border:none" readonly/>
	<% if(UpdateSNS == null){
		System.out.println("널로옴");
	}
	
	if(UpdateSNS.equals("동의")){%>
			<form action="<%=request.getContextPath() %>/UpdateMemberHandler.do" method = "post" name="UpdateSnsForm">
				<input type="radio" name="updateSnsYN" id="updateSnsY" value="Y" checked="checked"/>동의
				<input type="radio" name="updateSnsYN" id="updateSnsN" value="N" required="required"/>거절
				<input type="submit" value="변경"/><br/>
			</form>
	<%} else {%>		
			<form action="<%=request.getContextPath() %>/UpdateMemberHandler.do" method = "post" name="UpdateSnsForm">
				<input type="radio" name="updateSnsYN" id="updateSnsY" value="Y" required="required"/>동의
				<input type="radio" name="updateSnsYN" id="updateSnsN" value="N" checked="checked"/>거절
				<input type="submit" value="변경"/><br/>
			</form>	
				<%}%>
			<br/>
			<form action="/views/screens/identify.jsp" method="post" name= "deleteSubmit" id="deleteSubmit">
			<input type="hidden" value="delete" name="Value"/>
			<input type= "button" value="홈으로" onclick="location.href='/views/screens/testView.jsp'"/>
			<input type="submit" value="탈퇴"/>
			</form>
			
	</form>
</div>
</html>