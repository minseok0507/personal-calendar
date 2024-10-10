<%@ page import="com.example.classjsp.data.dao.EventDao" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 5. 5.
  Time: 오후 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id-update"));
    LocalDateTime startDate = LocalDateTime.parse(request.getParameter("startDate-update"));
    EventDao eventDao = new EventDao();
    eventDao.deleteEventById(id);

    int year = startDate.getYear();
    int month = startDate.getMonthValue();

    response.sendRedirect("index.jsp?year="+year+"&month="+month);
%>
