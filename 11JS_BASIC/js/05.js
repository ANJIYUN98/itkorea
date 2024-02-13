console.log("05.js start...");
const boxEl = document.querySelector('.box');
boxEl.addEventListener('click',function(){
    console.log("Clicked...");
    boxEl.style.backgroundColor='orange'; //js에서는 '-'를 사용하지 않기 때문에 바로 뒤에오는 영어를 대문자로 사용하면 된다.
});
