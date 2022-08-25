<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#chat-modal {
        position: fixed;
        display: block;
        height: 80px;
        width: 80px;
        border-radius: 50%;
        background-image: url("/semiTestPrj/views/cs/resources/image/cs-messanger.png");
        background-repeat: no-repeat;
        background-position: center;
        background-color: rgba(0, 0, 0, 0);
        border: 0px;
        bottom: 5%;
        right: 5%;
    }

    #chat-modal:hover {
        background-image: url("/semiTestPrj/views/cs/resources/image/cs-messanger2.png");
        cursor: pointer;
    }

    .modal-down {
        vertical-align: bottom;
        float: right;
    }

    #chat-me {
      position: block;
      float: right;
      width: 50%;
      border: 1px solid white;
      border-radius: 20px;
      padding: 6px;
      background-color: rgb(163, 255, 163);
    }
    
    #date-me {
      position: inline;
      float: right;
      text-align: right;
      width: 50%;
      padding: 6px;
      font-size: 10px;
	  vertical-align: bottom;
    }

    #chat-oppo {
      position: inline;
      float: left;
      width: 50%;
      border: 1px solid white;
      border-radius: 20px;
      padding: 6px;
      background-color: rgb(219, 255, 118);
    }
    
    #date-oppo {
      position: inline;
      float: left;
      width: 50%;
      padding: 6px;
      font-size: 10px;
	  vertical-align: bottom;
    }

    #chat-new-line {
      clear: both;
    }
    
    .chat-modal-auto {
    	overflow: hidden;
    	width: auto;
    	height: auto;
    }
    
    #memberList-zone :hover {
    	background-color: black;
    	color: white;
    }
    
