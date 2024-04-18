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
	$(function(){
		var cus_no = 2;
		setInterval(function() {
			cusReplyList(cus_no);
		}, 1000);
	})
	
	
	/*댓글 작성 */
	function insertReply(){
	    console.log("댓글 작성 함수가 실행되었습니다.");
	    var replyContent = $("#reply").val();
	    var data = {
	        m_id: "user2", // 임시 지정
	        cus_no: 2, // 임시 지정
	        cus_re_content: replyContent
	    };
	    
	    $.ajax({
	        url : "CusReplyJsonInsertHandler.do",
	        data : JSON.stringify(data), // 데이터를 JSON 문자열로 변환
	        contentType: 'application/json',
	        type : "POST",
	        success : function(result){
	            if(result>0){
	            	cusReplyList(cus_no);
	                $("#reply").val(""); // 입력 필드 비우기
	            }
	        },
	        error: function() {
	        	 alert("에러");
	        }
	    });
	}
	
	
     /*댓글 조회 */
	var page = 1;
	
	function cusReplyList(cus_no) {
	    $.ajax({
	        url: "/CusReplyJson.do",
	        contentType: 'application/json',
	        dataType: "json",
	        data: {
	            cus_no: cus_no //임시 지정
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
	                    '<td>' + m_id + '</td>' +  
	                    '<br>' +
	                    '<tr class="reply-deatil-content">' +
	                    '<td colspan="3"><b>' + cus_re_content  + '</b></td>' +
	                    '</tr>' +
	                    '<br>' +
	                    '<tr>' +
	                    '<td>' + cus_no + '</td>' +
	                    '<td>' + cus_re_no + '</td>' +
	                    '<td>' + cus_re_regdate + '</td>' +
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

	</script>

</body>
</html>
