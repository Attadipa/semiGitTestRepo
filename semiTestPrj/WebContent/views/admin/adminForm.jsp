<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<a class="list-group-item list-group-item-action" id="admin-ads-list" data-bs-toggle="list" href="#admin-ads" role="tab" aria-controls="admin-ads">광고관리</a>
		  </div>
		</div>
		<div class="col-8">
		  <div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="admin-member" role="tabpanel" aria-labelledby="admin-member-list">
				<br>
				<h3 id="bold-font">회원검색</h3>
				<br>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="회원의 성함이나 닉네임을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-success" type="button" id="button-addon2" onclick="showOn()">검색</button>
				</div>
				<br>
				<hr>
				<br>
				<table class="table table-hover" border="1" style="display: none;" id="table-show">
					<thead>
						<tr>
							<td>No</td>
							<td>Name</td>
							<td>Nickname</td>
							<td>ID</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>5</td>
							<td>남재현</td>
							<td>죄현</td>
							<td>user5</td>
						</tr>
						<tr>
							<td>8</td>
							<td>박성현</td>
							<td>박성현</td>
							<td>user8</td>
						</tr>
						<tr>
							<td>11</td>
							<td>박한솔</td>
							<td>박한솔</td>
							<td>user11</td>
						</tr>
						<tr>
							<td>15</td>
							<td>서교상</td>
							<td>서교상</td>
							<td>user15</td>
						</tr>
						<tr>
							<td>22</td>
							<td>이아름</td>
							<td>이아름</td>
							<td>user22</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tab-pane fade" id="admin-cs" role="tabpanel" aria-labelledby="admin-cs-list">
				<h3 id="bold-font" align="center";>FAQ 등록</h3>
				<%@ include file="/views/admin/faqInsertForm.jsp"%>
			</div>
			<div class="tab-pane fade" id="admin-event" role="tabpanel" aria-labelledby="admin-event-list">
				<br>
				<h3 id="bold-font">메인배너 관리</h3>
			</div>
			<div class="tab-pane fade" id="admin-ads" role="tabpanel" aria-labelledby="admin-ads-list">
				<br>
				<h3 id="bold-font">판매자 광고 관리</h3>
			</div>
		  </div>
		</div>
	  </div>
	
	<%@ include file="/views/cs/common/oneByOne.jsp"%>

	<script>
		function showOn(){
			$('#table-show').show();
		}
	</script>

</body>
</html>