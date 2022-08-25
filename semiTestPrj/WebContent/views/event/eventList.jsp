<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
<style>
	.event-list-title{
		text-align: center;
		font-size: 50px;
		font-weight: bolder;
		color: green;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<div class="event-list-title">이벤트</div>
	
	<br><br><br>
	
	<%@ include file="/views/admin/adminEvent.jsp" %>
	
	<br><br><br>
	
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>