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
<h1>회원가입</h1>
	<form action="<%=request.getContextPath() %>/JoinMemberHandler.do" name=joinForm method = "post" onsubmit="return validateForm()">
		<td>아이디</td>
		<br/><td>
				<input type="text" name="joinId" id="joinId" placeholder="아이디" size=10 />
				<input type="button" value="중복체크" onclick="return checkId()"/><br/>
			</td>
				  <script>
				  var idChecked = false;
				  var nickChecked = false;
				  
				  function checkId(){
					  if(document.joinForm.joinId.value==""){
						  alert("아이디를 입력해주세요");
						  document.joinForm.joinId.focus();
						  return false;
					  }
					  var url = "CheckHandler.do?joinId=" + document.joinForm.joinId.value;		
					  window.open(url,"_blank_1","width=500,height=300, toolbar=no,menubar=no,resizble=no,scrollbars=yes")

				  }
				  function setIdValue(id, isUnique) {
					    if (isUnique) {
					        document.joinForm.joinId.value = id;
					        // 중복 확인 완료 플래그 설정
					        window.idChecked = true;
					    }
					}
				  </script>
				  
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
					<script>
					// 출생 연도 셀렉트 박스 option 목록 동적 생성
					const birthYearEl = document.querySelector('#birth-year');
					const birthMonthEl = document.querySelector('#birth-month');
					const birthDayEl = document.querySelector('#birth-day');

					// option 목록 생성 여부 확인
					let isYearOptionExisted = false;
					let isMonthOptionExisted = false;
					let isDayOptionExisted = false;

					birthYearEl.addEventListener('focus', function () {
					  // year 목록 생성되지 않았을 때 (최초 클릭 시)
					  if (!isYearOptionExisted) {
					    isYearOptionExisted = true;
					    for (let i = 1940; i <= 2022; i++) {
					      // option element 생성
					      const yearOption = document.createElement('option');
					      yearOption.setAttribute('value', i);
					      yearOption.innerText = i;
					      // birthYearEl의 자식 요소로 추가
					      this.appendChild(yearOption);
					    }
					  }
					});

					birthMonthEl.addEventListener('focus', function () {
					  // month 목록 생성되지 않았을 때 (최초 클릭 시)
					  if (!isMonthOptionExisted) {
					    isMonthOptionExisted = true;
					    for (let i = 1; i <= 12; i++) {
					      // option element 생성
					      const monthOption = document.createElement('option');
					      monthOption.setAttribute('value', i);
					      monthOption.innerText = i;
					      // birthMonthEl의 자식 요소로 추가
					      this.appendChild(monthOption);
					    }
					  }
					});
					birthDayEl.addEventListener('focus', function () {
					  // day 목록 생성되지 않았을 때 (최초 클릭 시)
					  if (!isDayOptionExisted) {
					    isDayOptionExisted = true;
					    for (let i = 1; i <= 31; i++) {
					      // option element 생성
					      const dayOption = document.createElement('option');
					      dayOption.setAttribute('value', i);
					      dayOption.innerText = i;
					      // birthDayEl의 자식 요소로 추가
					      this.appendChild(dayOption);
					    }
					  }
					});
					</script>
				<br/>
		E-MAIL<br/><input type="text" name="joinEmail1" id="joinEmail" size=10 required="required"/> @
					<input name="joinEmail2" id="domain-txt" type="text" size=10 />
						<select name="joinEmail2" id="domain-list">
						  <option value="type">직접 입력</option>
						  <option value="naver.com">naver.com</option>
						  <option value="google.com">google.com</option>
						  <option value="hanmail.net">hanmail.net</option>
						  <option value="nate.com">nate.com</option>
						  <option value="kakao.com">kakao.com</option>
						</select>
							<script>
								// select 옵션 변경 시
								const domainListEl = document.querySelector('#domain-list')
								const domainInputEl = document.querySelector('#domain-txt')
								domainListEl.addEventListener('change', (event) => {
								  // option에 있는 도메인 선택 시
								  if(event.target.value !== "type") {
								    // 선택한 도메인을 input에 입력하고 disabled
								    domainInputEl.value = event.target.value
								    domainInputEl.disabled = true
								  } else { // 직접 입력 시
								    // input 내용 초기화 & 입력 가능하도록 변경
								    domainInputEl.value = ""
								    domainInputEl.disabled = false
								  }
								})
							</script>
							<input type="button" value="이메일인증"/><br/>
		<br/>
		닉네임<br/><input type="text" name="joinNick" id="joinNick" placeholder="닉네임" size=10 maxlength=10 minlength=2 required="required"/>
					<input type="button" value="중복체크" onclick="return checkNick()"/><br/>
				<script>
				  function checkNick(){
					  if(document.joinForm.joinNick.value==""){
						  alert("닉네임을 입력해주세요");
						  document.joinForm.joinNick.focus();
						  return false;
					  }
					  	    var url = "CheckHandler.do?joinNick=" + encodeURIComponent(document.joinForm.joinNick.value);
					  	    window.open(url,"_blank","width=500,height=300,toolbar=no,menubar=no,resizable=no,scrollbars=yes");
				  }
				  function setNickValue(nickValue, isUnique) {
					    if (isUnique) {
					        document.joinForm.joinNick.value = nickValue;
					        // 중복 확인 완료 플래그 설정
					        window.nickChecked = true;
					    }
					}
				  </script>
		전화번호<br/><input type="text" class="tel" name="joinTel1" id="joinTel1" placeholder="010" maxlength=3  minlength=3 size=3 required="required"/>-
				<input type="text" name="joinTel2" id="joinTel2" placeholder="0000" maxlength=4  minlength=4 size=4 required="required"/>-
				<input type="text" name="joinTel3" id="joinTel3" placeholder="0000" maxlength=4  minlength=4 size=4 required="required"/><br/>
		성별
			<br/>
				<input type="radio" name="joinMW" id="joinM" value="M" checked="checked"/>남성
				<input type="radio" name="joinMW" id="joinW" value="W" required="required"/>여성
			<br/>
		sns수신여부
			<br/>  
				<input type="radio" name="joinSnsYN" id="joinSnsY" value="Y" checked="checked"/>동의함
				<input type="radio" name="joinSnsYN" id="joinSnsN" value="N" required="required"/>동의안함
			<br/>

		 		<br/>	<input type="submit" value="가입"/>
		 	<script>	
		 		function validateForm() {
				    if (!idChecked || !nickChecked) {
				        alert("아이디와 닉네임 중복체크를 모두 완료해주세요.");
				        return false;
				    }
				    return true;
				}
			</script>
	<input type="button"  onclick="location.href='/views/screens/login.jsp'" value="취소"/>
			</form>
		</div>
</body>
</html>