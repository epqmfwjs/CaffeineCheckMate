var curPage = 1;


//검색코드
$(document).ready(function(){
	list(allcount);
	
	 $('#searchInput').keypress(function(event) {
        if (event.which === 13) { // Enter 키 코드
            var searchTerm = $('#searchInput').val();
			
            $.ajax({
                url: '/CustomBoardSearchJson.do',
                type: 'post',
               	data : {"searchTerm":searchTerm},
               	datatype : "json",
                success: function(data) {
					$("#board").empty();
                	searchlist(data);
                	
                	$(window).off("scroll");
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
        }
    });
	});
	
	

//태그버튼 이벤트발생
$(document).ready(function(){
		let shot = 'null';
		let milk = 'null';
		let syrup= 'null';
		let topping = 'null';
		let decaf = 'null';
		
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
			
		            $("#board").empty();
                	searchlist(data);      
                	$(window).off("scroll");
		            },
		            error: function(error) {
						console.log("에러발생");
		            }
		        });
		    }
		});
	
	
function searchlist(data){
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
            <a href="CustomBoardViewHandler.do?CUS_NUM=` + cus_num + `">
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
}
	
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
	$.ajax({
		url:"/CustomBoardJson.do",
		type:"get",
		data : {"allcount":allcount},
		dataType:"json",
		success:function(data){
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






    
    


