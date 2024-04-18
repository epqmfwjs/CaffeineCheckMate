/*
계산기 기능이 필요없는 보여주기만 할 즐겨찾기 리스트
*/

const favBox = document.querySelector(".fav-box");
const favItems = favBox.children;


// **즐겨찾기에 커피 추가 버튼의 클래스리스트에 addFav-btn 필요
// **커피 요소 박스 value에 C_NO 필요
const coffeeList = document.querySelector("커피리스트 아이템 선택자")
const coffee = coffeeList.childern;
const addFavBtn = document.querySelector(".addFav-btn");

// 즐겨찾기 목록에 이벤트 리스너 추가 메서드
function loadLisetener() {
    for (let i=0; i<favItems.length; i++) {
        favItems[i].childNodes[1].addEventListener("click",deleteFavItem);
    }
}

//즐겨찾기 목록 불러오기 함수
const root = document.querySelector(".fav-box");
function App(props) {
    const fav = props.data;
    return(
        <div className="fav-box">
            {Object.keys(fav["data"]).map(key => (
            <div key={key} className="fav-item" id="fi_1" value={"C_NO="+fav["data"][key]["C_NO"]} onClick={doCalc}>
                <button className="fav-item__delete-btn" onClick={deleteFavItem}>
                <i className="fa-solid fa-x"></i>
                </button>
                <div className="fav-item__img">이미지 이름 : {fav["data"][key]["C_IMAGE"]}</div>
                <div className="fav-item__info">커피 이름 : {fav["data"][key]["C_NAME"]}</div>
            </div>
            ))}
        </div>
        )
}
function getFavItem() {
    fetch("/favorites")
    .then(response => {
        return(response.json());
    })
    .then(data => {
        //구현 필요
        ReactDOM.render(<App data={data}/>,root);
    })
    .catch(error => {
        console.log("error",error);
    })
}


//즐겨찾기 삭제
function deleteFavItem(element) {
    const item = element.target.closest(".fav-item")
    const cno = item.getAttribute("value");
    fetch("/delfav?"+cno)
    .then(response => {
        return(response.json());
    })
    .then(data => {
        favBox.removeChild(item);
    })
    .catch(error => {
        console.log("error",error);
    })
}

//즐겨찾기 추가
function addFavItem(element) {
    const item = element.target.closest("커피리스트 아이템 선택자");
    const cno = item.getAttribute("value");
    fetch("/addfav?"+cno)
    .then(response => {
        return(response.json());
    })
    .then(data => {
        // 요소 추가 로직 구현 필요
    })
    .catch(error => {
        console.log("error",error);
    })
}
/*
<script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script> 
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script> 
*/