<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!--댓글 입력-->
	<div align="center">
	    <table style="width: 500px;">
	        <tr>
	            <td rowspan="2" style="vertical-align: middle; text-align: center;">
	                <!--프로필 사진-->
	                <div class="box" style="background: white;">
	                    <img class="profile" src="<%=request.getContextPath()%>/resources/imgs/profile.png" style="width: 40px; height: 40px; vertical-align: middle;">
	                </div>
	            </td>
	        </tr>
	        <tr>
	            <td style="width: 80%;">
	                <div class="relpyForm">
	                    <label for="reply"></label> 
	                    <input type="text" class="form-control" id="reply"  name="reply" placeholder="댓글을 입력하세요." style="width: 350px; height: 30px;">
	                </div>
	            </td>
	            <td><button class="btn" onclick="insertReply();" style="width: 80px;  height: 30px;">게시하기</button></td>
	        </tr>
	    </table>
	</div>

	<br/>
	

	<!-- 수정 모달 -->
	<div id="editModal" class="modal" align="center" style="display: none;">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <input id="editedReply" class="form-control" style="width: 350px; height: 30px;">
	        <button id="saveBtn" class="btn" onclick="saveEditedReply();" style="width: 80px; height: 30px;">수정저장</button>
	    </div>
	</div>
		
	
	<!--댓글 조회-->
	<div id="replyList" align="center">
		<!--각 댓글 영역 -->
		<div class=align="center">
			<table style="width: 500px;">
				<tbody class="replyArea" id="replyArea">

				</tbody>
			</table>
		</div>
	</div>
	

	
<!-- ----------------------------스크립트------------------------------ -->

	<script>
	/*자동 함수 호출*/
	var autoRefresh;
	$(function(){
	    var cus_no = 2; //임시 지정
	    autoRefresh = setInterval(function() {
	        cusReplyList(cus_no);
	    }, 1000);
	})

	
	/*댓글 조회 */
	function cusReplyList(cus_no) {
	    $.ajax({
	        url: "/CusReplyListHandler",
	        contentType: "application/json",
	        type: "POST",
	        dataType: "json",
	        data: {
	            cus_no: cus_no
	        },
	        success: function(data) {
	            $("#replyArea").empty();
	            
	            var cus_re_list = data.cus_re_list;
	            cus_re_list.forEach(function(item) {
	                let m_id = item.m_id;
	                let cus_no = item.cus_no;
	                let cus_re_no = item.cus_re_no;
	                let cus_re_regdate = item.cus_re_regdate;
	                let cus_re_content = item.cus_re_content;

	                let replyItem =
	                    '<br>' +   
	                    '<br>' +
	                    '<tr class="reply-deatil-content">' +
	                    '<td><b>' + m_id + '&nbsp;&nbsp;&nbsp;</b></td>' +  
	                    '<td colspan="3">' + cus_re_content  + '</td>' +
	                    '</tr>' +
	                    '<br>' +
	                    '<tr>' +
	                    '<td>' + cus_re_regdate + '&nbsp; &nbsp; &nbsp;</td>' +
	                    '<td><button onclick="updateReply(' + cus_re_no + ')" style="display: ' + (m_id === "user2" ? 'inline-block' : 'none') + '">수정</button></td>' + // 이 부분 수정
	                    '<td><button onclick="deleteReply(' + cus_re_no + ')" style="display: ' + (m_id === "user2" ? 'inline-block' : 'none') + '">삭제</button></td>' +
	                    '</tr>' +
	                    '<br>';
	                $("#replyArea").append(replyItem);
	            });
	        },
	        error: function() {
	            alert("에러");
	        }
	    });
	}

	/*댓글 작성 */
	function insertReply(){
	    var replyContent = $("#reply").val();
	    var data = {
	        m_id: "user2", // 임시 지정
	        cus_no: 2, // 임시 지정
	        cus_re_content: replyContent
	    };
	    
	    $.ajax({
	        url : "/CusReplyAddHandler",
	        data : JSON.stringify(data), // 데이터를 JSON 문자열로 변환
	        contentType: "application/json",
	        type : "POST",
	        dataType: "json",
	        success : function(result){
	            if(result === "성공"){
	            	cusReplyList(cus_no);
	                $("#reply").val(""); // 입력 필드 비우기
	            }else{
                	alert("삭제를 실패했습니다.");
                }
	        }
	    });
	}
	
	
    /*수정 버튼 작동*/
    function updateReply(cus_re_no) {
        var editedContent = $("#replyArea").find("tr.reply-deatil-content[data-cus-re-no='" + cus_re_no + "']").find("td:nth-child(2)").text().trim();
        $("#editedReply").val(editedContent);
        $("#editModal").css("display", "block");
        $("#saveBtn").attr("data-cus-re-no", cus_re_no);
        
        clearInterval(autoRefresh); // 갱신 함수 중지
    }

	
    /*수정*/
    function saveEditedReply() {
        var cus_re_no = $("#saveBtn").attr("data-cus-re-no");
        var editedContent = $("#editModal input#editedReply").val();
        
        var data = {
            cus_re_content: editedContent,
            cus_re_no: cus_re_no
        };
        
        $.ajax({
            url: "/CusReplyUpdateHandler",
            data: JSON.stringify(data), // JSON 문자열로 변환하여 전송
            contentType: "application/json",
            type: "POST",
            dataType: "json",
            success: function(result) { //현재 if문까지 가지 않음
                if (result === "성공") {
                    cusReplyList(2); //임시 지정
                    $("#editModal").css("display", "none");
                    
                    autoRefresh = setInterval(function() {
                    	cusReplyList(cus_no);
                    }, 1000);
                } else {
                    alert("업데이트에 실패했습니다.");
                }
            },
            complete: function() {
                $("#editModal").css("display", "none"); // AJAX 요청 완료 후 모달 닫기
                autoRefresh = setInterval(function() {
                	cusReplyList(2); //임시 지정
                }, 1000);
            }
        });
    }
    
    
    /* 댓글 삭제 */
    function deleteReply(cus_re_no) {
        $.ajax({
            url: "/CusReplyDeleteHandler",
            data: {
                cus_re_no: cus_re_no
            },
            type: "POST",
            dataType: "json",
            success: function(result) {
                if (result > 0) {
                    cusReplyList(2);
                }else{
                	alert("삭제를 실패했습니다.");
                }
            }
        });
    }

	</script>

</body>
</html>
