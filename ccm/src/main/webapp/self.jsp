<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
div{
float: right;
}

.dropdown {
  display: inline-block;
  position: relative;
}

 button{
  border:none;
  border-radius:5px;
  padding:15px 30px;
  font-size:18px;
  cursor:pointer;
} 
 
button:hover{
  background-color:#ddd;
} 

.dropdown-options {
  display: none;
   position: absolute;
  overflow: auto;
  background-color:#fff;
  border-radius:5px;
  box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.4); 
}

 .dropdown:hover .dropdown-options {
   display: block; 
} 

.dropdown-options li {
  display: block;
  color: #000000;
  padding: 5px;
  text-decoration: none;
  padding:20px 40px;
}

.dropdown-options li:hover {
  color: #0a0a23;
  background-color: #ddd;
  border-radius:5px;
}
</style>


<!-- <script>

$(document).ready(function(){
		let shot = "추가없음";
		let milk = "nomilk";
		let syrup= "nosyrup";
		let topping = "notopping";
		let decaf = "decaf";
		
		 $(".dropdown").click(function(){
		        $(this).next(".dropdown-options").slideToggle();
		    });

		    $("#shotButton + .dropdown-options li").click(function(){
		        shot = $(this).attr("id");
	            let selectedText = $(this).text();
	            $("#shotButton").text(selectedText);
	            $("#shotButton").next(".dropdown-options").slideToggle();
		        console.log("선택된 샷:", shot);
		        sendData();
		    });
		    $("#milkButton + .dropdown-options li").click(function(){
		        milk = $(this).attr("id");
	            let selectedText = $(this).text();
	            $("#milkButton").text(selectedText);
	            $("#milkButton").next(".dropdown-options").slideToggle();
		        console.log("선택된 우유:", milk);
		        sendData();
		    });

		    $("#syrupButton +.dropdown-options li").click(function(){
		        syrup = $(this).attr("id");
		        $(this).closest(".divdropdown").find(".dropdown").text($(this).text());
		        $(this).closest(".dropdown-options").slideToggle();
		        console.log("선택된 시럽:", syrup);
		        sendData();
		    });

		    $("#toppingButton +.dropdown-options li").click(function(){
		        topping = $(this).attr("id");
		        $(this).closest(".divdropdown").find(".dropdown").text($(this).text());
		        $(this).closest(".dropdown-options").slideToggle();
		        console.log("선택된 토핑:", topping);
		        sendData();
		    });

		    $("#decafButton +.dropdown-options li").click(function(){
		        decaf = $(this).attr("id");
		        $(this).closest(".divdropdown").find(".dropdown").text($(this).text());
		        $(this).closest(".dropdown-options").slideToggle();
		        console.log("선택된 디카페인:", decaf);
		        sendData();
		    });

		    function sendData() {
		        $.ajax({
		            url: '/Jsontest.do',
		            type: 'get',
		            data: {
		            	"shot" : shot,
		                "milk": milk,
		                "syrup": syrup,
		                "topping": topping,
		                "decaf": decaf
		            },
		            datatype: "json",
		            success: function(data) {
		                // 성공 시 로직
		            },
		            error: function(error) {
		                // 에러 시 로직
		            }
		        });
		    }
		});
</script> -->
<script>
$(document).ready(function(){
	let shot = "추가없음";
	let milk = "nomilk";
	let syrup= "nosyrup";
	let topping = "notopping";
	let decaf = "decaf";
	
	 $(".dropdown").click(function(){
	        $(this).next(".dropdown-options").slideToggle();
	    });

	    $("#shotButton + .dropdown-options li").click(function(){
	        shot = $(this).attr("id");
            let selectedText = $(this).text();
            $("#shotButton").text(selectedText);
            $("#shotButton").next(".dropdown-options").slideToggle();
	        console.log("선택된 샷:", shot);
	        sendData();
	    });
	    $("#milkButton + .dropdown-options li").click(function(){
	        milk = $(this).attr("id");
            let selectedText = $(this).text();
            $("#milkButton").text(selectedText);
            $("#milkButton").next(".dropdown-options").slideToggle();
	        console.log("선택된 우유:", milk);
	        sendData();
	    });

	    $("#syrupButton +.dropdown-options li").click(function(){
	        syrup = $(this).attr("id");
	        $(this).closest(".divdropdown").find(".dropdown").text($(this).text());
	        $(this).closest(".dropdown-options").slideToggle();
	        console.log("선택된 시럽:", syrup);
	        sendData();
	    });

	    $("#toppingButton +.dropdown-options li").click(function(){
	        topping = $(this).attr("id");
	        $(this).closest(".divdropdown").find(".dropdown").text($(this).text());
	        $(this).closest(".dropdown-options").slideToggle();
	        console.log("선택된 토핑:", topping);
	        sendData();
	    });

	    $("#decafButton +.dropdown-options li").click(function(){
	        decaf = $(this).attr("id");
	        $(this).closest(".divdropdown").find(".dropdown").text($(this).text());
	        $(this).closest(".dropdown-options").slideToggle();
	        console.log("선택된 디카페인:", decaf);
	        sendData();
	    });

	    function sendData() {
	        $.ajax({
	            url: '/Jsontest.do',
	            type: 'get',
	            data: {
	            	"shot" : shot,
	                "milk": milk,
	                "syrup": syrup,
	                "topping": topping,
	                "decaf": decaf
	            },
	            datatype: "json",
	            success: function(data) {
	                var list = data.list;
		
        list.forEach(function(item) {
        	let cus_num = item.cus_num;
            let m_id = item.m_id;
            let c_no = item.c_no;
            let cus_name = item.cus_name;
            let cus_content = item.cus_content;
       		let cus_regdate = item.cus_regdate;
       		let cus_img_realname = item.cus_img_realname;
       		
       		
       		let boardItem = `
       		<li>
       			<a href="CustomBoardViewHandler.do?CUS_NUM=`+cus_num+`">
                <div>
                    <img src="upload/` + cus_img_realname + `" alt="Image">
                        <p>게시글번호: ` + cus_num + `</p>
                        <p>회원명: ` + m_id + `</p>
                    <p>제품아이디: ` + c_no + `</p>
                    <p>게시글제목: ` + cus_name + `</p>
                    <p>글내용: ` + cus_content + `</p>
                    <p>게시일: ` + cus_regdate + `</p>
                </div>
                </a>
               </li>
            `;
            
            $("#board").append(boardItem);
        });
	                
	            },
	            error: function(error) {
					console.log("에러발생");
	            }
	        });
	    }
	});
