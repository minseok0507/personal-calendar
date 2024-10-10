let getPageYear = document.getElementById('year').value;
let getPageMonth = document.getElementById('month').value;


let pageStartDate = new Date(getPageYear, getPageMonth - 1, 1);
let pageLastDate = new Date(getPageYear, getPageMonth, 0);
let pageBeforeDate = new Date(getPageYear, getPageMonth - 1, 0);

document.getElementsByClassName("top-year")[0].innerHTML = pageStartDate.getFullYear();
document.getElementsByClassName("top-month")[0].innerHTML = pageStartDate.getMonth() + 1;

let pageStartWeekDay = pageStartDate.getDay();
let pageLastDay = pageLastDate.getDate();
let pageBeforeDay = pageBeforeDate.getDate();

let getBigDayArr = document.getElementsByClassName("big-day");
let getBigDayNumArr = document.getElementsByClassName("big-day-num");


let pageDateIncr = 1;
for (let i = pageStartWeekDay; i < pageStartWeekDay + pageLastDay; i++) {
    getBigDayNumArr[i].innerHTML = pageDateIncr;
    getBigDayArr[i].className += " enabled"
    pageDateIncr++;
}

let pageAfterDate = 1;
for (let i = pageStartWeekDay + pageLastDay; i < getBigDayArr.length; i++) {
    getBigDayNumArr[i].innerHTML = pageAfterDate;

    pageAfterDate++;
}

let pageBeforeDateIncr = pageBeforeDay - pageStartWeekDay + 1;
for (let i = 0; i < pageStartWeekDay; i++) {
    getBigDayNumArr[i].innerHTML = pageBeforeDateIncr;
    pageBeforeDateIncr++;
}


let today = new Date();
let todayYear = document.getElementById('year').value;
let todayMonth = document.getElementById('month').value;
let todayDay = document.getElementById('day').value;

let dayArr = document.getElementsByClassName("small-day");

drawCalendar(todayYear, todayMonth, todayDay);

let beforeBtn = document.getElementsByClassName("before")[0];
beforeBtn.addEventListener("click", function () {
    todayMonth--;
    drawCalendar(todayYear, todayMonth, todayDay);

    for (let i = 0; i < dayArr.length; i++) {
        dayArr[i].addEventListener('click', function () {
            location.href = 'index.jsp?year=' + todayYear + '&month=' + Number(todayMonth);
        });
    }
})

let afterBtn = document.getElementsByClassName("after")[0];
afterBtn.addEventListener("click", function () {
    todayMonth++;
    drawCalendar(todayYear, todayMonth, todayDay);

    for (let i = 0; i < dayArr.length; i++) {
        dayArr[i].addEventListener('click', function () {
            location.href = 'index.jsp?year=' + todayYear + '&month=' + Number(todayMonth);
        });
    }
})





let close = document.getElementById('close');
let popup = document.getElementsByClassName('popup-event')[0];

close.addEventListener('click', function () {
    // 클릭 시 실행되는 코드
    animateClose(popup);
});

let enabled = document.getElementsByClassName('enabled');


for (let i = 0; i < enabled.length; i++) {
    enabled[i].addEventListener('click', function () {
        let startDateInput = document.getElementById("startDate")
        let endDateInput = document.getElementById("endDate");

        // 한 자리 숫자인 경우 두 자리 숫자로 변환
        let formattedMonth = ('0' + todayMonth).slice(-2);

        // this.innerHTML 값이 한 자리 숫자인 경우 두 자리 숫자로 변환
        let formattedDay = (this.querySelector('.big-day-num').textContent).padStart(2, '0');


        // startDateInput에 할당할 값 설정
        startDateInput.value = todayYear + "-" + formattedMonth + "-" + formattedDay + "T00:00";
        endDateInput.value = todayYear + "-" + formattedMonth + "-" + formattedDay + "T23:59";

        animateOpen(popup);
    })
}



