<%@page import="com.kh.member.vo.MemberVo"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오</title>
</head>
<body>
<%		 
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	session.setAttribute("memberMid", "5235268");
	/* request.getSession().setAttribute("loginMember", loginMember); */
	response.sendRedirect("/semiTestPrj");
%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>

</body>
</html>
