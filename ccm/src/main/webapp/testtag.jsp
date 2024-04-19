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
/*   display: block; */
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


<script>

$(document).ready(function(){
        $(".dropdown").click(function(){
            $(this).next(".dropdown-options").slideToggle();
        });

        $(".dropdown-options li").click(function(){
        	 let selectedValue = $(this).attr("id");
             let selectedText = $(this).text();
             
             $(this).closest(".divdropdown").find(".dropdown").text(selectedText);
             $(this).closest(".dropdown-options").slideToggle();
             
             console.log("선택된 값:", selectedValue);
             console.log("선택된 텍스트:", selectedText);
         });
     });
</script>
</head>
<body>
<div class="divdropdown">
  <button class="dropdown">Profile</button>
  <div class="dropdown-options">
  <ul>
    <li  id="1" value="1">1</li>
    <li  id="2" value="2">2</li>
    <li  id="3" value="3">3</li>
   </ul>
  </div>
</div>

<div class="divdropdown">
    <button  class="dropdown" >
        우유 종류
    </button>
    <div class="dropdown-options">
        <ul>
            <li id="nomilk" data-value="noMilk">우유 변경 없음</li>
            <li data-value="저지방우유">저지방 우유</li>
            <li data-value="아몬드브리즈">아몬드 브리즈</li>
            <li data-value="오토믹스">오트 믹스</li>
            <li data-value="두유">두유</li>
            <li data-value="코코넛밀크">코코넛 우유</li>
        </ul>
    </div>
</div>

<div class="divdropdown">
  <button class="dropdown">Profile</button>
  <div class="dropdown-options">
  <ul>
    <li  id="가" value="가">가</li>
    <li  id="나" value="나">나</li>
    <li  id="다" value="다">다</li>
   </ul>
  </div>
</div>
</body>
</html>