</script>

</head>
<body>

<div class="divdropdown">
    <button id="shotButton" class="dropdown" type="button" data-toggle="dropdown">
        샷추가
    </button>
    <div class="dropdown-options">
        <ul>
            <li id="nomilk" data-value="noshot">추가없음</li>
            <li id="샷추가" data-value="샷추가">샷추가</li>
            <li id="2샷추가" data-value="2샷추가">2샷추가</li>
            <li id="3샷추가" data-value="3샷추가">3샷추가</li>
            <li id="4샷추가" data-value="4샷추가">4샷추가</li>
        </ul>
    </div>
</div>

<div class="divdropdown">
    <button id="milkButton" class="dropdown" type="button" data-toggle="dropdown">
        우유 종류
    </button>
    <div class="dropdown-options">
        <ul>
            <li id="nomilk" data-value="noMilk">우유 변경 없음</li>
            <li id="저지방우유" data-value="저지방우유">저지방 우유</li>
            <li id="아몬드브리즈" data-value="아몬드브리즈">아몬드 브리즈</li>
            <li id="오토믹스" data-value="오토믹스">오트 믹스</li>
            <li id="두유" data-value="두유">두유</li>
            <li id="코코넛밀크" data-value="코코넛밀크">코코넛 우유</li>
        </ul>
    </div>
</div>

<div class="divdropdown">
    <button id="syrupButton" class="dropdown" type="button" data-toggle="dropdown">
        시럽 종류
    </button>
    <div class="dropdown-options">
        <ul>
            <li id="noSyrup" data-value="noSyrup">시럽 추가 없음</li>
            <li id="바닐라시럽" data-value="바닐라시럽">바닐라 시럽</li>
            <li id="카라멜시럽" data-value="카라멜시럽">카라멜 시럽</li>
            <li id="헤이즐넛시럽" data-value="헤이즐넛시럽">헤이즐넛 시럽</li>
            <li id="모카시럽" data-value="모카시럽">모카 시럽</li>
            <li id="시나몬시럽" data-value="시나몬시럽">시나몬 시럽</li>
            <li id="메이플시럽" data-value="메이플시럽">메이플 시럽</li>
        </ul>
    </div>
</div>

<div class="divdropdown">
    <button id="toppingButton" class="dropdown" type="button" data-toggle="dropdown">
        토핑 종류
    </button>
    <div class="dropdown-options">
        <ul>
            <li id="noTopping" data-value="noTopping">토핑 추가 없음</li>
            <li id="휘핑크림" data-value="휘핑크림">휘핑 크림</li>
            <li id="초콜릿토핑" data-value="초콜릿토핑">초콜릿 토핑</li>
            <li id="카라멜드리즐" data-value="카라멜드리즐">카라멜 드리즐</li>
            <li id="마시멜로" data-value="마시멜로">마시멜로</li>
            <li id="코코아파우더" data-value="코코아파우더">코코아 파우더</li>
            <li id="쿠키크럼블" data-value="쿠키크럼블">쿠키 크럼블</li>
            <li id="펄" data-value="펄">펄</li>
        </ul>
    </div>
</div>

<div class="divdropdown">
    <button id="decafButton" class="dropdown" type="button" data-toggle="dropdown">
        디카페인 종류
    </button>
    <div class="dropdown-options">
        <ul>
            <li id="일반" data-value="일반">일반</li>
            <li id="디카페인" data-value="디카페인">디카페인</li>
        </ul>
    </div>
</div>

<ul id="board"></ul>
</body>
</html>