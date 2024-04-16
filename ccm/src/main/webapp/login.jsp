<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
 
$(function(){
	$("button#checkId").click(function(){
		 event.preventDefault();

		let checkResult = "a";
		
		$.ajax({
			url:"<%=request.getContextPath()%>/checkId.do",
			type:"post",
			data:{id: idVal},
			dataType:"json",
			success:function(data){
				
				if(data['result']=='true') {
					alert("사용 가능한 ID입니다");
					checkResult=1;
			        } else{
			        	alert("중복된 ID입니다");
			        checkResult=2;
			        }
			},
			error:function(){
				alert("ID 중복 체크에 실패했습니다");
				console.log(checkResult);
				checkResult="b";
			}
			
		});//ajax끝 
		
		if(checkResult=="b"){
			$("#id").val("");
			console.log(checkResult);
		}
		
	});
	
});

</script>

<button id="checkId"> checkId</button>
</body>
</html>