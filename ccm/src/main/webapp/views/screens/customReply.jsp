<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String cus_no = request.getParameter("cus_no");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/customReply.js"></script>\

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
	
	<!-- 댓글 수정 -->
	<div id="editModal" class="modal" align="center" style="display: none;">
	    <div class="modal-content">
	        <span class="close">&times;</span> 
	        <!-- 닫힘 버튼 -->
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
	

</body>
</html>
