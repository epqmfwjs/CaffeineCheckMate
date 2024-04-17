var curPage = 1;
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
		url:"/CustomBoardJson.do",
		type:"get",
		data : {"allcount":allcount},
		dataType:"json",
		success:function(data){
			var list = data.list;
			
            list.forEach(function(item) {
            	let cus_num = item.cus_num;
                let m_no = item.m_no;
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
		error:function(){
			alert("에러");
			}
		
	});//ajax끝 			
}

$(document).ready(function(){
    // 포커스가 들어갔을 때
    $("#search").focus(function(){
        $(this).removeAttr('placeholder');
    });

    // 포커스가 나갔을 때
    $("#search").blur(function(){
        $(this).attr('placeholder', 'Search');
    });
});

$(document).ready(function(){
        $(".dropdown-toggle").click(function(){
            $(this).next(".dropdown-menu").slideToggle();
        });

        $(".dropdown-item").click(function(){
            let selectedFruit = $(this).data("value");
            $("#milkButton").text(selectedFruit);
            $(this).parent(".dropdown-menu").slideToggle();
            // 선택된 과일에 대한 추가 로직
            console.log("선택된 과일:", selectedFruit);
        });
    });


