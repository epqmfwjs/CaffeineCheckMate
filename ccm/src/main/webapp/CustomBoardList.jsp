<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
#board {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px; /* 아이템 간의 간격 */
    list-style-type: none; /* 리스트 스타일 제거 */
} 

#board li {
    text-align: center; /* 텍스트 중앙 정렬 */
}

#board img {
    max-width: 100%; /* 이미지 크기 조절 */
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
 <h3>커스텀레시피</h3>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

var curPage = 1;
var allcount = ${allcount};
var isLoading = false;

$(document).ready(function(){
	list(allcount);
	
	});
	
 $(window).on("scroll", function() {
	var scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
	var windowsHeight = $(window).height(); //웹브라우저의 창의 높이
	var documentHeight = $(document).height(); // 문서 전체의 높이
	var isBottom = scrollTop + windowsHeight + 10 >= documentHeight;
	
	if (isBottom) {
		//만일 현재 마지막 페이지라면
		if (allcount <= 0) {
			return false; //함수종료
		} else {
			list(allcount-8); //추가로 받을 리스트 ajax처리
			allcount -= 8 ;
		}
	}
});
	
function list(allcount){
	var page = 1;
	$.ajax({
		url:"CustomBoardJson.do",
		type:"get",
		data : {"allcount":allcount},
		dataType:"json",
		success:function(data){
			var list = data.list;
			
            list.forEach(function(item) {
            	let cus_num = item.cus_num;
                let m_no = item.m_no;
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
		error:function(){
			alert("에러");
			}
		
	});//ajax끝 			
} 
</script> 
</head>
<body>
<button type="button" onclick="location.href='/CustomBoardAdd.jsp'">글 작성</button>
<ul id="board"></ul>
</body>
</html>