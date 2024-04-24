<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/custom.css">
<link rel="stylesheet" href="/resources/css/common.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"> var allcount = ${allcount}; </script>

<meta charset="UTF-8">
<title>커스텀레시피</title>

</head>
<body>
	
	<span class="wrapper" style="display: inline-block;">
		<!-- 헤더 -->
		<%@ include file="/views/components/header.jsp" %>
		<!-- 섹션 시작 -->
		<section class="container">
			<div class="section_col_1-to-4_row_1">
				<span>
					<button id="test" class="button_home" type="button" onclick="location.href='/views/screens/testView.jsp'">Home</button>
				</span>
				
				<span>
					<button id="edit" class="button_add" type="button" onclick="showCustomViewModal('/views/screens/CustomBoardAdd.jsp')">Add</button>
				</span>
				<span>
					<input type="text" id="searchInput" placeholder="    Search">
					<span id="searchResult"></span>
				</span>
			</div>
			
			
			<div class="section_col_2-to-3_row_2">	
				<span class="divdropdown">
					<button id="shotButton" class="dropdown" type="button" data-toggle="dropdown">
						샷추가
			    	</button>
			    <div class="dropdown-options">
					<ul>
						<li id="null" data-value="샷추가">샷추가</li>
			            <li id="1" data-value="1샷추가">1샷추가</li>
			            <li id="2" data-value="2샷추가">2샷추가</li>
			            <li id="3" data-value="3샷추가">3샷추가</li>
			            <li id="4" data-value="4샷추가">4샷추가</li>
			        </ul>
			    </div>
			</span>
		

			<span class="divdropdown">
				<button id="milkButton" class="dropdown" type="button" data-toggle="dropdown">
					우유 종류
			    </button>
			    <div class="dropdown-options">
					<ul>
						<li id="null" data-value="우유종류">우유종류</li>
			            <li id="저지방우유" data-value="저지방우유">저지방 우유</li>
			            <li id="아몬드브리즈" data-value="아몬드브리즈">아몬드 브리즈</li>
			            <li id="오토믹스" data-value="오토믹스">오트 믹스</li>
			            <li id="두유" data-value="두유">두유</li>
			            <li id="코코넛밀크" data-value="코코넛밀크">코코넛 우유</li>
			        </ul>
			    </div>
			</span>
		

			<span class="divdropdown">
				<button id="syrupButton" class="dropdown" type="button" data-toggle="dropdown">
					시럽 추가
			    </button>
			    <div class="dropdown-options">
					<ul>
						<li id="null" data-value="시럽 종류">시럽 종류</li>
			            <li id="바닐라시럽" data-value="바닐라시럽">바닐라 시럽</li>
			            <li id="카라멜시럽" data-value="카라멜시럽">카라멜 시럽</li>
			            <li id="헤이즐넛시럽" data-value="헤이즐넛시럽">헤이즐넛 시럽</li>
			            <li id="모카시럽" data-value="모카시럽">모카 시럽</li>
			            <li id="시나몬시럽" data-value="시나몬시럽">시나몬 시럽</li>
			            <li id="메이플시럽" data-value="메이플시럽">메이플 시럽</li>
			        </ul>
			    </div>
			</span>
		

			<span class="divdropdown">

				<button id="toppingButton" class="dropdown" type="button" data-toggle="dropdown">
					토핑 추가
			    </button>
			    <div class="dropdown-options">
					<ul>
						<li id="null" data-value="토핑종류">토핑 종류</li>
			            <li id="휘핑크림" data-value="휘핑크림">휘핑 크림</li>
			            <li id="초콜릿토핑" data-value="초콜릿토핑">초콜릿 토핑</li>
			            <li id="카라멜드리즐" data-value="카라멜드리즐">카라멜 드리즐</li>
			            <li id="마시멜로" data-value="마시멜로">마시멜로</li>
			            <li id="코코아파우더" data-value="코코아파우더">코코아 파우더</li>
			            <li id="쿠키크럼블" data-value="쿠키크럼블">쿠키 크럼블</li>
			            <li id="펄" data-value="펄">펄</li>
			        </ul>
			    </div>
			</span>
		
			<span class="divdropdown">
			    <button id="decafButton" class="dropdown" type="button" data-toggle="dropdown">
					디카페인 종류
			    </button>
			    <div class="dropdown-options">
					<ul>
						<li id="일반" data-value="일반">일반</li>
			            <li id="디카페인" data-value="디카페인">디카페인</li>
			        </ul>
			    </div>
			</span>
		</div>
		
		<!--게시글 가져오기 -->
		<div class="section_col_1-to-4_row_3">
			<span id="board" class="cus-box"></span>
		</div>
		
	</section>
	<div id="modal" class="add-modal-container">
	    <button onclick="closeModal()">닫기</button>
	    <div class="add-modal-content" id="add-modal-content">
	    </div>
	</div>
	
</span>
</body>
<script type="text/javascript" src="/resources/js/custom.js"></script>
</html>