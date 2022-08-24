<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>

<link rel="stylesheet" href="../member/css/complete.css">

<script src="https://s3.ap-northeast-2.amazonaws.com/materials.spartacodingclub.kr/xmas/snow.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="../member/js/userjoin.js"></script>

<style type="text/css">
	* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Nanum Gothic', sans-serif;
	}
	
	/* 버튼 */
	.trk-header-align-btn {
		margin-top: 30px;
		height: 100px;
		margin: 30px auto;
		text-align:center;
	}
	
	.trk-header-align-btn input{
		
		width: 500px;
		height: 80px;
		margin: 10px auto;
		font-size: 25px;
		background-color:black;
		color:white;
		cursor: pointer;
		border-radius: 3px;
		
	}
	
	.trk-header-align-btn input:hover {
		background-color: white;
		color: black;
		border: 1px solid;
		box-shadow: 0px 0px 2px 0px #202224;
	}
	
	
	/* 님 */
	.welcome-head-user {
		text-align: center;
		margin: 50px auto 50px auto;
		font-size: 40px;
	}
		
	.welcome-head-fine {
		text-align: center;
		margin: 50px auto 50px auto;
		font-size: 20px;
		color: grey;
		border: 1px solid bo
	}
	
	/* 회원가입 영역 잡기 */
	.div-container {
		width: 800px;
		margin: 100px auto 0 auto;
		border: 1px solid #d2d6dc;
		box-shadow: 0px 0px 10px 10px white;
		background-color: white;
	}
	
	.welcome-img {
		margin-top: 50px;
		text-align: center;
	}
	
	.welcome-img > img {
		height: 150px;
	}
	.welcome-head {
		text-align: center;
		margin: 50px auto 50px auto;
		font-size: 30px;
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
	
	.frm-submit>input:nth-child(1) {
		width: 505px;
		height: 80px;
		background-color: black;
		color: white;
		margin-top: 50px;
		font-size: 20px;
		border: white;
		cursor: pointer;
	}
	
	.frm-submit>input:nth-child(1):hover {
		background-color: white;
		color: black;
		border: 1px solid;
	}	
</style>
</head>
<body class="body">
<!-- header영역 -->
		<%@include file="/views/common/header.jsp" %>

		<div class="div-container">

			<section class="section-one">	
				<div class="section-welcome">
					<div class="welcome-img">
						<img src="../member/img/complete.png">
					</div>
					<h1 class="welcome-head">회원가입이 완료되었습니다.</h1>
					<div class="welcome-head-fine" > 중고거래는 아나바다<br>
						더 나은 세상을 만들어갑니다.
					</div>
					
				</div>
				<div class="trk-header-align-btn">
					<form action="/semiTestPrj/views/member/loginForm.jsp" method="POST">
					<input type="submit" value="로그인">
					</form>
				</div>
			</section>
		</div>

   <!-- footer영역 -->
   	<%@include file="/views/common/footer.jsp" %>
	
</body>
</html>