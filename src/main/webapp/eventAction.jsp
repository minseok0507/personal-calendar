<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.example.classjsp.data.dao.EventDao" %>
<%@ page import="com.example.classjsp.data.dto.EventDto" %><%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 5. 3.
  Time: 오전 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    LocalDateTime startDateParam = LocalDateTime.parse(request.getParameter("startDate"));
    LocalDateTime endDateParam = LocalDateTime.parse(request.getParameter("endDate"));
    String information = request.getParameter("information");
    String userId = request.getParameter("user-id");

    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");


    Timestamp startDate = Timestamp.valueOf(startDateParam);
    Timestamp endDate = Timestamp.valueOf(endDateParam);

    EventDao eventDao = new EventDao();
    EventDto eventDto = new EventDto(title, startDate, endDate, information, userId);
    eventDao.insertEvent(eventDto);

    response.sendRedirect("index.jsp?year="+year+"&month="+month);
%>
