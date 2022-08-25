<%@page import="com.kh.common.PageVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		right: 3%;
		bottom: 2%;
	}
	
	.page-area {
		margin : auto;
		text-align : center;
	}
	
	.page-area * {
		margin : 1px;
	}
</style>
</head>
<body>

	<div class="eventListZone" id="eventListZoneId">
		<table class="table table-success table-hover" id="createTable">
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
		<div id="createZone">
			<div class="page-area" id="pageArea">
			</div>
		</div>
	</div>
	<br><br>

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
						<input type="hidden" name="memberNo" value="${loginMember.memberNo}">	
						<input type="submit" class="btn btn-success" value="글쓰기">
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
		if(location.href.slice(-12) == 'event/member'){
			$(document).ready(function(){
				$('#pageArea').remove();
				let createArea = document.getElementById('createZone');
				let newPage = document.createElement('div');
				newPage.setAttribute("class", "page-area");
				newPage.setAttribute("id", "pageArea");
				createArea.appendChild(newPage);
				
				$('#eventList').remove();
				let createArea2 = document.getElementById('createTable');
				let newTBody = document.createElement('tbody');
				newTBody.setAttribute("id", "eventList");
				createArea2.appendChild(newTBody);
					
				$.ajax({
					url : "/semiTestPrj/event/list?p=1",
					method : "GET",
					success : function(x){
						console.log("페이지 1의 이벤트 출력 성공 !");
						
						let map = JSON.parse(x);
						let pv = JSON.parse(map.pv);
						let list = JSON.parse(map.list);
						
						let listArea = document.getElementById('eventList');
						
						for(let i in list){
	  	  					let newTr = document.createElement('tr');
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
	  	  				let pageArea = document.getElementById('pageArea');
	  	  				
	  	  				console.log(pv.currentPage);
	  	  				
	  	  				if(pv.currentPage != 1) {
		  	  				let newA = document.createElement('button');
		  	  				newA.setAttribute("class", "btn btn-sm btn-success click-event");
		  	  				newA.value = pv.currentPage-1;
		  	  				newA.innerHTML = "&lt;";
		  	  				pageArea.appendChild(newA);
	  	  				}
	  	  				
	  	  				for(let i = pv.startPage; i <= pv.endPage; ++i){
	  	  					if(i == pv.currentPage){
		  	  					let newA2 = document.createElement('button');
			  	  				newA2.setAttribute("class", "btn btn-sm btn-success click-event");
			  	  				newA2.value = i;
			  	  				newA2.innerHTML = i;
			  	  				pageArea.appendChild(newA2);
	  	  					}else{
		  	  					let newA3 = document.createElement('button');
			  	  				newA3.setAttribute("class", "btn btn-sm btn-success click-event");
			  	  				newA3.value = i;
			  	  				newA3.innerHTML = i;
			  	  				pageArea.appendChild(newA3);
	  	  					}
	  	  				}
	  	  				
	  	  				if(pv.currentPage != pv.maxPage) {
	  	  					let currentPlus = pv.currentPage + 1;
		  	  				let newA4 = document.createElement('button');
		  	  				newA4.setAttribute("class", "btn btn-sm btn-success click-event");
		  	  				newA4.value = currentPlus;
		  	  				newA4.innerHTML = "&gt;";
		  	  				pageArea.appendChild(newA4);
	  	  				}
	  	  				
					},
					error : function(request, status, error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			});
		}
	
		$('#admin-event-list').click(function(){
			$('#pageArea').remove();
			let createArea = document.getElementById('createZone');
			let newPage = document.createElement('div');
			newPage.setAttribute("class", "page-area");
			newPage.setAttribute("id", "pageArea");
			createArea.appendChild(newPage);
			
			$('#eventList').remove();
			let createArea2 = document.getElementById('createTable');
			let newTBody = document.createElement('tbody');
			newTBody.setAttribute("id", "eventList");
			createArea2.appendChild(newTBody);
				
			$.ajax({
				url : "/semiTestPrj/event/list?p=1",
				method : "GET",
				success : function(x){
					console.log("페이지 1의 이벤트 출력 성공 !");
					
					let map = JSON.parse(x);
					let pv = JSON.parse(map.pv);
					let list = JSON.parse(map.list);
					
					let listArea = document.getElementById('eventList');
					
					for(let i in list){
  	  					let newTr = document.createElement('tr');
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
  	  				let pageArea = document.getElementById('pageArea');
  	  				
  	  				console.log(pv.currentPage);
  	  				
  	  				if(pv.currentPage != 1) {
	  	  				let newA = document.createElement('button');
	  	  				newA.setAttribute("class", "btn btn-sm btn-success click-event");
	  	  				newA.value = pv.currentPage-1;
	  	  				newA.innerHTML = "&lt;";
	  	  				pageArea.appendChild(newA);
  	  				}
  	  				
  	  				for(let i = pv.startPage; i <= pv.endPage; ++i){
  	  					if(i == pv.currentPage){
	  	  					let newA2 = document.createElement('button');
		  	  				newA2.setAttribute("class", "btn btn-sm btn-success click-event");
		  	  				newA2.value = i;
		  	  				newA2.innerHTML = i;
		  	  				pageArea.appendChild(newA2);
  	  					}else{
	  	  					let newA3 = document.createElement('button');
		  	  				newA3.setAttribute("class", "btn btn-sm btn-success click-event");
		  	  				newA3.value = i;
		  	  				newA3.innerHTML = i;
		  	  				pageArea.appendChild(newA3);
  	  					}
  	  				}
  	  				
  	  				if(pv.currentPage != pv.maxPage) {
  	  					let currentPlus = pv.currentPage + 1;
	  	  				let newA4 = document.createElement('button');
	  	  				newA4.setAttribute("class", "btn btn-sm btn-success click-event");
	  	  				newA4.value = currentPlus;
	  	  				newA4.innerHTML = "&gt;";
	  	  				pageArea.appendChild(newA4);
  	  				}
  	  				
				},
				error : function(request, status, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
		});
		
		$(document).on("click", ".click-event", function(){
				
			$('#pageArea').remove();
			let createArea = document.getElementById('createZone');
			let newPage = document.createElement('div');
			newPage.setAttribute("class", "page-area");
			newPage.setAttribute("id", "pageArea");
			createArea.appendChild(newPage);
			
			$('#eventList').remove();
			let createArea2 = document.getElementById('createTable');
			let newTBody = document.createElement('tbody');
			newTBody.setAttribute("id", "eventList");
			createArea2.appendChild(newTBody);
					
					
			let numPage = $(this).val();
			console.log(numPage);
			$.ajax({
				url : "/semiTestPrj/event/list?p=" + numPage,
				method : "GET",
				success : function(x){
					console.log("페이지 "+ numPage +"의 이벤트 출력 성공 !");
					
					let map = JSON.parse(x);
					let pv = JSON.parse(map.pv);
					let list = JSON.parse(map.list);
					
					let listArea = document.getElementById('eventList');
					
					for(let i in list){
	 	  					let newTr = document.createElement('tr');
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
	 	  				let pageArea = document.getElementById('pageArea');
	 	  				
	 	  				console.log(pv.currentPage);
	 	  				
	 	  				if(pv.currentPage != 1) {
	  	  				let newA = document.createElement('button');
	  	  				newA.setAttribute("class", "btn btn-sm btn-success click-event");
	  	  				newA.value = pv.currentPage-1;
	  	  				newA.innerHTML = "&lt;";
	  	  				pageArea.appendChild(newA);
	 	  				}
	 	  				
	 	  				for(let i = pv.startPage; i <= pv.endPage; ++i){
	 	  					if(i == pv.currentPage){
			  	  					let newA2 = document.createElement('button');
				  	  				newA2.setAttribute("class", "btn btn-sm btn-success click-event");
				  	  				newA2.value = i;
				  	  				newA2.innerHTML = i;
				  	  				pageArea.appendChild(newA2);
	 	  					}else{
			  	  					let newA3 = document.createElement('button');
				  	  				newA3.setAttribute("class", "btn btn-sm btn-success click-event");
				  	  				newA3.value = i;
				  	  				newA3.innerHTML = i;
				  	  				pageArea.appendChild(newA3);
	 	  					}
	 	  				}
	 	  				
	 	  				if(pv.currentPage != pv.maxPage) {
	 	  					let currentPlus = pv.currentPage + 1;
			  	  				let newA4 = document.createElement('button');
			  	  				newA4.setAttribute("class", "btn btn-sm btn-success click-event");
			  	  				newA4.value = currentPlus;
			  	  				newA4.innerHTML = "&gt;";
			  	  				pageArea.appendChild(newA4);
	 	  				}
					
				},
				error : function(request, status, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
		
		let tableArea = document.getElementById('eventListZoneId');
		let newBr = document.createElement('br');
		tableArea.appendChild(newBr);
		tableArea.appendChild(newBr);
		
		
		if('${loginMember.memberGrade}' == 'A'){
			let newBt = document.createElement('button');
			newBt.setAttribute("id", "insert-event");
			newBt.setAttribute("class", "down-center btn btn-success");
			newBt.setAttribute("data-bs-toggle", "offcanvas");
			newBt.setAttribute("data-bs-target", "#writeEvent");
			newBt.setAttribute("aria-controls", "writeEvent");
			newBt.innerHTML = "글쓰기";
			tableArea.appendChild(newBt);
		}
		
	</script>
	
	<script>
		$(document).on("click", "#eventList>tr", function(){
				//행 클릭 되었을 때, 동작할 내용
				
				//글 번호 가져오기
				let num = $(this).children().eq(0).text();
				console.log(num);
				//해당 번호 이용해서 요청 보내기
				location.href = '/semiTestPrj/event/detail?num='+ num;
			});
	</script>

</body>
</html>