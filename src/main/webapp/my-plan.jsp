<%@ page import="java.util.Date" %>
<%@ page import="com.example.classjsp.data.dao.EventDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.classjsp.data.dto.EventDto" %><%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 5. 2.
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined:wght@400;500;600;700&display=swap">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="main.css?gjdj">
    <link rel="icon" href="icon/outline_calendar_month_black_24dp.png">
    <title>Calender</title>

    <style>
        .main-container > .table-container {
            padding: 10px;
            display: inline-block;
            width: calc(100% - 200px);
            height: calc(100% - 50px);
            text-align: center;
            table-layout: fixed;
            border-collapse: collapse;
        }

        .main-container > .table-container > table {
            width: 100%;
            height: 100%;
        }
        .main-container > .table-container > table td {
            font-size: 15px;
        }
        .main-container > .table-container > table tr {
            border-bottom: 1px solid gray;
        }

        .big-top td:first-child,
        .big-top td:last-child {
            text-align: center;
        }

        .table-button {
            align-items: center;
            justify-content: center;
        }

        .table-button > button {
            width: 30px;
            height: 30px;
            font-size: 13px;
            padding: 0;
        }

        .table-button > button > span {
            font-size: 15px;
        }

        .table-event-x{
            text-align: center;
            display: none;
        }
    </style>

    <%
        String getParamYear = request.getParameter("year");
        String getParamMonth = request.getParameter("month");
        String getParamDay = request.getParameter("day");

        Date toDate = new Date();
        int year = 0;
        int month = 0;
        int day = 0;

        if (getParamYear == null) {
            year = toDate.getYear() + 1900;
        } else {
            year = Integer.parseInt(getParamYear);
        }

        if (getParamMonth == null) {
            month = toDate.getMonth() + 1;
        } else {
            month = Integer.parseInt(getParamMonth);
        }

        if (getParamDay == null) {
            day = toDate.getDay();
        } else {
            day = Integer.parseInt(getParamDay);
        }

        if (year < 1900 || month < 1) {
            year = toDate.getYear() + 1900;
            month = toDate.getMonth() + 1;
        }

        String formetMonth = String.format("%02d", month);
        String yearMonth = year + "-" + formetMonth;
        EventDao eventDao = new EventDao();

        List<EventDto> events = eventDao.getEventsByYearMonth(yearMonth);

    %>
</head>
<body>
<input type="hidden" name="year" id="year" style="display: none;" value="<%=year%>">
<input type="hidden" name="month" id="month" style="display: none;" value="<%=month%>">
<input type="hidden" name="day" id="day" style="display: none;" value="<%=day%>">
<div class="main-container">
    <div class="top">
        <div class="logo">
            <a href="index.jsp">
                <span><i class="material-icons-outlined" style="margin-right: 5px">calendar_month</i> 캘린더</span>
            </a>
        </div>
        <div class="top-control">
            <button class="d-flex align-items-center justify-content-center"
                    onclick="location.href='my-plan.jsp?year=<%=year%>&month=<%=month-1%>'">
                <i class="material-icons-outlined">chevron_left</i>
            </button>
            <button class="d-flex align-items-center justify-content-center"
                    onclick="location.href='my-plan.jsp?year=<%=year%>&month=<%=month+1%>'">
                <i class="material-icons-outlined">chevron_right</i>
            </button>
        </div>
        <div class="top-date"><span class="top-year"><%=year%></span>년 <span class="top-month"><%=month%></span>월
        </div>
    </div>


    <div class="small-container">
        <table>
            <tr class="top-nav">
                <th colspan="5">
                    <span class="year"></span>년 <span class="month"></span>월
                </th>
                <td class="before"><i class="material-icons-outlined">chevron_left</i></td>
                <td class="after"><i class="material-icons-outlined">chevron_right</i></td>
            </tr>
            <tr class="day-title">
                <td>일</td>
                <td>월</td>
                <td>화</td>
                <td>수</td>
                <td>목</td>
                <td>금</td>
                <td>토</td>
            </tr>
            <tr class="first-week week-day">
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
            </tr>
            <tr class="second-week week-day">
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
            </tr>
            <tr class="third-week week-day">
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
            </tr>
            <tr class="forth-week week-day">
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
            </tr>
            <tr class="fifth-week week-day">
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
            </tr>
            <tr class="sixth-week week-day">
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
                <td>
                    <div class="small-day"></div>
                </td>
            </tr>
        </table>


        <div class="top-button">
            <button onclick="location.href='index.jsp?year=<%=year%>&month=<%=month%>'">달력</button>
            <button onclick="location.href='my-plan.jsp?year=<%=year%>&month=<%=month%>'">일정</button>
        </div>
    </div>
    <div class="table-container">
        <table class="" height="50">
            <tr class="big-top">
                <th width="70">

                </th>
                <th width="120">
                    제목
                </th>
                <th width="180">
                    시작 날짜
                </th>
                <th width="180">
                    끝 날짜
                </th>
                <th>
                    설명
                </th>
                <th width="100">
                    아이디
                </th>
                <th width="70">

                </th>
            </tr>
            <%
                for (int i = 0; i < events.size(); i++) {%>
            <tr class="table-events">
                <td class="table-button">
                    <button class="btn btn-outline-primary edit-button" style="width: 40px;">수정</button>
                </td>
                <td>
                    <span class="td-id" style="display: none;"><%=events.get(i).getId()%>
                    </span>
                    <span class="td-title"><%=events.get(i).getTitle()%>
                    </span>
                </td>
                <td>
                    <span class="td-start-date"><%=String.format("%tY-%<tm-%<tdT%<tH:%<tM", events.get(i).getStartDate())%>
                    </span>
                </td>
                <td>
                    <span class="td-end-date"><%=String.format("%tY-%<tm-%<tdT%<tH:%<tM", events.get(i).getEndDate())%>
                    </span>
                </td>
                <td>
                    <span class="td-info"><%=events.get(i).getInformation()%>
                    </span>
                </td>
                <td>
                    <span class="td-user-id"><%=events.get(i).getUserId()%>
                    </span>
                </td>
                <td class="table-button delete-button">
                    <button class="btn btn-outline-danger"><span class="material-icons-outlined">close</span></button>
                </td>
            </tr>
            <%}%>
            <tr class="table-event-x">
                <td colspan="100%">
                    <span>이 달의 일정이 없습니다</span>
                </td>
            </tr>
        </table>
    </div>
