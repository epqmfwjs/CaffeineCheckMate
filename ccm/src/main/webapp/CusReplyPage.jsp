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
	<br>
	<!--댓글 조회-->
	<div id="replList">
		<!--각 댓글 영역 -->
		<div class="replyArea" align="center" id="replyArea">
			<table style="width: 500px;">
				<tbody>

				</tbody>
			</table>
		</div>
	</div>
	
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
	                    <input type="text" class="form-control" id="reply" placeholder="댓글을 입력하세요." style="width: 350px; height: 30px;" name="reply">
	                </div>
	            </td>
	            <td><button class="btn" onclick="insertReply();" style="width: 80px;  height: 30px;">게시하기</button></td>
	        </tr>
	    </table>
	</div>

	<script>
	/*자동 함수 호출*/
	$(function(){
		selectReplyList();
		setInterval(selectReplyList,50000);
	})
	
	 /*댓글 작성*/
    function insertReply(){
		$.ajax({
       		url : "CusReplyInsert.do"
       		,data : {
       					m_id: "user2", //임시 지정
       					cus_no: 2, //임시 지정
		                cus_re_content: $("#reply").val()
        			}
       		,type : "GET"
       		,success : function(result){
            		if(result>0){
            			selectReplyList();
            			$("#cus_re_content").val("");
            		}
       		}
        	
        	})
        }

     /*댓글 조회 */
     function selectReplyList(){
    	 $.ajax({
     	 	url : "CusReplyList.do",
         	data : {
         		cus_no: "2" //임시 지정
			},
         	success : function(selectReplyList){
         		var result = "";
         		for(var i in selectReplyList){
         			result += 
            			"<br>"	+	
                        "<td>" + "<b>" + selectReplyList[i].getCus_no + "</b>" + "</td>" +
                        "<td>" + selectReplyList[i].getCus_re_no + "</td>" + 
                        "<td>" + selectReplyList[i].getCus_re_regdate + "</td>" + 
                        "<br>" +
                        "<tr class='reply-deatil-content'>" + 
                        "<td colspan='3'>" + selectReplyList[i].getCus_re_content  + "</td>" + 
                        "</tr>" +
                        "<br>"
         		} 
					$("#replyArea tbody").html(result);	
         	}
     	})
     }
	</script>

</body>
</html>
