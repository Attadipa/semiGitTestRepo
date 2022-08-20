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

<style>
		* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	
	/* 회원가입 영역 잡기 */
	.div-container {
		width: 800px;
		margin: 100px auto 0 auto;
		border: 1px solid #d2d6dc;
		box-shadow: 0px 0px 10px 10px white;
		background-color: white;
		height: 600px;
	}
	
	.welcome-img {
		margin-top: 50px;
		text-align: center;
	}
	
	.welcome-img > img {
		height: 180px;	
	}
	
	.welcome-head {
		text-align: center;
		margin: 30px auto 0 auto;
		font-size: 30px;
	}
	
	
	.welcome-head-id {
		text-align: center;
		margin: 30px auto;
		font-size: 50px;
		color:grey;
	}
	
	
	.section-hr {
		width: 600px;
		margin: 15px auto 0 auto;
	}
	
	/* 세션 2 */
	.section-two {
		width: 700px;
		margin: 0px auto 15px auto;
	}
	
	/* 아이디 */
	
	.field-required {
		display: inline-block;
		width: 3px;
		height: 3px;
		background-color: red;
		border-radius: 100%;
		text-indent: -9999999999px;
		position: relative;
		top: -10px;
	}
	
	.frm-label {
		width: 500px;
		font-size: 20px;
		height: 30px;
		margin-top: 20px;
		margin: 30px auto 0 auto;
	}
	
	.frm-input-id {
		text-align: center;
	}
	
	.frm-input-id>input:first-child {
		width: 400px;
		height: 50px;
		text-indent: 15px;
	}
	
	.frm-input-id>input:first-child:hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	.frm-input-id>input:last-child {
		width: 100px;
		height: 50px;
		border: white;
		background-color: black;
		color: white;
	}
	
	/* 아이디 중복확인 */
	.frm-input-id>input:last-child:hover {
		background-color: white;
		color: black;
		border: 1px solid;
		cursor: pointer;
	}
	
	/* 비밀번호 */
	.frm-input-password {
		text-align: center;
	}
	
	.frm-input-password>input:first-child {
		width: 500px;
		height: 50px;
		text-indent: 15px;
	}
	
	.frm-input-password>input:first-child:hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	/* 이름 */
	.frm-input-name {
		text-align: center;
	}
	
	.frm-input-name>input:first-child {
		width: 500px;
		height: 50px;
		text-indent: 15px;
	}
	
	.frm-input-name>input:first-child:hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	/* 이메일 */
	.frm-input-email {
		text-align: center;
	}
	
	.frm-input-email>input:first-child {
		width: 500px;
		height: 50px;
		text-indent: 15px;
	}
	
	.frm-input-email>input:first-child:hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	
	/* 전화번호 */
	.frm-input-phone {
		text-align: center;
	}
	
	.frm-input-phone>select:nth-child(1) {
		width: 165px;
		height: 50px;
		font-size: 15px;
		text-indent: 15px;
	}
	
	.frm-input-phone>select:nth-child(1):hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	.frm-input-phone>input {
		width: 330px;
		height: 50px;
		font-size: 15px;
		text-indent: 15px;
	}
	
	.frm-input-phone>input:hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	/* 우편번호 */
	
	.frm-input-zipcode {
		text-align: center;
	}
	
	.frm-input-zipcode>input:first-child {
		width: 300px;
		height: 50px;
		text-indent: 15px;
	}
	
	.frm-input-zipcode>input:first-child:hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	.frm-input-zipcode>input:nth-child(2) {
		width: 200px;
		height: 50px;
		border: white;
		background-color: black;
		color: white;
		text-indent: 15px;
		cursor: pointer;
	}
	
	.frm-input-zipcode>input:nth-child(2):hover {
		background-color: white;
		color: black;
		border: 1px solid;
	}
	
	.frm-input-zipcode>input:nth-child(3) {
		margin-top: 2px;
		width: 505px;
		height: 50px;
		text-indent: 15px;
	}
	
	.frm-input-zipcode>input:nth-child(3):hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	/* 생년월일 */
	.frm-input-birth {
		text-align: center;
	}
	
	.frm-input-birth>select:nth-child(1) {
		width: 165px;
		height: 50px;
		font-size: 15px;
		text-indent: 15px;
	}
	
	.frm-input-birth>select:nth-child(1):hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	.frm-input-birth>select:nth-child(2) {
		width: 165px;
		height: 50px;
		font-size: 15px;
		text-indent: 15px;
	}
	
	.frm-input-birth>select:nth-child(2):hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	.frm-input-birth>select:nth-child(3) {
		width: 165px;
		height: 50px;
		font-size: 15px;
		text-indent: 15px;
	}
	
	.frm-input-birth>select:nth-child(3):hover {
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	/* 가입하기 */
	.frm-submit {
		width: 500px;
		font-size: 20px;
		height: 30px;
		margin-top: 20px;
		margin: 30px auto 0 auto;
		
	}
	
	.frm-submit> form input:nth-child(1) {
		width: 505px;
		height: 80px;
		background-color: black;
		color: white;
		margin-top: 50px;
		font-size: 20px;
		border: white;
		cursor: pointer;
	}
	
	.frm-submit> form input:nth-child(1):hover {
		background-color: white;
		color: black;
		border: 1px solid;
	}
</style>
</head>
<%
	String memberMid = request.getParameter("frmId");
	MemberVo vo = (MemberVo)request.getAttribute("MemberMid");

%>
<body class="body">
	<!-- header영역 -->
		<%@include file="/views/common/header.jsp" %>

	<div class="div-container">

		<section class="section-one">
			<div class="section-welcome">
				<div class="welcome-img">
					
					
					<% if(memberMid.equals("admin")) {%>
					<img src="../member/img/important.png">
					<h1 class="welcome-head-id"><%=memberMid %></h1>
					<h1 class="welcome-head">접근권한이 없습니다.</h1>
					
					<%} else if(vo.getMemberMid() != null) {%>
						<img src="../member/img/important.png">
					<h1 class="welcome-head-id"><%=memberMid %></h1>
					<h1 class="welcome-head">아이디가 중복입니다.</h1>
					<%} else{ %>					
					<img src="../member/img/smile.png">
					<h1 class="welcome-head-id"><%=memberMid %></h1>
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