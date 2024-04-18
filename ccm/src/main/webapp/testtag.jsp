<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script> 
document.addEventListener("DOMContentLoaded", function() {
    var dropdownItems = document.querySelectorAll("#fruitList .dropdown-item");
    
    dropdownItems.forEach(function(item) {
        item.addEventListener("click", function(event) {
            event.preventDefault();
            
            // 모든 항목의 활성화 클래스를 제거
            dropdownItems.forEach(function(item) {
                item.classList.remove("active");
            });
            
            // 클릭된 항목에 활성화 클래스 추가
            item.classList.add("active");
            
            // 선택된 항목의 data-value 값을 가져옴
            var selectedValue = item.getAttribute("data-value");
            console.log("선택된 값:", selectedValue);
            
            // AJAX 요청
            fetch('/your-servlet-url', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ 'selectedValue': selectedValue })
            })
            .then(response => response.json())
            .then(data => {
                // 서버에서 반환된 데이터 처리
                console.log(data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    });
});
</script>

</head>
<body>
<div class="dropdown">
    <button id="milkButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        우유 종류
    </button>
    <div id="fruitList" class="dropdown-menu">
     <a class="dropdown-item" id="nomilk" href="#" data-value="noMilk">우유 변경 없음</a>
<a class="dropdown-item" href="#" data-value="저지방우유">저지방 우유</a>
<a class="dropdown-item" href="#" data-value="아몬드브리즈">아몬드 브리즈</a>
<a class="dropdown-item" href="#" data-value="오토믹스">오트 믹스</a>
<a class="dropdown-item" href="#" data-value="두유">두유</a>
<a class="dropdown-item" href="#" data-value="코코넛밀크">코코넛 우유</a>
    </div>
</div>
<div class="dropdown">
    <button id="syrupButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        시럽 종류
    </button>
    <div id="syrupList" class="dropdown-menu">
        <a class="dropdown-item" href="#" data-value="noSyrup">시럽 추가 없음</a>
        <a class="dropdown-item" href="#" data-value="바닐라시럽">바닐라 시럽</a>
        <a class="dropdown-item" href="#" data-value="카라멜시럽">카라멜 시럽</a>
        <a class="dropdown-item" href="#" data-value="헤이즐넛시럽">헤이즐넛 시럽</a>
        <a class="dropdown-item" href="#" data-value="모카시럽">모카 시럽</a>
        <a class="dropdown-item" href="#" data-value="시나몬시럽">시나몬 시럽</a>
        <a class="dropdown-item" href="#" data-value="메이플시럽">메이플 시럽</a>
    </div>
</div>
<div class="dropdown">
    <button id="toppingButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        토핑 종류
    </button>
    <div id="toppingList" class="dropdown-menu">
        <a class="dropdown-item" href="#" data-value="noTopping">토핑 추가 없음</a>
        <a class="dropdown-item" href="#" data-value="휘핑크림">휘핑 크림</a>
        <a class="dropdown-item" href="#" data-value="초콜릿토핑">초콜릿 토핑</a>
        <a class="dropdown-item" href="#" data-value="카라멜드리즐">카라멜 드리즐</a>
        <a class="dropdown-item" href="#" data-value="마시멜로">마시멜로</a>
        <a class="dropdown-item" href="#" data-value="코코아파우더">코코아 파우더</a>
        <a class="dropdown-item" href="#" data-value="쿠키크럼블">쿠키 크럼블</a>
        <a class="dropdown-item" href="#" data-value="펄">펄</a>
    </div>
</div>

<div class="dropdown">
    <button id="decafButton" class="dropdown-toggle" type="button" data-toggle="dropdown">
        디카페인 종류
    </button>
    <div id="decafList" class="dropdown-menu">
        <a class="dropdown-item" href="#" data-value="일반">일반</a>
        <a class="dropdown-item" href="#" data-value="디카페인">디카페인</a>
    </div>
</div>
</body>
</html>