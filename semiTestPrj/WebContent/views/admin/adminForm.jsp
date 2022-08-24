<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberVo> voList = (List<MemberVo>)request.getAttribute("voList");

	MemberVo editMember = null; 
	editMember = (MemberVo)request.getAttribute("editMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지</title>
<style>
	#admin-category {
        width: 200px;
		height: 100%;
		background-image: linear-gradient(darkgreen, white);
    }
	#bold-font {
		font-weight: bold;
	}
	#table-show > tbody tr {
		cursor: pointer;
	}
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp"%>

	<br>
	
	<div class="row">
		<div class="col-4" style="padding-top: 30px; width: 15%;">
		  <div class="list-group" id="list-tab" role="tablist">
			<a class="list-group-item list-group-item-action active" id="admin-member-list" data-bs-toggle="list" href="#admin-member" role="tab" aria-controls="admin-member">회원관리</a>
			<a class="list-group-item list-group-item-action" id="admin-cs-list" data-bs-toggle="list" href="#admin-cs" role="tab" aria-controls="admin-cs">CS관리</a>
			<a class="list-group-item list-group-item-action" id="admin-event-list" data-bs-toggle="list" href="#admin-event" role="tab" aria-controls="admin-event">이벤트관리</a>
			<a class="list-group-item list-group-item-action" id="admin-graphs-list" data-bs-toggle="list" href="#admin-graph" role="tab" aria-controls="admin-graph">통계</a>
		  </div>
		</div>
		<div class="col-8">
		  <div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="admin-member" role="tabpanel" aria-labelledby="admin-member-list">
				<br>
				<h3 id="bold-font">회원검색</h3>
				<br>
				<form action="${contextPath}/admin/search" method="post">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="searchData" placeholder="회원의 성함이나 아이디를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
						<button class="btn btn-success" type="submit" id="button-addon2" onclick="showOn()">검색</button>
					</div>
				</form>
				<br>
				<hr>
				<br>
				<table class="table table-hover" border="1" style="<c:if test='${empty voList} '>display: none;</c:if>" id="table-show">
					<thead>
						<tr>
							<td>번호</td>
							<td>이름</td>
							<td>ID</td>
							<td>탈퇴여부</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${voList}">
							<tr data-bs-toggle="modal" href="#exampleModalToggle" role="button">
								<td>${vo.memberNo}</td>
								<td>${vo.memberName}</td>
								<td>${vo.memberMid}</td>
								<td>${vo.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="admin-cs" role="tabpanel" aria-labelledby="admin-cs-list">
				<br>
				<h3 id="bold-font" align="center">FAQ 등록</h3>
				<%@ include file="/views/admin/faqInsertForm.jsp" %>
			</div>
			<div class="tab-pane fade" id="admin-event" role="tabpanel" aria-labelledby="admin-event-list">
				<br>
				<h3 id="bold-font">메인배너 관리</h3>
				<%@ include file="/views/admin/eventBanner.jsp" %>
			</div>
			<div class="tab-pane fade" id="admin-graph" role="tabpanel" aria-labelledby="admin-graph-list">
				<br>
				<h3 id="bold-font">통계</h3>
			</div>
		  </div>
		</div>
	  </div>
	  
		<div class="modal fade" id="exampleModalToggle" tabindex="-1" aria-labelledby="exampleModalToggleLabel" aria-hidden="true">
  			<div class="modal-dialog modal-dialog-centered">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="exampleModalToggleLabel">회원 정보</h5>
        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      				</div>
      				<div class="modal-body">
        				<div id="memberName"></div>
        				<div id="memberId"></div>
        				<div id="memberStatus"></div>
      				</div>
      				<div class="modal-footer">
        				<button id="adminDelete" class="btn btn-danger" data-bs-dismiss="modal">회원추방</button>
        				<button class="btn btn-success" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#exampleModalToggle2" id="adminEdit">정보수정</button>
        				<button id="adminReturn" class="btn btn-primary">회원복구</button>
      				</div>
    			</div>
  			</div>
		</div>
		<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  			<div class="modal-dialog modal-dialog-centered">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h5 class="modal-title" id="exampleModalToggleLabel2">회원정보 수정</h5>
        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="history.back();"></button>
      				</div>
      				<div class="modal-body">
        				<form action="${contextPath}/admin/edit" method="post">
							<input type="hidden" id="editNo" name="num">
							<table>
								<tr>
									<td>아이디</td>
									<td><input type="text" id="editId" name="memberId" maxlength="15" required></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" id="editName" name="memberName" maxlength="5" required></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="text" id="editPwd" name="memberPwd" maxlength="20" required></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="tel" id="editPhone" name="memberPhone" placeholder="- 없이 입력" required></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="email" id="editEmail" name="memberEmail" required></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" id="editAddress" name="memberAddress" required></td>
								</tr>
								<tr>
									<td>우편번호</td>
									<td><input type="text" id="editZipCode" name="memberZipcode" required></td>
								</tr>
								<tr>
									<td>등급</td>
									<td>
										<select id="editGrade" name="memberGrade">
											<option value="N">일반회원</option>
											<option value="P">프리미엄</option>
											<option value="A">관리자</option>
										</select>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<input type="submit" value="정보변경" class="btn btn-success">
									</td>
								</tr>
							</table>
						</form>
      				</div>
   				 </div>
  			</div>
		</div>
		
		
	  
	
	<%@ include file="/views/cs/common/oneByOne.jsp"%>

	<script>
		function showOn(){
			$('#table-show').show();
		}
		
		$(function(){
			$('#table-show>tbody>tr').click(function(){
				const num = $(this).children().eq(0).text();
				
				$('#memberName').html("이름 : " + $(this).children().eq(1).text());
				$('#memberId').html("ID : " + $(this).children().eq(2).text());
				$('#memberStatus').html("탈퇴여부 : " + $(this).children().eq(3).text());
				
				$('#adminDelete').click(function(){
					 if(confirm("회원을 추방하시겠습니까?")) {
						location.href = '/semiTestPrj/admin/delete?num=' + num;
					 }
				})
				
				$('#adminReturn').click(function(){
					 if(confirm("회원을 복구시키겠습니까?")) {
						location.href = '/semiTestPrj/admin/return?num=' + num;
					 }
				})
				
				$('#adminEdit').click(function(){
					$.ajax({
						url : "/semiTestPrj/admin/edit?num=" + num,
						method : "GET",
						success : function(x){
							console.log("통신성공 !");
							
							const editVo = JSON.parse(x);
							
							$('#editNo').val(editVo.memberNo);
							$('#editId').val(editVo.memberMid);
							$('#editName').val(editVo.memberName);
							$('#editPwd').val(editVo.memberPwd);
							$('#editPhone').val(editVo.memberPhone);
							$('#editEmail').val(editVo.memberEmail);
							$('#editAddress').val(editVo.memberAddress);
							$('#editZipCode').val(editVo.memberZipcode);
							$("#editGrade").val(editVo.memberGrade);
						},
						error : function(request, status, error){
							console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});	
				})
			});
		})
		
		
		
		
		
	</script>

</body>
</html>