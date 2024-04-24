const coffeeaddBtn = document.querySelector(".coffee__add-btn");
coffeeaddBtn.addEventListener("click",function(){
    if (window.opener && !window.opener.closed) {
        window.opener.location.reload();
        window.close();
    }
});