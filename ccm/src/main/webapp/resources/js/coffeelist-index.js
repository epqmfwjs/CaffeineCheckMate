const addCoffee = () => {
    window.open(
        "/views/screens/coffeeList_Add.jsp", // 팝업 창에 열릴 URL
        "Add Coffee", // 팝업 창의 이름
        "width=600,height=400" // 팝업 창의 크기 및 설정
    );
}
const addCoffeeBtn = document.querySelector(".coffeelist-add__btn");
addCoffeeBtn.addEventListener("click",addCoffee);