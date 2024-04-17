const fav1 = document.querySelector(".즐겨찾기요소1");
const dailyC = document.querySelector(".calc-box__info-value_caffeine-2");
const cResetBtn = document.querySelector(".calc-box__reset-btn");

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

fav1.addEventListener("click", calc);
cResetBtn.addEventListener("click", resetCalc);