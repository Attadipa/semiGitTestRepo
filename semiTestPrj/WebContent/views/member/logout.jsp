<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.removeAttribute("member_mid");
	/* session.removeAttribute("admin"); 어드민 사용시..? */ 

	response.sendRedirect("/SemiTestPrj/index.jsp");
%>
