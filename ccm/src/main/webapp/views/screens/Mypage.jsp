<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Mypage</title>
	<!-- 글씨체 추가 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- css연결 -->
	<link rel="stylesheet" href="resources/css/common.css" />
	<link rel="stylesheet" href="resources/css/custom.css" />
	<link rel="stylesheet" href="resources/css/mypage.css" />
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- fullcalender -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!--fullcalendar 언어 설정관련 script -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
</head>
	<body>
	    <div class="wrapper" style="display: inline-block;">
			<!-- 헤더 -->
			<%@ include file="/views/components/header.jsp" %>
			<!-- 첫번째줄(프로필+캘린더) div -->
			<div class="mypageh2">
				<h2 class="mypageh2">MYPAGE</h2>
				<hr>
			</div>
	    	<div class="container">
            	<div class="item">
	                <div class="tonari">
	                    <div class="hr-sect">내 프로필</div>
	                    <form action="EditMyProfile.do">
	                        <a href="/editMyProfilePageMove.do" class="btn btn-primary mb-3">프로필 &nbsp수정</a>
	                    </form>
	                    &nbsp
	                    <form action="<%=request.getContextPath() %>/views/screens/identify.jsp">
							<input type="hidden" value="edit" name="Value"/>
							<input type="submit" value="정보수정"/>
						</form>
	                </div>
                	<div>
                    	<!--이미지 div-->
                    	<div>
                        	<c:choose>
                            <c:when test="${not empty mypages.userProfileDTO.p_IMG_COPY}">
                                   <img id="profileimg" width="300" src="/resources/profile/${mypages.userProfileDTO.p_IMG_COPY}">
                             </c:when>
                             <c:otherwise>
                                   <td>등록된 프로필 이미지가 없습니다.</td>
                             </c:otherwise>
                           </c:choose>
                    	</div>
                    	&nbsp&nbsp
	                    <!-- 닉네임, 아이디 -->
	                    <div class="profilebox">
                   			<c:choose>
                           		<c:when test="${empty mypages}">
                              		<b>등록된 회원이 없습니다.</b>
                            	</c:when>
                            	<c:otherwise>
                              		<p>아이디 : ${mypages.userProfileDTO.m_ID}</p>
                                 	<p>닉네임 : ${mypages.userProfileDTO.m_NICKNAME}</p>
                                 	<p>몸무게 : ${mypages.userProfileDTO.p_WEIGHT}</p>
                                 	
                            	</c:otherwise>
                    		</c:choose>
                    	</div>
                	</div>
            	</div>
	            <div class="item">
	                <div class="hr-sect">카페인 섭취 달력</div>
	                <div class="table-responsive">
	                    <div id="calendar"></div>
	                </div>
	            </div>
	            <div class="item">
	                <div class="hr-sect">내가 작성한 레시피</div>
	                <!--전체 상자-->
	                <div class="boxlist">
	                    <div class="box">
	                        <c:choose>
		                        <c:when test="${empty mypages}">
                               		<b>작성한 글이 없습니다.</b>
		                        </c:when>
		                        <c:otherwise>
	                                <!--custom.css에서 가져온 class-->
                          			<span id="board" class="cus-box">
	                                    <c:forEach var="myrecipe" items="${mypages.myRecipeDTO}">
			                                <div class="boardCard">
			                                	<a href="CustomBoardViewHandler.do?CUS_NUM=${myrecipe.CUS_NO}">
	                                            	<img class=".cus_img" src="upload/${myrecipe.CUS_IMG_COPY}"alt="Image">
	                                              	<div class="cardTextBox">
							                           	<p>&nbsp;&nbsp;📌 ${myrecipe.CUS_TITLE}<br/><br/></p>
							                           	<p>&nbsp;&nbsp;📆 ${myrecipe.CUS_REGDATE}<br/><br/></p>
							                           	<p>&nbsp;&nbsp;👍 ${myrecipe.CUS_SUMGOOD}<br/><br/></p>
							                           	
							                        </div>
	                                            </a>
	                                		</div>
	                                    </c:forEach>
                              		</span>
		                        </c:otherwise>
		                    </c:choose>
	                    </div>
	                </div>
	            </div>
	            <div class="item">
	                <div class="hr-sect">즐겨찾기 목록</div>
	                <!--전체 상자-->
	                <div class="boxlist">
	                    <div class="box">
	                        <c:choose>
		                        <c:when test="${empty mypages}">
		                             등록된 즐겨찾기목록이 없습니다.
		                        </c:when>
		                        <c:otherwise>
	                            	<div class="fav-area">
										<!--즐겨찾기 include 부분-->
										<jsp:include page="/views/components/favorites.jsp"></jsp:include>
									</div>
		                        </c:otherwise>
		                    </c:choose>
	                    </div>
	                </div>
	            </div>
        	</div>
	       	<!-- 홈으로 돌아가기 -->
	       	<a href="/main.do" class="btn btn-primary" >GO TO TESTVIEW</a>
		    <!-- 부트스트랩 자바스크립트 추가 -->
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
			<script>
				const isAuth = "${isAuth}"==="true"? true : false;
				<!--풀카렌더 셋팅-->
				document.addEventListener('DOMContentLoaded', function() {
			        var calendarEl = document.getElementById('calendar');
			        var calendar = new FullCalendar.Calendar(calendarEl, {
			            initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			            headerToolbar : { // 헤더에 표시할 툴 바
			                start : 'prev next today',
			                center : 'title',
			                end : 'dayGridMonth,dayGridWeek,dayGridDay'
			            },
			            titleFormat : function(date) {
			                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			            },
			        
			            //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			            selectable : true, // 달력 일자 드래그 설정가능
			            droppable : true,
			            editable : true,
			            nowIndicator: true, // 현재 시간 마크
			            locale: 'ko', // 한국어 설정
			            events: [
			            	//핸들러에서 담은 healthList Dto를 jstl문법으로 {} 영역을 출력한다.
			                <c:forEach var="healthlight" items="${mypages.healthLightDTO}">
			                    {
			                        color: '${healthlight.CAL_COLOR}',
			                        title: '${healthlight.CAL_DAILYCF}',
			                        start: '${healthlight.CAL_DATE}',
			                        end: '${healthlight.CAL_DATE}',
			                        rendering : "background"
			                        //backgroundColor:'${healthlight.CAL_COLOR}' 일정색
			                    },
			                </c:forEach>
			            ] 
			        });
			        calendar.render();
			    });        
				const hasCoffees = false;
			</script>
			<script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
			<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script> 
			<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script> 
			<script src="/resources/js/favoritelist.js" type="text/babel"></script>
		</div>
	</body>
</html>