<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session
    if (session != null) {
        session.invalidate();
    }
    // Redirect to home page
    response.sendRedirect("index.jsp");
%>