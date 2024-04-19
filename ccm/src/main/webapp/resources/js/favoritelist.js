/*
계산기 기능이 필요없는 보여주기만 할 즐겨찾기 리스트
*/

// 즐겨찾기 목록 렌더링 함수 ReactDOM.render(<App data={data}/>,root);
if (isAuth){
const root = document.querySelector(".fav-box");
function App(props) {
    const fav = props.data;
    return(
        <>
            {Object.keys(fav).map(key => (
            <div key={key} className="fav-item" id="fi_1" value={"C_NO="+fav[key]["C_NO"]}>
                <div className="fav-item__box" onClick={doCalc}>
                    <div className="fav-item__img">이미지 이름 : {fav[key]["C_IMAGE"]}</div>
                    <div className="fav-item__info">커피 이름 : {fav[key]["C_NAME"]}</div>
                </div>
                <button className="fav-item__delete-btn" onClick={deleteFavItem}>
                <i className="fa-solid fa-x"></i>  
                </button>
            </div>
            ))}
        </>
    )
}
function render(data){
    console.log("render");
    ReactDOM.render(<App data={data}/>,root);
}


//즐겨찾기 박스 선택
const favItems = root.children;

// 즐겨찾기 목록에 이벤트 리스너 추가 메서드
function loadLisetener() {
    console.log("loadListener");
    for (let i=0; i<favItems.length; i++) {
        favItems[i].querySelector(".fav-item__delete-btn").addEventListener("click",deleteFavItem);
    }
}
loadLisetener();

//즐겨찾기 추가
// **즐겨찾기에 커피 추가 버튼의 클래스리스트에 addFav-btn 필요
const coffeeBox = document.querySelector(".coffee-box");
const coffeeitem = coffeeBox.children;
for(let i=0; i<coffeeitem.length; i++){
    coffeeitem[i].querySelector(".addFav-btn").addEventListener("click",addFavItem);
}
// **커피 요소 박스 value에 C_NO 필요
function addFavItem(element) {
    console.log("in addFav");
    const item = element.target.closest(".coffeelist-item");//커피리스트아이템
    const cno = item.getAttribute("value");
    fetch("/addfav?"+cno)
    .then(response => {
        console.log("converting json");
        return(response.json());
    })
    .then(data => {
        render(data);
    })
    // .catch(error => {
    //     console.log("error",error);
    // })
}


//즐겨찾기 삭제
function deleteFavItem(element) {
    element.stopPropagation();
    const item = element.target.closest(".fav-item");
    const cno = item.getAttribute("value");
    console.log("delete : ",item.getAttribute("class"));
    fetch("/delfav?"+cno)
    .then(response => {
        return(response.json());
    })
    .then(data => {
        // document.querySelector(".fav-box").removeChild(item);
        render(data);
    })
//     .catch(error => {
//       console.log("error",error);
//   })
}
} else {

}// 비로그인상태

/* 리액트 및 babel cdn
<script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script> 
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script> 
*/