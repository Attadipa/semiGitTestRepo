<%@page import="com.kh.common.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	PageVo pv = (PageVo)request.getAttribute("pv");

	int currentPage = pv.getCurrentPage();
	int startPage = pv.getStartPage();
	int endPage = pv.getEndPage();
	int maxPage = pv.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.eventListZone {
		position: relative;
		width: 70%;
		margin: 0 auto;
		background-color: #d1e7dd;
	}

	.down-center {
		position: absolute;
		right: 5%;
		bottom: 0%;
	}
	
	.page-area {
		margin : auto;
		text-align : center;
	}
</style>
</head>
<body>

	<div class="eventListZone" id="eventListZoneId">
		<table class="table table-success table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>이벤트명</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody id="eventList">
			</tbody>
		</table>
	</div>
	<br><br>

	<div class="offcanvas offcanvas-end" tabindex="-1" id="showEventDetail" aria-labelledby="showEventDetailLabel">
		<div class="offcanvas-header">
			<h5 id="showEventDetailLabel">이벤트 상세정보</h5>
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			
		</div>
	</div>


	<div class="offcanvas offcanvas-end" tabindex="-1" id="writeEvent" aria-labelledby="writeEventLabel" style="width: auto;">
		<div class="offcanvas-header">
			<h5 id="writeEventLabel">이벤트 작성</h5>
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="form-floating mb-3">
				<div class="row">
					<form action="${contextPath}/event/insert" method="post" enctype="multipart/form-data">
						<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<tbody>
								<tr>
									<td colspan="5" ><input type="text" class="form-control" placeholder="이벤트명" name="title" maxlength="50" required></td>
								</tr>
								<tr>
									<td colspan="5"><textarea placeholder="이벤트 내용" name="content" maxlength="2048" style="height:500px; width: 100%;" required></textarea></td>
								</tr>
								<tr>
									<td colspan="5" ><input type="file" name="file"></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="memberName" value="${loginMember.memberName}">	
						<input type="submit" class="btn btn-success" value="글쓰기">
					</form>
					</div>
			</div>
		</div>
	</div>
	
	<script>
		$('#admin-event-list').click(function(){
			$.ajax({
				url : "/semiTestPrj/event/list",
				method : "GET",
				success : function(x){
					console.log("전체 이벤트 출력 성공 !");
					
					let list = JSON.parse(x);
					
					let listArea = document.getElementById('eventList');
					
					for(let i in list){
  	  					let newTr = document.createElement('tr');
  						newTr.setAttribute("data-bs-toggle", "offcanvas");
  						newTr.setAttribute("data-bs-target", "#showEventDetail");
  						newTr.setAttribute("aria-controls", "showEventDetail");
  	  					newTr.setAttribute("role", "button");
  	  					listArea.appendChild(newTr);
  	  					
  	  					let newNo = document.createElement('td');
  	  					let newTitle = document.createElement('td');
  	  					let newName = document.createElement('td');
  	  					newName.style.width = '75px';
  	  					newNo.innerHTML = list[i].no;
  	  					newTitle.innerHTML = list[i].title;
  	  					newName.innerHTML = list[i].writer;
  	  					
	  	  				newTr.appendChild(newNo);
	  	  				newTr.appendChild(newTitle);
	  	  				newTr.appendChild(newName);  	  						
	  	  				
  					}
					
				},
				error : function(request, status, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			let tableArea = document.getElementById('eventListZoneId');
			let newBr = document.createElement('br');
			let newBt = document.createElement('button');
			newBt.setAttribute("id", "insert-event");
			newBt.setAttribute("class", "down-center btn btn-success");
			newBt.setAttribute("data-bs-toggle", "offcanvas");
			newBt.setAttribute("data-bs-target", "#writeEvent");
			newBt.setAttribute("aria-controls", "writeEvent");
			newBt.innerHTML = "글쓰기";
			tableArea.appendChild(newBr);
			tableArea.appendChild(newBr);
			tableArea.appendChild(newBt);
		})
	</script>

</body>
</html>