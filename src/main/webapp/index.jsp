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
    <link rel="stylesheet" href="main.css?asdfff">
    <link rel="icon" href="icon/outline_calendar_month_black_24dp.png">
    <title>Calender</title>
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


        if (year < 1900) {
            year = toDate.getYear() + 1900;
            month = toDate.getMonth() + 1;
        }

        String formatMonth = String.format("%02d", month);
        String yearMonth = year + "-" + formatMonth;
        EventDao eventDao = new EventDao();

        List<EventDto> events = eventDao.getEventsByYearMonth(yearMonth);

    %>
</head>
<body>
<div class="main-container">
    <div class="top">
        <div class="logo">
            <a href="index.jsp">
                <span><i class="material-icons-outlined" style="margin-right: 5px">calendar_month</i> 캘린더</span>
            </a>
        </div>
        <div class="top-control">
            <button class="d-flex align-items-center justify-content-center"
                    onclick="location.href='index.jsp?year=<%=year%>&month=<%=month-1%>'">
                <i class="material-icons-outlined">chevron_left</i>
            </button>
            <button class="d-flex align-items-center justify-content-center"
                    onclick="location.href='index.jsp?year=<%=year%>&month=<%=month+1%>'">
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


    <table class="table">
        <tr class="big-top">
            <td>일</td>
            <td>월</td>
            <td>화</td>
            <td>수</td>
            <td>목</td>
            <td>금</td>
            <td>토</td>
        </tr>
        <tr class="big-week">
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
        </tr>
        <tr class="big-week">
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
        </tr>
        <tr class="big-week">
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
        </tr>
        <tr class="big-week">
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
        </tr>
        <tr class="big-week">
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
        </tr>
        <tr class="big-week">
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
            <td>
                <div class="big-day"><span class="big-day-num"></span></div>
            </td>
        </tr>
    </table>
</div>

<div class="popup-event">
    <div class="popup-background" id="close"></div>
    <div class="popup-content">
        <form action="eventAction.jsp">
            <input type="hidden" name="year" id="year" style="display: none;" value="<%=year%>">
            <input type="hidden" name="month" id="month" style="display: none;" value="<%=month%>">
            <input type="hidden" name="day" id="day" style="display: none;" value="<%=day%>">
            <input type="hidden" name="id" id="id">

            <div>
                <label for="title">
                    <span>제목</span>
                    <input type="text" name="title" id="title" required class="form-control form-control-sm">
                </label>
                <br>
                <label for="startDate">
                    <span>시작시간</span>
                    <input type="datetime-local" name="startDate" id="startDate" class="form-control form-control-sm">
                </label>
                <br>
                <label for="endDate">
                    <span>끝 시간</span>
                    <input type="datetime-local" name="endDate" id="endDate" class="form-control form-control-sm">
                </label>
                <br>
                <label for="information">
                    <span>설명</span>
                    <textarea name="information" id="information" cols="30" rows="5"
                              class="form-control form-control-sm"></textarea>
                </label>
                <br>
                <label for="user-id">
                    <span>아이디</span>
                    <input type="text" name="user-id" id="user-id" required class="form-control form-control-sm">
                </label>
            </div>
            <div class="popup-save popup-button">
                <button class="btn btn-outline-dark"><span>저장</span></button>
            </div>
        </form>
    </div>
</div>


<div class="popup-update">
    <div class="popup-background" id="close-update"></div>
    <div class="popup-content">
        <form method="post" id="update-form">
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
                        onclick="if (confirm('정말로 삭제하시겠습니까?')){
                            document.getElementById('update-form').action = 'eventActionDelete.jsp';
                        }else {
                            event.stopPropagation();
                        }"
                        ><span class="material-icons-outlined" style="font-size: 20px;">delete_forever</span>
                </button>
            </div>
        </form>
    </div>
</div>


<script src="jsFuntion.js?asdf"></script>
<script src="main.js?addd"></script>

<script>
    function popEventDelete(event){
        confirm("정말로 삭제하시겠습니까?")
    }
    var events = [
        <% for (int i = 0; i < events.size(); i++) { %>
        {
            "getDay": <%= events.get(i).getStartDate().getDate() %>,
            "id": <%= events.get(i).getId() %>,
            "title": "<%= events.get(i).getTitle() %>",
            "startDate": "<%= events.get(i).getStartDate().toString() %>",
            "endDate": "<%= events.get(i).getEndDate().toString() %>",
            "information": "<%= events.get(i).getInformation() %>",
            "userId": "<%= events.get(i).getUserId() %>"
        }<%= i < events.size() - 1 ? "," : "" %>
        <% } %>
    ];


    var eventsIndex = [];
    var idData = [];
    var titleData = [];
    var startData = [];
    var endData = [];
    var informationData = [];
    var userIdData = [];

    events.forEach(function (event) {
        eventsIndex.push(event.getDay);
        idData.push(event.id);
        titleData.push(event.title);
        startData.push(event.startDate);
        endData.push(event.endDate);
        if (event.information !== null) {
            informationData.push(event.information);
        } else {
            informationData.push('');
        }
        userIdData.push(event.userId);
    });


    for (let i = 0; i < eventsIndex.length; i++) {
        let eventDiv = document.createElement('div');
        eventDiv.classList.add('event');

        let eventContentDiv = document.createElement('div');
        eventContentDiv.classList.add('event-content');
        eventContentDiv.textContent = titleData[i];

        eventDiv.appendChild(eventContentDiv);
        enabled[eventsIndex[i] - 1].appendChild(eventDiv);
    }

    let elementEvent = document.querySelectorAll('.event-content');

    let popupUpdate = document.getElementsByClassName("popup-update")[0];
    let closeUpdate = document.getElementById('close-update');

    closeUpdate.addEventListener('click', function () {
        // 클릭 시 실행되는 코드
        animateClose(popupUpdate);
    });

    let idInputUpdate = document.getElementById("id-update");
    let titleInputUpdate = document.getElementById("title-update");
    let startDateInputUpdate = document.getElementById("startDate-update");
    let endDateInputUpdate = document.getElementById("endDate-update");
    let informationInputUpdate = document.getElementById("information-update");
    let userIdInputUpdate = document.getElementById("user-id-update");

    for (let i = 0; i < elementEvent.length; i++) {
        elementEvent[i].addEventListener('click', function () {
            event.stopPropagation();
            idInputUpdate.value = idData[i];
            titleInputUpdate.value = titleData[i];
            startDateInputUpdate.value = startData[i];
            endDateInputUpdate.value = endData[i];
            informationInputUpdate.value = informationData[i];
            userIdInputUpdate.value = userIdData[i];

            animateOpen(popupUpdate);
        })
    }

    function updateEvent(event) {
        event.preventDefault();
        event.currentTarget.form.submit();
    }

    function deleteEvent(event) {
        event.preventDefault();
        event.currentTarget.form.submit();
    }
xx

</script>


</body>
</html>
