<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아나바다 에러페이지</title>

<style>
	.errorMsg{
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>

	<h1 class="errorMsg"><%= errorMsg %></h1>	

</body>
</html>