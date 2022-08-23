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
</style>
</head>
<body>

	<div id="chat-modal" data-bs-toggle="modal" data-bs-target="#oneByOne"></div>

  	<div class="modal modal-down fade" id="oneByOne" tabindex="-1" aria-labelledby="oneByOneLabel" aria-hidden="true">
    	<div class="modal-dialog modal-down modal-dialog-scrollable">
      		<div class="modal-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="oneByOneLabel">1대1 문의</h5>
            		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body" id="chatting-zone">
          			<div id="chat-oppo">안녕하세요? 아나바다입니다. 무엇을 도와드릴까요?</div>
          			<div id="chat-new-line"></div><br>
          			<div id="chat-me">생각대로 잘 안되네요..</div>
		            <div id="chat-new-line"></div><br>
		            <div id="chat-oppo">아이고</div>
		            <div id="chat-new-line"></div><br>
		            <div id="chat-oppo">힘내십쇼..</div>
		            <div id="chat-new-line"></div><br>
		            
        			<form action="">
	        			<table>
	        				<tr>
	        					<td><textarea id="messageContent" style="width: 350px; vertical-align: middle; resize: none;" name="message"></textarea></td>
	        					<td><input type ="submit" id="sendMessage" class="btn btn-info" style="height:55px; vertical-align:middle;" value="전송"></td>
	        				</tr>
	        			</table>
          			</form>
        		</div>
      		</div>
    	</div>
  	</div>
  
  <script>
  		$('#sendMessage').click(function(){
  			const content = $('#messageContent').val();
  			if(content.length >= 10) {
	  			$.ajax({
	  				url : "/semiTestPrj/cs/chat/send",
	  				data : {"content" : content},
	  				method : "GET",
	  				success : function(x){
	  					console.log("통신성공 !");
	  					
	  					const chatVo = JSON.parse(x);
	  				},
	  				error : function(request, status, error) {
	  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	  				}
	  			});  				
  			}else{
  				alert('문의는 10글자 이상 입력하세요!');
  			}
  		});
  		
  		$('#chat-modal').click(function(){
  			const num = (${loginMember.memberNo});
  			
  			$.ajax({
  				url : "/semiTestPrj/cs/chat/show?num=" + num,
  				method : "GET",
  				success : function(x){
  					console.log("통신성공 !");
  					
  					const list = JSON.parse(x);
  					
  					let tagArea = document.getElementById('chatting-zone');
  				 	let new_tag = document.createElement('div');
  				 	new_tag.setAttribute("id", "")
  				  
  				  	new_hTag.innerHTML = "추가된 h"+hTagCount+"태그";
  				  
  				  	tagArea.appendChild(new_hTag);
  				},
  				error : function(request, status, error) {
  					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  				}
  			})
  			
  			
  		})
  </script>
</body>
</html>