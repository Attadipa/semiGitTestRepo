<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="../member/css/idCheckForm.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="https://s3.ap-northeast-2.amazonaws.com/materials.spartacodingclub.kr/xmas/snow.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


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

<script type="text/javascript">

	$(document).ready(function() {
    	$("#checkBtn").on("click", function() {
       		idCheckFuntion();
    	});
	});

	function idCheckFuntion(){
		var frmId = $('#frmId').val();
		
		$.ajax({
			type : 'post',
			url : '/member/idCheck',
			//파리미터 변수 이름 : 값
			data: {frmId : frmId},
			success : function(result){
				if(result == 1) {
					$('#checkMessage').html('사용할 수 있는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-success');

				}else{
					$('#checkMessage').html('사용할 수 없는 아이디입니다.');
					$('#checkType').attr('class', 'modal-content panel-warning');
					
				}
				$('#checkModal').modal("show");
			}
		});
	}
	
</script>
</head>

<body class="body">
	<!-- header영역 -->
		<%@include file="/views/common/header.jsp" %>

	<div class="div-container">

		<section class="section-one">
			<div class="section-welcome">
				<div class="welcome-img">
					
					
	<h3>아이디 중복 확인</h3>
		<form method="post" action="/semiTestPrj/member/idCheck" name="frm">
			<table>
				<tr>
					<td><label for="id">아이디</label></td>
					<td><input type="text" name="frmId" id="id" value="${frmId }"></td>
					<td><button class="btn btn-primary"  type="button" id="checkBtn">중복체크</button></td>
				</tr>
				<tr>
					<td colspan="3"><c:choose>
							<c:when test="${result == 1 }">${frmId }는 사용중인 아이디입니다.</c:when>
							<c:when test="${result == -1 }">${frmId }가 사용가능한 아이디입니다. &nbsp;<input type="button" value="사용" onclick="idOk()"></c:when>
							
							<c:otherwise></c:otherwise>
						</c:choose></td>
				</tr>
			</table>
		</form>
					
					 
				</div>
			</div>
		</section>

	</div>


	<!-- footer영역 -->
    	<%@include file="/views/common/footer.jsp" %>

<script>
	
	function idCheck() {
		// 사용자 아이디가 입력되었는지 확인 루틴 구현
		if (document.joinForm.frmId.value == "") {
			alert("사용자 아이디를 입력해주세요.");
			document.joinForm.frmId.focus();
			return false;
		}
		// 아이디 중복 체크를 위한 페이지는 새로운 창에 출력한다.(idcheckForm.jsp)
		/* var url = "/semiTestPrj/member/idCheck?frmId=" + document.joinForm.FrmId.value;
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	} */
	
	function idOk(){
		opener.joinform.frmId.value = document.frm.frmId.value;
		opener.joinform.reid.value = document.frm.frmId.value;
		
		self.close();
	}
</script>

</body>
</html>