</div>


<div class="popup-update">
    <div class="popup-background" id="close-update"></div>
    <div class="popup-content">
        <form method="post">
            <input type="hidden" name="id-update" id="id-update">

            <div>
                <label for="title-update">
                    <span>제목</span>
                    <input type="text" name="title-update" id="title-update" required
                           class="form-control form-control-sm">
                </label>
                <br>
                <label for="startDate-update">
                    <span>시작시간</span>
                    <input type="datetime-local" name="startDate-update" id="startDate-update"
                           class="form-control form-control-sm">
                </label>
                <br>
                <label for="endDate-update">
                    <span>끝 시간</span>
                    <input type="datetime-local" name="endDate-update" id="endDate-update"
                           class="form-control form-control-sm">
                </label>
                <br>
                <label for="information-update">
                    <span>설명</span>
                    <textarea name="information-update" id="information-update" cols="30" rows="5"
                              class="form-control form-control-sm"></textarea>
                </label>
                <br>
                <label for="user-id-update">
                    <span>아이디</span>
                    <input type="text" name="user-id-update" id="user-id-update" required
                           class="form-control form-control-sm">
                </label>
            </div>
            <div class="popup-save popup-button">
                <button class="btn btn-outline-dark"
                        formaction="eventActionUpdate.jsp"
                ><span>수정</span></button>
            </div>

            <div class="popup-del popup-button">
                <button class="btn btn-outline-danger"
                        formaction="eventActionDelete.jsp"
                ><span class="material-icons-outlined" style="font-size: 20px;">delete_forever</span>
                </button>
            </div>
        </form>
    </div>
</div>


<script src="jsFuntion.js?dsa"></script>


<script>
    let tableEvent = document.getElementsByClassName("table-events");
    let tableNotEvent = document.getElementsByClassName("table-event-x")[0];
    if (tableEvent.length === 0){
        tableNotEvent.style.display = "table-row";
    }

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
                location.href = 'my-plan.jsp?year=' + todayYear + '&month=' + Number(todayMonth);
            });
        }
    })

    let afterBtn = document.getElementsByClassName("after")[0];
    afterBtn.addEventListener("click", function () {
        todayMonth++;
        drawCalendar(todayYear, todayMonth, todayDay);

        for (let i = 0; i < dayArr.length; i++) {
            dayArr[i].addEventListener('click', function () {
                location.href = 'my-plan.jsp?year=' + todayYear + '&month=' + Number(todayMonth);
            });
        }
    })

    let popup = document.getElementsByClassName("popup-update")[0];

    let editButtonArr = document.getElementsByClassName("edit-button");
    let deleteButtonArr = document.getElementsByClassName("delete-button");

    let idArr = document.getElementsByClassName("td-id");
    let titleArr = document.getElementsByClassName("td-title");
    let startDateArr = document.getElementsByClassName("td-start-date");
    let endDateArr = document.getElementsByClassName("td-end-date");
    let infoArr = document.getElementsByClassName("td-info");
    let userIdArr = document.getElementsByClassName("td-user-id");


    let idInputUpdate = document.getElementById("id-update");
    let titleInputUpdate = document.getElementById("title-update");
    let startDateInputUpdate = document.getElementById("startDate-update");
    let endDateInputUpdate = document.getElementById("endDate-update");
    let informationInputUpdate = document.getElementById("information-update");
    let userIdInputUpdate = document.getElementById("user-id-update");

    for (let i = 0; i < editButtonArr.length; i++) {
        editButtonArr[i].addEventListener('click', function () {
            idInputUpdate.value = idArr[i].textContent;
            titleInputUpdate.value = titleArr[i].textContent;

            const startDateStr = startDateArr[i].textContent;
            const endDateStr = endDateArr[i].textContent;

            startDateInputUpdate.value = "" + startDateStr + "";
            endDateInputUpdate.value = "" + endDateStr + "";

            informationInputUpdate.value = infoArr[i].textContent;
            userIdInputUpdate.value = userIdArr[i].textContent;

            animateOpen(popup);
        })
    }

    let closeUpdate = document.getElementById('close-update');

    closeUpdate.addEventListener('click', function () {
        // 클릭 시 실행되는 코드
        animateClose(popup);
    });

</script>


</body>
</html>
