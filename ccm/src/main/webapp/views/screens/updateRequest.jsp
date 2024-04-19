<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/updateRequest.css"rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
<h1>회원정보수정</h1>
<% 
	String UpdateID = (String)session.getAttribute("AUTH_USER_ID");
	String UpdateNAME = (String)session.getAttribute("AUTH_USER_NAME");
	String UpdateSSN = (String)session.getAttribute("AUTH_USER_SSN");
	String UpdateEMAIL = (String)session.getAttribute("AUTH_USER_EMAIL");
	String UpdateNICKNAME = (String)session.getAttribute("AUTH_USER_NICKNAME");
	String UpdateTEL = (String)session.getAttribute("AUTH_USER_TEL");
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
				<input type="hidden" value="UpdateSsn" name="Value">
				<input type="submit" value="변경"/><br/>
			</form>
	<%} else {%>		
			<form action="<%=request.getContextPath() %>/UpdateMemberHandler.do" method = "post" name="UpdateSnsForm">
				<input type="radio" name="updateSnsYN" id="updateSnsY" value="Y" required="required"/>동의
				<input type="radio" name="updateSnsYN" id="updateSnsN" value="N" checked="checked"/>거절
				<input type="hidden" value="UpdateSsn" name="Value">
				<input type="submit" value="변경"/><br/>
			</form>	
				<%}%>
			<br/>

			<form action="/views/screens/identify.jsp" method="post" name= "deleteSubmit" id="deleteSubmit">
				<input type="hidden" value="delete" name="Value"/>
				<div class="button-container">	
					<input type= "button" value="홈으로" onclick="location.href='/views/screens/testView.jsp'"/>
					<input type="submit" value="탈퇴"/>
				</div>
			</form>
	</form>
</div>
</html>