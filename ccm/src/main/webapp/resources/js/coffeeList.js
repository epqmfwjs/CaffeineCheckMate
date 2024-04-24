// 커피리스트 파일 업로드,수정 확장자 유효성 검사
function coffee_FileExtensionsError(){
	let image = document.getElementById("cimgreal");
	
	
	if(image.value){//파일이 선택된 경우에만 검사 실행
		let ableExtensions = /(.*?)\.(jpg|jpeg|png)$/; //정규식 사용
		if (!image.value.match(ableExtensions)) {
			alert("사진 파일은 jpg, jpeg, png 파일만 업로드가 가능합니다!");
			return false;
		} 
	}return true;	
}

// 커피리스트 이미지 미리보기
function coffee_PreviewImage() {
	//FileReader API 이용 비동기적으로 로컬파일 읽을 수 있음
	let fileInput = document.getElementById('cimgreal');
	let preview = document.getElementById('coffeePreviewImage');
	if(fileInput.files && fileInput.files[0]) { 
		let reader = new FileReader();
		reader.onload = function(e) {
			preview.src = e.target.result;
    	};
    reader.readAsDataURL(event.target.files[0]);
    }else {
		preview.src = document.getElementById('defaultImage').value;
	}
}

