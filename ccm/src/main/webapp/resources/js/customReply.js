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
	        success : function(data){
	            if(data > 0){
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
            success: function(data) { //현재 if문까지 가지 않음
                if (data > 0) {
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
            success: function(data) {
                if (data > 0) {
                    cusReplyList(2);
                }else{
                	alert("삭제를 실패했습니다.");
                }
            }
        });
    }