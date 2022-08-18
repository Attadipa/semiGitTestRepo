<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="../member/css/idCheckForm.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="https://s3.ap-northeast-2.amazonaws.com/materials.spartacodingclub.kr/xmas/snow.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="../member/js/userjoin.js"></script>

</head>
<%
	String memberId = request.getParameter("frmId");
	MemberVo vo = (MemberVo)request.getAttribute("list");

%>
<body class="body">
	<!-- header영역 -->
		<%@include file="/views/common/header.jsp" %>

	<div class="div-container">

		<section class="section-one">
			<div class="section-welcome">
				<div class="welcome-img">
					
					
					<% if(memberId.equals("admin")) {%>
					<img src="../member/img/important.png">
					<h1 class="welcome-head-id"><%=memberId %></h1>
					<h1 class="welcome-head">접근권한이 없습니다.</h1>
					
					<%} else if(vo.getMemberMid() != null) {%>
						<img src="../member/img/important.png">
					<h1 class="welcome-head-id"><%=memberId %></h1>
					<h1 class="welcome-head">아이디가 중복입니다.</h1>
					<%} else{ %>					
					<img src="../member/img/smile.png">
					<h1 class="welcome-head-id"><%=memberId %></h1>
					<h1 class="welcome-head">사용 가능한 아이디 입니다.</h1>
					<% } %>
					
					 
				</div>
			</div>
		</section>
		
				<div class="frm-submit">
					<form action="index.jsp">
					<input type="submit" name="frmSubmit" value="돌아가기">
					<input type="hidden" name="frmId" id="reg-id"  maxlength="15" value="${param.frmId }">
					</form>
				</div>
	</div>


	<!-- footer영역 -->
    	<%@include file="/views/common/footer.jsp" %>


</body>
</html>