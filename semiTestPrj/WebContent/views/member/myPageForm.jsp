<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%-- <%@page import="com.kh.member.MemberVo"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% 
	String memberMid = (String)session.getAttribute("memberMid");
	String memberPwd = (String)session.getAttribute("memberPwd");

%>	
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script src="../member/js/userjoin.js"></script>
<script src="../member/js/mypage.js"></script>

<style type="text/css">
	.table{
		margin : 0 auto;
		text-align :center;
	}
	
	.cs_func_page_header {
		width: 100%;
		height: 200px;
		text-align: center;
		padding-top: 55px; 
		border-bottom: 3px solid #000000;
	}
	
	.cs_category {
		font-size: 1.5em;
		font-weight: bold;
		margin-top: 40px;
		display: flex;
		justify-content: space-around;
		width: 60%;
		margin: 49px auto 0 auto;
		height: 50px;
	}
	.cs_category > a {
		display: inline-block;
		width: 150px;
		padding-bottom: 10px;
		color : black;
		text-decoration : none;
	}
	.cs_category > a:hover {
		border-bottom:6px solid #000000;
	}
	
	.cs_category > a:visited {
		color: #000000;
		
	}
	
	.div-container {
		width: 800px;
		margin: 100px auto 0 auto;
		border: 1px solid #d2d6dc;
		box-shadow: 0px 0px 10px 10px white;
		background-color: white;
		height: 1300px;
	}
	
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
		margin: 60px auto 50px auto;
		font-size: 30px;
	}
	
	.section-hr {
		width: 600px;
		margin: 30px auto 30px auto;
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
		width: 500px;
		height: 50px;
		text-indent: 15px;
	}
	
	.frm-input-id>input:first-child:hover {
		box-shadow: 0px 0px 2px 0px #202224;
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

<body>
	<!-- header -->
	<jsp:include page="/views/common/header.jsp"/>
	

	
	<div class="cs_func_page_header">
		<h1 style="font-size: 2em;">마이페이지</h1>
		<div class="cs_category">
			<a href="../member/mypage.jsp">정보수정</a>
			<a href="/">장바구니</a>
			<a href="/">주문내역</a>
			<a href="/">쿠폰함</a>
		</div>
	</div>
	
	<div class="div-container">

			<section class="section-one">	
				<div class="section-welcome">
					<h1 class="welcome-head">회원정보 수정</h1>
					<hr class="section-hr">
				</div>
			</section>
			<section class="section-two">
				<form class="frm-member" id="frmMember" name="frmMember" action="/semiTestPrj/member/mypage" method="post">
					<div class="frm-label">
						<label>아이디</label>
					</div>
					<div class="frm-input-id">
						<input style="font-weight:bold" type="text" name="frmId" readonly="readonly" value="${loginMember.getMemberMid() }">
					</div>

					<div class="frm-label">
						<label>현재 비밀번호</label>
					</div>
					<div class="frm-input-password">
						<input type="password" name="frmPassword" placeholder="현재 비밀번호">
					</div>
						
					<div class="frm-label">
						<label>새로운 비밀번호</label>
						
					</div>
					<div class="frm-input-password">
						<input type="password" name="re_frmPassword" placeholder="변경 할 비밀번호" value="">
						
					</div>
						
					<div class="frm-label">
						<label>이름</label>
					</div>
					<div class="frm-input-name">
						<input style="font-weight:bold" type="text" name="frmName" placeholder="성명을 입력해주세요." value="${loginMember.getMemberName() }">
					</div>
					
					<div class="frm-label">
						<label>이메일</label>
					</div>
					<div class="frm-input-email">
						<input style="font-weight:bold" type="text" name="frmEmail" placeholder="example@gmail.com" value="${loginMember.getMemberEmail() }">
					</div>
					

					<div class="frm-label">
						<label>전화번호</label>
					</div>
					<div class="frm-input-phone">
						<select name="phone_first">
							<option selected >010</option>
							<option>017</option>
						</select>
						<input style="font-weight:bold" type="text"  id="phoneNum" name="frmPhone" placeholder="0000-0000" maxlength="9" value="${loginMember.getMemberPhone() }">
					</div>

					<div class="frm-label">
						<label>주소</label>
					</div>
					<div class="frm-input-zipcode">
						<input style="font-weight:bold" type="text" name="zipcode" placeholder="우편번호" value="${loginMember.getMemberZipcode() }">
						<input style="font-weight:bold" type="button" name="btnZipcode" id="btnFindZip" value="우편번호검색">
						<input style="font-weight:bold" type="text" name="address" placeholder="상세주소" value="${loginMember.getMemberAddress() }">
					</div>
					
					<div class="frm-label">
						<label>생년월일</label>
					</div>
					<div class="frm-input-birth">
						<select>
							
							<% for(int i = 1900; i < 2020; i++) {%>
							<option selected><%= i+1%>년</option>
							<% } %>
						</select>
						
						<select>
							<% for(int i = 0; i < 31; i++) {%>
							<option><%= i+1%>일</option>
							<% } %>
						</select>
						
						<select>
							<% for(int i = 0; i < 12; i++) {%>
							<option><%= i+1%>월</option>
							<% } %>
						</select>

					</div>

					<div class="frm-submit">
						<input type="button" onclick="checkPwd()" name="frmSumbit" value="수정하기">
					</div>
				</form>
			</section>
		</div>
	
	<!-- footer영역 -->
	<%@include file="/views/common/footer.jsp" %>
	<script>
	member();
	phoneHypen();
	</script>
</body>
</html>