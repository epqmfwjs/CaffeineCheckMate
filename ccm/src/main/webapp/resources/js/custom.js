var curPage = 1;


//검색코드
$(document).ready(function(){
   list(allcount);
   
    $('#searchInput').keypress(function(event) {
        if (event.which === 13) { 
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
   
$(document).ready(function(){
    $("#searchInput").focus(function(){
        $(this).removeAttr('placeholder');
    });

    $("#searchInput").blur(function(){
        $(this).attr('placeholder', 'Search');
    });
});

/*$(document).ready(function() {
    $.ajax({
        url: "/getRealImagePath", // 실제 이미지 경로를 반환하는 서블릿 URL
        type: "GET",
        data: {
            imgName: "${param.img}" // 이미지 파일 이름을 전달
        },
        dataType: "json",
        success: function(data) {
            var realImagePath = data.realImagePath; // 서버에서 받아온 실제 이미지 경로
            $("#preview").attr("src", realImagePath); // 이미지 경로를 업데이트
            console.log(realImagePath);
        },
        error: function() {
            alert("이미지 경로를 가져오는데 실패했습니다.");
        }
    });
});
*/
function previewImage() {
    var fileInput = document.getElementById('file');
    var preview = document.getElementById('preview');

    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();
 
        reader.onload = function (e) {
            preview.src = e.target.result;
        }

        reader.readAsDataURL(fileInput.files[0]);
    }
}
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
   


function formatDate(dateString) {
    let date = new Date(dateString);
    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더해줍니다.
    let day = String(date.getDate()).padStart(2, '0');

    return `${year}-${month}-${day}`;
}

//글내용 길이제한
function cutString(inputString){
   if(inputString.length>10){
    return inputString.slice(0, 7) + '...';
   }
   else{
      return inputString;
   }
   
}

function searchlist(data){
    var list = data.list;
   
    list.forEach(function(item) {
        let cus_num = item.cus_num;
        let m_id = item.m_id;
        let c_no = item.c_no;
        let cus_name = item.cus_name;
        let cus_content = cutString(item.cus_content);
        let cus_regdate = formatDate(item.cus_regdate); // 날짜 형식 변경
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

const cusBox = document.querySelector(".cus-box");
console.log(cusBox);
function scroller() {
	console.log("scroll event");
	// 스크롤 위치, 창의 높이, 문서 전체의 높이 계산
	var scrollTop = cusBox.scrollTop; // 위로 스크롤된 길이
	var windowHeight = cusBox.clientHeight; // 웹 브라우저 창의 높이
	var documentHeight = cusBox.scrollHeight; // 문서 전체의 높이
	
	// 문서 맨 아래에 도달했는지 확인
	var isBottom = scrollTop + windowHeight +10 >= documentHeight;
	
	if (isBottom) {
		console.log("scroll");
		if (allcount <= 0) {
			return false; // 함수 종료
		} else {
			list(allcount - 8); // 추가로 받을 리스트 ajax 처리
			allcount -= 8; // allcount 감소
		}
	}
}
cusBox.addEventListener("scroll", scroller);
// $(cusBox).on("scroll", function() {
//    var scrollTop = $(window).scrollTop(); // 위로 스크롤된 길이
//    var windowsHeight = $(window).height(); //웹브라우저의 창의 높이
//    var documentHeight = $(document).height(); // 문서 전체의 높이
//    var isBottom = scrollTop + windowsHeight + 1 >= documentHeight;
   
//    if (isBottom) {
//       //만일 현재 마지막 페이지라면
//       if (allcount <= 0) {
//          return false; //함수종료
//       } else {
//          list(allcount-8); //추가로 받을 리스트 ajax처리
//          allcount -= 8 ;
//       }
//    }
// });

   
   
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
                let cus_content = cutString(item.cus_content);
                 let cus_regdate = formatDate(item.cus_regdate);
                 let cus_img_realname = item.cus_img_realname;
                 
                 
                 let boardItem = `
                 <li>
                    <a href="CustomBoardViewHandler.do?CUS_NUM=`+cus_num+`">
                    <div>
                        <img src="upload/` + cus_img_realname + `" alt="Image">
                        <div class="boardTextBox">
                        <span class="boardTextLeft"><b>` + m_id + '</b></span> &nbsp; &nbsp; <span class="boardTextRight">' + cus_regdate + `</span><br/>
                        <span class="boardTextLeft"><b>` + cus_name + `</b></span><br/>
                        <span class="boardTextLeft">` + cus_content + `</span>
                        </div>
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