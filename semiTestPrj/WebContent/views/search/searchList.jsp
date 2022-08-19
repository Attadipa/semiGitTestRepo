<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.search-error-h1{text-align: center; height: 500px; font-hieght:100px;}
</style>
</head>
<body>
	
	<%@ include file="/views/common/header.jsp" %>
	
	<br> <br> <br> <br> <br> <br> <br>
	<c:if test="${not empty searchErrorMsg}">
		<h1 class="search-error-h1">${searchErrorMsg}</h1>
	</c:if>
	
	
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>