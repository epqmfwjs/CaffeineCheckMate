/*
계산기 기능이 필요없는 보여주기만 할 즐겨찾기 리스트
*/

// 즐겨찾기 목록 렌더링 함수 ReactDOM.render(<App data={data}/>,root);
/*if (isAuth){
    const root = document.querySelector(".fav-box");
    function App(props) {
        const fav = props.data;
        return(
            <>
                {Object.keys(fav).map(key => (
                <div key={key} className="fp-item" id="fi_1" value={"C_NO="+fav[key]["C_NO"]}>
                    <div className="fp-item__box clickable" onClick={doCalc}>
                        <div className="fp-item__img clickable">이미지 이름 : {fav[key]["C_IMAGE"]}</div>
                        <div className="fp-item__info clickable">커피 이름 : {fav[key]["C_NAME"]}</div>
                    </div>
                    <button className="fp-item__delete-btn clickable" onClick={deleteFavItem}>
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
    }*/


    //즐겨찾기 박스 선택
    const favItems = root.children;

    // 즐겨찾기 목록에 이벤트 리스너 추가 메서드
    function loadLisetener() {
        console.log("loadListener");
        for (let i=0; i<favItems.length; i++) {
            favItems[i].querySelector(".fp-item__delete-btn").addEventListener("click",deleteFavItem);
        }
    }
    if(isAuth){
        loadLisetener();
    }

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
        .catch(error => {
            console.log("error",error);
        })
    }


    //즐겨찾기 삭제
    function deleteFavItem(element) {
        element.stopPropagation();
        const item = element.target.closest(".fp-item");
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
        .catch(error => {
          console.log("error",error);
      })
    }
//} //로그인상태에서만 동작함

/* 리액트 및 babel cdn
<script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js"></script>
<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js"></script> 
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script> 
*/