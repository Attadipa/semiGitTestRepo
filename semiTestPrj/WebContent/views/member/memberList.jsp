<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%-- <%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
ArrayList<Object> memberlist = (ArrayList)request.getAttribute("memberlist");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css 적용 -->
</head>
<body>

<div align = "center">
<a href="./BoardList.bo">뒤로가기</a><br>
<h3>회원목록보기 </h3>
<div class="container my-3">
<div class="card align-middle" style="width: 30rem; border-radius: 20px;">
<div class="card-body">

<%-- <%
for(int i=0;i<memberlist.size();i++){
	Member mb = (Member)memberlist.get(i);
	if(!mb.getId().equals("admin")){
	out.print("<div class=\"d-flex justify-content-around\">");
	out.print("<div>"+"<a href=\"./MemberInfo.me?id="+mb.getId()+"\">"+mb.getId()+"</a>"+"</div>");
	out.print("<div>"+"<a href=\"./MemberDeleteAction.me?id="+mb.getId()+"\">"+"삭제"+"</a>"+"</div>");
	out.print("</div>");
	}
}
%> --%>

</div>
</div>
</div>
</div>

<!-- 부트스트랩과 jquery 적용 -->

<%@ include file="../member/logout.jsp" %>

</body>
</html>