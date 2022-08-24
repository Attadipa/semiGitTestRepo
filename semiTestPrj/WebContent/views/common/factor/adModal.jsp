<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.adModal-footer{justify-content: flex-start;}
		.adModal{
			position: fixed;
			top: 20%;
			bottom: 50%;
		}
		.adModal-footer>div{padding-left: 150px;}
		.adModal-footer a{text-decoration: none;}
	</style>
</head>
<body>
	<!-- The Modal -->
	<div class="modal adModal" id="adModal">
		<div class="modal-dialog">
   			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
				  <h4 class="modal-title">무신사(광고)</h4>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="closeModal()"></button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<strong>뷰티 구매 고객이라면 누구나!</strong>
					<br>
					<br>
					<p>
						최대 20% 쿠폰팩
						8/26(금) 11시 까지만!
					</p>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer adModal-footer">
					<strong>
						<a href="https://www.musinsa.com">무신사로 달려가기</a>
					</strong>
					<div>
						<a href="${contextPath}/member/login">광고 그만 볼래요.</a>
					</div>
				</div>

	    	</div>
		</div>
	</div>
	
	<script>

		const modal = $('.adModal');
		$(function onAd(){
			modal.css('display','block');
			
		})
		
		function closeModal(){
			modal.css('display','none');
		}
		
		
		
	</script>
	
</body>
</html>