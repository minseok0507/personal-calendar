
function drawCalendar(iyear, imonth, iday) {
    // 현재 날짜 및 시간 정보 가져오기
    let currentDate = new Date(iyear, imonth, iday);
    
    // 오늘 연도, 월, 일, 요일 정보 추출
    let year = currentDate.getFullYear();
    let month = currentDate.getMonth() - 1;
    let day = currentDate.getDate();

    let todayStartDay = new Date(year, month, 1);
    let todayStartDayOfWeek = todayStartDay.getDay(); // 0(일요일) ~ 6(토요일)
    let lastDay = new Date(year, month + 1, 0).getDate(); //마지막날

    let beforeLastDay = new Date(year, month, 0).getDate(); //전달 마지막날

    let topSpanYear = document.getElementsByClassName("year")[0];
    topSpanYear.innerHTML = year;
    let topSpanMonth = document.getElementsByClassName("month")[0];
    topSpanMonth.innerHTML = month + 1; // 월은 0부터 시작하므로 +1

    let dayArr = document.getElementsByClassName("small-day");
    let num = 1;
    for (let i = todayStartDayOfWeek; i < todayStartDayOfWeek + lastDay; i++) {
        dayArr[i].innerHTML = num;
        dayArr[i].style.color = "black";
        dayArr[i].style.fontWeight = "border";
        num++;
    }
    let newNum = 1;
    for (let i = todayStartDayOfWeek + lastDay; i < dayArr.length; i++) {
        dayArr[i].innerHTML = newNum;
        dayArr[i].style.color = "lightgray";
        newNum++;
    }

    let backDay = beforeLastDay - todayStartDayOfWeek + 1
    for (let i = 0; i < todayStartDayOfWeek; i++) {
        dayArr[i].innerHTML = backDay;
        dayArr[i].style.color = "lightgray";
        backDay++;
    }


}


function animateClose(element) {
    // 애니메이션 효과 적용
    element.style.transform = 'translate(0, 50%)';
    element.style.opacity = '0';
    element.style.transition = 'all 0.15s ease-in-out';

    setTimeout(function () {
        element.style.display = 'none';
    }, 300);
}

function animateOpen(element) {
    // 애니메이션 효과 적용
    element.style.display = 'block';

    setTimeout(function () {
        element.style.transform = 'translate(0, 0%)';
        element.style.opacity = '1';
        element.style.transition = 'all 0.15s ease-in-out';
    }, 300);
}