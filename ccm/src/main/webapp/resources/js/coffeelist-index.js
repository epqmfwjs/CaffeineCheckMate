const showFavBtn = document.querySelector(".coffeelist-column_3");
console.log(showFavBtn);
showFavBtn.addEventListener("click",showFavs);

function toggleRotation(element) {
    if (element.classList.contains("not-rotated")) {
        // 요소가 회전하지 않은 상태라면 회전 상태로 변경
        element.classList.remove("not-rotated");
        element.classList.add("rotated");
    } else {
        // 요소가 회전 상태라면 회전하지 않은 상태로 변경
        element.classList.remove("rotated");
        element.classList.add("not-rotated");
    }
}

function showFavs() {
    const favsBox = document.querySelector(".coffeelist-column_2");
    let favClassList = favsBox.classList;
    if(favClassList.contains("hidden")){
        toggleRotation(showFavBtn);
        favsBox.classList.remove("hidden");
    }else{
        favsBox.classList.add("hidden");
        toggleRotation(showFavBtn);
    }
}