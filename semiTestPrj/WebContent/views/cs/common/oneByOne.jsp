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
      position: inline;
      float: right;
      width: 50%;
      border: 1px solid white;
      border-radius: 20px;
      padding: 6px;
      background-color: rgb(163, 255, 163);
    }

    #chat-oppo {
      position: inline;
      float: left;
      width: 50%;
      border: 1px solid white;
      border-radius: 20px;
      padding: 6px;
      background-color: rgb(172, 255, 251);
    }

    #chat-new-line {
      clear: both;
    }
    
    .chat-modal-auto {
    	overflow: hidden;
    	width: auto;
    	height: auto;
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
        			<div id="chatting-zone">
		            </div>
        		</div>
        		<div class="modal-footer">
        			<table>
        				<tr>
        					<td><textarea id="messageContent" minlength="10" maxlength="100" style="width: 400px; vertical-align: middle; resize: none;" name="message"></textarea></td>
        					<td><input type ="button" id="sendMessage" class="btn btn-info" style="height:55px; vertical-align:middle;" value="전송"></td>
        				</tr>
        			</table>
        		</div>
      		</div>
    	</div>
  	</div>
  
  <script>
  		$('#sendMessage').click(function(){
  			const content = $('#messageContent').val();
  			<c:if test="${not empty loginMember.memberNo}">
				const num = ${loginMember.memberNo};
				const grade = ${loginMember.memberGrade};
			</c:if>
  			
  			if(content.length >= 10) {
	  			$.ajax({
	  				url : "/semiTestPrj/cs/chat",
	  				data : {"content" : content, "num" : num, "grade" : grade},
	  				method : "POST",
	  				success : function(x){
	  					console.log("통신성공 !");
	  					
	  					let tagArea = document.getElementById('chatting-zone');
	  					let newTag = document.createElement('div');
	  				 	newTag.setAttribute("id", "chat-me");
	  				  
	  				  	newTag.innerHTML = content;
	  				  	
	  					let newTag2 = document.createElement('div');
	  				 	newTag2.setAttribute("id", "chat-new-line");
	  				 	
	  				 	let newBr = document.createElement('br');
	  				  
	  				  	tagArea.appendChild(newTag);
	  				  	tagArea.appendChild(newTag2);
	  				  	tagArea.appendChild(newBr);
	  				},
	  				error : function(request, status, error) {
	  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  				}
	  			});
  			}else{
  				alert('문의는 10글자 이상 100글자 이하로 전송해주세요!');
  			}
  		});
  		
  		$('#chat-modal').click(function(){
  			<c:if test="${not empty loginMember.memberNo}">
  				const num = ${loginMember.memberNo};
  				const grade = ${loginMember.memberGrade};
  			</c:if>
  			
  			if(grade == "1"){
  				$.ajax({
  					url : "/semiTestPrj/cs/member",
  					method : "GET",
  					success : function(x){
  						console.log("통신성공 !");
  						
  						
  					}
  				})
  			}
  			
  			$.ajax({
  				url : "/semiTestPrj/cs/chat?num=" + num,
  				method : "GET",
  				success : function(x){
  					console.log("통신성공 !");
  					
  					const list = JSON.parse(x);
  					
  					let tagArea = document.getElementById('chatting-zone');
  					
  					if(grade != '1'){
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
  					
  					for(const i in list){
  						if((list[i].grade != '1') && (list[i].grade == grade)){
  							let newTag = document.createElement('div');
  		  				 	newTag.setAttribute("id", "chat-me");
  		  				  
  		  				  	newTag.innerHTML = list[i].content;
  		  				  	
  		  					let newTag2 = document.createElement('div');
		  				 	newTag2.setAttribute("id", "chat-new-line");
		  				 	
		  				 	let newBr = document.createElement('br');
		  				  
		  				  	tagArea.appendChild(newTag);
		  				  	tagArea.appendChild(newTag2);
		  				  	tagArea.appendChild(newBr);
  						} else if((list[i].grade == '1') && (list[i].grade != grade)) {
  							let newTag = document.createElement('div');
  		  				 	newTag.setAttribute("id", "chat-oppo");
  		  				  
  		  				  	newTag.innerHTML = list[i].content;
  		  				  	
  		  					let newTag2 = document.createElement('div');
		  				 	newTag2.setAttribute("id", "chat-new-line");
		  				 	
		  				 	let newBr = document.createElement('br');
		  				  
		  				  	tagArea.appendChild(newTag);
		  				  	tagArea.appendChild(newTag2);
		  				  	tagArea.appendChild(newBr);
  						}
  						
  					}
  				},
  				error : function(request, status, error) {
  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  				}
  			})
  			
  			
  		})
  		
  		const myModalEl = document.getElementById('oneByOne')
		myModalEl.addEventListener('hidden.bs.modal', function (event) {
			$('#chatting-zone').remove();
			const newTag3 = document.createElement('div');
			newTag3.setAttribute("id", "chatting-zone");
			let tagArea2 = document.getElementById('create-zone');
			tagArea2.appendChild(newTag3);
		})
  </script>
</body>
</html>