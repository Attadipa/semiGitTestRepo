<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
	
	
	/* 회원가입 영역 잡기 */
	.div-container {
		width: 800px;
		margin: 100px auto 0 auto;
		border: 1px solid #d2d6dc;
		box-shadow: 0px 0px 10px 10px white;
		background-color: white;
		height: 1500px;
	}
	
	.welcome-img {
		text-align: center;
	}
	
	.welcome-head {
		text-align: center;
		margin: 30px auto 0 auto;
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
		color: #2D9568;
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
		color: #2D9568;
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
		color: #2D9568;
		border: 1px solid;
	}
</style>
</head>
<body class="body">
	<!-- header영역 -->
	<jsp:include page="/views/common/header.jsp"/>

	<div class="div-container">

		<section class="section-one">
			<div class="section-welcome">
				<div class="welcome-img">
					<img src="/semiTestPrj/views/common/resources/원형로고.png">
				</div>
				
				
				<h1 class="welcome-head">아나바다에 오신 것을 환영합니다!</h1>
				<hr class="section-hr">
			</div>
		</section>

		<section class="section-two">
			<form class="frm-member" id="frmMember" onsubmit="return joinCheck(this)" action="/semiTestPrj/member/join"
				name="memberInfo" method="post">
				<div class="frm-label">
					<label for="regId">아이디</label> <span class="field-required"></span><br>
				</div>

				<div class="frm-input-id">
					<input type="text" name="frmId" id="regId"
						placeholder="영문자와 한글,숫자만을 입력(15자 이내)" maxlength="15" value="${param.frmId}">
					<input type="button" name="frmCheck" id="idCheck" value="중복확인" onclick="return idCheck()">
				</div>
				<div class="frm-label">
					<label>비밀번호</label> 
					<span class="field-required"></span>
				</div>
				<div class="frm-input-password">
					<input type="password" name="frmPassword" placeholder="숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상">
				</div>

				<div class="frm-label">
					<label>비밀번호 재입력</label> <span class="field-required"></span>
				</div>
				<div class="frm-input-password">
					<input type="password" name="re_frmPassword"
						placeholder="비밀번호 재입력">
				</div>

				<div class="frm-label">
					<label>이름</label> <span class="field-required"></span>
				</div>
				<div class="frm-input-name">
					<input type="text" name="frmName" placeholder="성명을 입력해주세요.">
				</div>

				<div class="frm-label">
					<label>이메일</label> <span class="field-required"></span>
				</div>
				<div class="frm-input-email">
					<input type="text" name="frmEmail" placeholder="example@khanbd.com">
				</div>


				<div class="frm-label">
					<label>전화번호</label>
				</div>
				<div class="frm-input-phone">
					<select name="phoneFirst">
						<option selected>010</option>
						<option>017</option>
					</select> 
					<input type="text" name="frmPhone" id="phoneNum"
						placeholder="0000-0000" maxlength="9">
				</div>

				<div class="frm-label">
					<label>주소</label>
				</div>
				<div class="frm-input-zipcode">
					<input type="text" name="zipcode" placeholder="우편번호"> <input
						type="button" name="btnZipcode" id="btnFindZip" value="우편번호검색">
					<input type="text" name="address" placeholder="상세주소">
				</div>

				<div class="frm-label">
					<label>생년월일</label>
				</div>
				<div class="frm-input-birth">
					<select>

						<% for(int i = 1900; i < 2020; i++) {%>
						<option selected><%= i+1%>년
						</option>
						<% } %>
					</select> <select>
						<% for(int i = 0; i < 31; i++) {%>
						<option><%= i+1%>일
						</option>
						<% } %>
					</select> <select>
						<% for(int i = 0; i < 12; i++) {%>
						<option><%= i+1%>월
						</option>
						<% } %>
					</select>

				</div>

				<div class="frm-submit">
					<input type="submit" name="frmSubmit" value="가입하기">
				</div>
			</form>
		</section>
	</div>


	<footer>
		  	<%@include file="/views/common/footer.jsp" %>
	</footer>


	<script>
		
	</script>
	
	<script>
	
	member();
	phoneHypen();

	</script>
</body>
</html>