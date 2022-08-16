<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>


<%-- <% //멤버 src쪽 파일이랑 연결 예정
	Member member = (Member)request.getAttribute("member");
%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./bootst/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

<div class = "container">
<div align ="center">
<a href="./MemberList.me">뒤로가기</a><br>
<table class = "table table-hover table-striped text-center">
<%-- <%
out.print("<tr><td>아이디</td>");
out.print("<td>"+member.getId()+"</td></tr>");

out.print("<tr><td>비밀번호</td>");
out.print("<td>"+member.getPw()+"</td></tr>");

out.print("<tr><td>이메일</td>");
out.print("<td>"+member.getEmail()+"</td></tr>");

out.print("<tr><td>이름</td>");
out.print("<td>"+member.getName()+"</td></tr>");

out.print("<tr><td>주소</td>");
out.print("<td>"+member.getAddarr2()+"</td></tr>");

out.print("<tr><td>주민번호</td>");
out.print("<td>"+member.getPin()+"</td></tr>");

out.print("<tr><td>생년월일</td>");
out.print("<td>"+member.getYear()+"-"+member.getMonth()+"-"+member.getDay()+"</td></tr>");

out.print("<tr><td>취미</td>");
out.print("<td>"+member.getHobbyarr2()+"</td></tr>");

out.print("<tr><td>자기소개</td>");
out.print("<td>"+member.getIntro()+"</td></tr>");
%> --%>
</table>
</div>
</div>
	<!-- 부트스트랩과 jquery 적용 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<%@ include file="../member/logout.jsp" %>
</body>
</html>