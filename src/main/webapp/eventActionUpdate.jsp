<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.example.classjsp.data.dao.EventDao" %>
<%@ page import="com.example.classjsp.data.dto.EventDto" %><%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 5. 4.
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id-update"));
    String title = request.getParameter("title-update");
    LocalDateTime startDateParam = LocalDateTime.parse(request.getParameter("startDate-update"));
    LocalDateTime endDateParam = LocalDateTime.parse(request.getParameter("endDate-update"));
    String information = request.getParameter("information-update");
    String userId = request.getParameter("user-id-update");

    Timestamp startDate = Timestamp.valueOf(startDateParam);
    Timestamp endDate = Timestamp.valueOf(endDateParam);

    EventDao eventDao = new EventDao();
    EventDto event = new EventDto();
    event.setId(id);
    event.setTitle(title);
    event.setStartDate(startDate);
    event.setEndDate(endDate);
    event.setInformation(information);
    event.setUserId(userId);

    eventDao.updateEvent(event);

    int year = startDate.getYear() + 1900;
    int month = startDate.getMonth() + 1;


    response.sendRedirect("index.jsp?year="+year+"&month="+month);
%>