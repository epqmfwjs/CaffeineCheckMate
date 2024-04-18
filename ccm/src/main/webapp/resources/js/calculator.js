const container = document.querySelector(".calc-container");
const bar = new ProgressBar.SemiCircle(container, {
    strokeWidth: 6,
    color: '#FFEA82',
    trailColor: '#eee',
    trailWidth: 1,
    easing: 'easeInOut',
    duration: 1400,
    svgStyle: null,
    text: {
      value: '',
      alignToBottom: false
    },
    from: {color: '#FFEA82'},
    to: {color: '#ED6A5A'},
    // Set default step function for all animate calls
    step: (state, bar) => {
      bar.path.setAttribute('stroke', state.color);
      var value = Math.round(bar.value() * 100);
      if (value === 0) {
        bar.setText("0%");
      } else {
        bar.setText(value+"%");
      }
  
      bar.text.style.color = state.color;
    }
  });
  bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
  bar.text.style.fontSize = '2rem';
//   bar.animate(1.0);  // Number from 0.0 to 1.0

const favBox = document.querySelector(".fav-box");
const favItems = favBox.children;
const dailyC = document.querySelector(".calc-box__dailyc");
const cResetBtn = document.querySelector("#calc-box__btn-reset");

//계산
function calc(cno) {
    console.log(cno);
    if (cno !== null && cno !== undefined) {
        const calcurl = (cno) => {
            return("/calc?yn=0&"+cno);
        }
    
        fetch(calcurl(cno))
        .then(respons => {
            return (respons.json());
        })
        .then(data => {
            const caffeine = data.caffeine;
            const rda = data.rda;
            const ratio = caffeine/rda;
            console.log("cf:",caffeine,"  rda:",rda,"  ratio:",ratio);
            dailyC.innerText = caffeine;
            bar.animate(ratio);
        })
        .catch(error => {
            console.log("error",error);
        })
    } else {
        console.log("cno is null");
    }
}

//리셋
function resetCalc() {
    const reseturl = () => {
        return ("/calc?yn=1");
    }
    fetch(reseturl())
    .then(response => {
        return (response.json());
    })
    .then(data => {
        const caffeine = data.caffeine;
        const rda = data.rda;
        const ratio = caffeine/rda;
        console.log("cf:",caffeine,"  rda:",rda,"  ratio:",ratio);
        dailyC.innerText = caffeine;
        bar.animate(ratio);
    })
    .catch(error => {
        console.log("error",error);
    })
}

//즐겨찾기 목록 불러오기 함수
document.addEventListener('DOMContentLoaded', getFavItem);
function getFavItem() {
  fetch("/favorites")
  .then(response => {
      return(response.json());
  })
  .then(data => {
      console.log(data);
  })
  .catch(error => {
      console.log("error",error);
  })
}

// 즐겨찾기 목록에 이벤트 리스너 추가
for (let i=0; i<favItems.length; i++) {
    favItems[i].childNodes[1].addEventListener("click",deleteFavItem);
    favItems[i].addEventListener("click",doCalc);
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
        //favMap객체 처리방법 구현 필요
        favBox.removeChild(item);
    })
    .catch(error => {
      console.log("error",error);
  })
}



function doCalc(event) {
    //계산기 기능
    calc(event.target.closest(".fav-item").getAttribute("value"));

}
cResetBtn.addEventListener("click", resetCalc);