</style>
</head>
<body>

	<c:if test="${not empty loginMember}">
		<div id="chat-modal" data-bs-toggle="modal" data-bs-target="#oneByOne"></div>
	</c:if>

  	<div class="modal modal-down fade" id="oneByOne" tabindex="-1" aria-labelledby="oneByOneLabel" aria-hidden="true">
    	<div class="modal-dialog modal-down modal-dialog-scrollable">
      		<div class="modal-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="oneByOneLabel">1대1 문의</h5>
            		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body" id="create-zone">
        			<c:if test="${loginMember.memberGrade eq 'A'}">
	        			<table class="table" id="memberList-zone" border="1">   
	        			</table>
        			</c:if>
        			<div id="chatting-zone">
		            </div>
        		</div>
        		<div class="modal-footer">
        			<table>
        				<tr>
        					<td><textarea id="messageContent" maxlength="100" style="width: 400px; vertical-align: middle; resize: none;" name="message"></textarea></td>
        					<td><input type ="button" id="sendMessage" class="btn btn-info" style="height:55px; vertical-align:middle;" value="전송"></td>
        				</tr>
        			</table>
        		</div>
      		</div>
    	</div>
  	</div>
  
  <script>
  		
		
  		$('#chat-modal').click(function(){
 			let num = ${loginMember.memberNo};
 			let grade = '${loginMember.memberGrade}';
 			
  			
  			if(grade == 'A'){
  				$.ajax({
  					url : "/semiTestPrj/cs/member",
  					method : "GET",
  					success : function(x){
  						console.log("AJAX : 관리자 채팅용 회원 리스트 띄우기 성공 !");
		  	  			$('.modal-footer').hide();
  	  					
  	  					let list = JSON.parse(x);
  	  					
  	  					let listArea = document.getElementById('memberList-zone');
  	  					
  	  					for(let i in list){
	  	  					let newTr = document.createElement('tr');
  	  						newTr.setAttribute("class", "showChatTr");
	  	  					newTr.setAttribute("role", "button");
	  	  					listArea.appendChild(newTr);
	  	  					
	  	  					let newNo = document.createElement('td');
	  	  					newNo.setAttribute("id", "numWho");
	  	  					newNo.style.display = 'none';
	  	  					let newName = document.createElement('td');
	  	  					newName.style.width = '75px';
	  	  					let newContent = document.createElement('td');
	  	  					newNo.innerHTML = list[i].memberNo;
	  	  					newName.innerHTML = list[i].memberName;
	  	  					newContent.innerHTML = list[i].content;
	  	  					
		  	  				newTr.appendChild(newNo);
		  	  				newTr.appendChild(newName);  	  						
		  	  				newTr.appendChild(newContent);
		  	  				
  	  					}
  	  					
	  	  				$('.showChatTr').click(function(){
	  			  			let num = $(this).children().eq(0).html();
	  			  			console.log(num);
	  			  			
	  			  			showChat(num);
	  			  			
		  			  		$('#sendMessage').click(function(){
		  			  			let content = $('#messageContent').val();
		  						let grade = '${loginMember.memberGrade}';
		  						var today = new Date();
		  						
		  						var year = today.getFullYear().toString().substring(2);
		  						var month = ('0' + (today.getMonth() + 1)).slice(-2);
		  						var day = ('0' + today.getDate()).slice(-2);
		  						var todayFormat = year + '/' + month  + '/' + day;
		  						
		  						var hours = ('0' + today.getHours()).slice(-2); 
		  						var minutes = ('0' + today.getMinutes()).slice(-2);
		  						var timeFormat = hours + ':' + minutes;
		  			  			
		  			  			if(content.length >= 10) {
		  				  			$.ajax({
		  				  				url : "/semiTestPrj/cs/chat",
		  				  				data : {"content" : content, "num" : num, "grade" : grade},
		  				  				method : "POST",
		  				  				success : function(x){
		  				  					console.log("관리자 채팅 입력 성공 !");
		  				  					
		  				  					let tagArea = document.getElementById('chatting-zone');
		  				  					let newTag = document.createElement('div');
		  				  				 	newTag.setAttribute("id", "chat-me");
		  				  				 	let newDate = document.createElement('div');
		  					  				newDate.setAttribute("id", "date-me");
		  				  				  
		  				  				  	newTag.innerHTML = content;
		  				  				  	newDate.innerHTML = todayFormat + " " + timeFormat;
		  				  				  	
		  				  					let newTag2 = document.createElement('div');
		  				  				 	newTag2.setAttribute("id", "chat-new-line");
		  				  				 	
		  				  				 	let newBr = document.createElement('br');
		  				  				  
		  				  				  	tagArea.appendChild(newTag);
		  				  				  	tagArea.appendChild(newDate);
		  				  				  	tagArea.appendChild(newTag2);
		  				  				  	tagArea.appendChild(newBr);
	
		  									$('#messageContent').val('');
		  				  				},
		  				  				error : function(request, status, error) {
		  				  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		  				  				}
		  				  			});
		  			  			}else{
		  			  				alert('문의는 10글자 이상 100글자 이하로 전송해주세요!');
		  			  			}
		  			  		});
	  			  			
	  			  		})
  					},
  					error : function(request, status, error) {
  	  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  	  				}
  				})
  				
  			}else{
  				showChat(num);
  			}
  			
  			
  			
  		})
  		
  		
  		
  		
		function showChat(memNo){
  			const grade = '${loginMember.memberGrade}';
  			
  			$('#create-zone').scrollTop($('#create-zone')[0].scrollHeight);
  			$('#memberList-zone').hide();
  			$('.modal-footer').show();
  			
  			$.ajax({
  				url : "/semiTestPrj/cs/chat?num=" + memNo,
  				method : "GET",
  				success : function(x){
  					console.log("AJAX : 채팅창 띄우기 성공 !");
  					
  					let list = JSON.parse(x);
  					
  					let tagArea = document.getElementById('chatting-zone');
  					
  					if(grade != 'A'){
  						let newTag = document.createElement('div');
	  				 	newTag.setAttribute("id", "chat-oppo");
	  				  
	  				  	newTag.innerHTML = "안녕하세요? 아나바다입니다. 무엇을 도와드릴까요?";
	  				  	
	  					let newTag2 = document.createElement('div');
	  				 	newTag2.setAttribute("id", "chat-new-line");
	  				 	
	  				 	let newBr = document.createElement('br');
	  				  
	  				  	tagArea.appendChild(newTag);
	  				  	tagArea.appendChild(newTag2);
	  				  	tagArea.appendChild(newBr);
  					}
  					
  					for(let i in list){
  						if(list[i].grade == grade){
  							let newTag = document.createElement('div');
  		  				 	newTag.setAttribute("id", "chat-me");
  		  				 	let newDate = document.createElement('div');
  		  				 	newDate.setAttribute("id", "date-me");
  		  				  
  		  				  	newTag.innerHTML = list[i].content;
  		  				 	newDate.innerHTML = list[i].chatDate;
  		  				  	
  		  					let newTag2 = document.createElement('div');
		  				 	newTag2.setAttribute("id", "chat-new-line");
		  				 	
		  				 	let newBr = document.createElement('br');
		  				  
		  				  	tagArea.appendChild(newTag);
		  				  	tagArea.appendChild(newDate);
		  				  	tagArea.appendChild(newTag2);
		  				  	tagArea.appendChild(newBr);
  						} else if(list[i].grade != grade) {
  							let newTag = document.createElement('div');
  		  				 	newTag.setAttribute("id", "chat-oppo");
  		  					let newDate = document.createElement('div');
		  				 	newDate.setAttribute("id", "date-oppo");
  		  				  
  		  				  	newTag.innerHTML = list[i].content;
  		  					newDate.innerHTML = list[i].chatDate;
  		  				  	
  		  					let newTag2 = document.createElement('div');
		  				 	newTag2.setAttribute("id", "chat-new-line");
		  				 	
		  				 	let newBr = document.createElement('br');
		  				  
		  				  	tagArea.appendChild(newTag);
		  				  	tagArea.appendChild(newDate);
		  				  	tagArea.appendChild(newTag2);
		  				  	tagArea.appendChild(newBr);
  						} else {
  							$('#chatting-zone').html("ERROR");
  						}
  						
  					}
  				},
  				error : function(request, status, error) {
  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  				}
  			})
 				
 			}
  		
  		if('${loginMember.memberGrade}' != 'A') {
	  		$('#sendMessage').click(function(){
	  			let content = $('#messageContent').val();
				let grade = '${loginMember.memberGrade}';
				let num = ${loginMember.memberNo};	
				var today = new Date();
				
				var year = today.getFullYear().toString().substring(2);
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var todayFormat = year + '/' + month  + '/' + day;
				
				var hours = ('0' + today.getHours()).slice(-2); 
				var minutes = ('0' + today.getMinutes()).slice(-2);
				var timeFormat = hours + ':' + minutes;
	  			
	  			if(content.length >= 10) {
		  			$.ajax({
		  				url : "/semiTestPrj/cs/chat",
		  				data : {"content" : content, "num" : num, "grade" : grade},
		  				method : "POST",
		  				success : function(x){
		  					console.log("회원채팅 입력 성공 !");
		  					
		  					let tagArea = document.getElementById('chatting-zone');
		  					let newTag = document.createElement('div');
		  				 	newTag.setAttribute("id", "chat-me");
		  				 	let newDate = document.createElement('div');
			  				newDate.setAttribute("id", "date-me");
		  				  
		  				  	newTag.innerHTML = content;
		  				  	newDate.innerHTML = todayFormat + " " + timeFormat;
		  				  	
		  					let newTag2 = document.createElement('div');
		  				 	newTag2.setAttribute("id", "chat-new-line");
		  				 	
		  				 	let newBr = document.createElement('br');
		  				  
		  				  	tagArea.appendChild(newTag);
		  				  	tagArea.appendChild(newDate);
		  				  	tagArea.appendChild(newTag2);
		  				  	tagArea.appendChild(newBr);
	
							$('#messageContent').val('');
		  				},
		  				error : function(request, status, error) {
		  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		  				}
		  			});
	  			}else{
	  				alert('문의는 10글자 이상 100글자 이하로 전송해주세요!');
	  			}
	  		});
  		}
  		
  		
	  		const myModalEl = document.getElementById('oneByOne')
			myModalEl.addEventListener('hidden.bs.modal', function (event) {
				$('#memberList-zone').remove();
				$('#chatting-zone').remove();
				let newTable = document.createElement('table');
				newTable.setAttribute("id", "memberList-zone");
				newTable.setAttribute("class", "table");
				newTable.setAttribute("border", "1");
				let newTag3 = document.createElement('div');
				newTag3.setAttribute("id", "chatting-zone");
				let tagArea2 = document.getElementById('create-zone');
				tagArea2.appendChild(newTable);
				tagArea2.appendChild(newTag3);
			})
  </script>
</body>
</html>