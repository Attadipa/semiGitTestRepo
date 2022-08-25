<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>비밀번호 변경</title>

    
<style type="text/css">
	* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic, HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica, Arial, sans-serif;
	  }
	  
	  body {
	    padding-top: 6em;
	  }
	  
	
	/*본문 */
	.containers {
	    width: 500px;
	    margin: 0 auto;
	    margin-top: 50px;
	    margin-bottom: 40px;
	    border: 1px solid #d2d6dc;
	    padding: 30px;
	}
	
	
	form {
	    margin: 0 auto;
	    min-height: 300px;
	    align-items: center;
	}
	
	.search-title{
		text-align : center;
		margin-bottom : 50px;
	}
	
	.form-search {
		text-align : center;
	}
	.find-name{
		margin-bottom : 20px;
		
	}
	
	.find-phone{
		margin-bottom : 50px;
		
	}
	
	label{
		margin-right : 10px;
		font-weight : 700;
		
	}
	.phone-select {
		width : 80px;
		height : 34px;
		border : 1px solid black;
		
	}
	
	.btn-name{
	    font-size :0.8rem;
	    text-indent: 20px;
	    
	}
	
	.btn-phone{
	    font-size :0.8rem;
		text-indent: 20px;
	    
	}
	
	input{
	    border: black;
	    width: 200px;
	    border: black solid 1px;
	    border-radius: 5px;
	    font-size: 1rem;
	    height: 40px;
	        
	    
	  }
	
	.btnSearch input{
	    background-color: black;
	    color: white;
	    border: none;
	    font-size: 15px;
	      font-weight : 700;
	      width : 140px;
	      height : 45px;
	      cursor : pointer;
	}
	
	.btnSearch{
		text-align : center;
	}
	
	.btnSearch  input:hover{
		background-color : white;
		border : 1px solid black;
		color : #2D9568;
		}
		
	/*result*/
	.found-id {
		width : 100px;
		height : 60px;
		text-align : center;
		margin : auto 0 ;
		padding-top : 20px ;
		border : 1px solid #eee;
	}	
	
	.found-success {
		display : flex;
		height : 100px;
		text-align : center;
	}
	
	h4 {
		text-align : center;
		line-height : 100px;
		margin-left : 30px;
		margin-right : 30px;
	}
	
	.found-fail h4{
			margin-left : 0;
		
	}
	
	.found-login{
		      text-align : center;
		      margin-top : 20px;
		
	}
	
	  #btnLogin, #btnback, #btnjoin {
	    background-color: black;
	    color: white;
	    border: none;
	    font-size: 15px;
	          height : 45px;
	      font-weight : 700;
	}
	
	#btnback:hover,
	#btnLogin:hover,
	#btnjoin:hover{
		background: white;
		border : black solid 1px;
		color : #2D9568;
		cursor : pointer;
	}
	.find-id{
		
			margin-bottom : 20px;
	}
	.find-id label{
		margin-left : -15px;
		
	}

	/* footer */
	.footer-align {
		margin-top : 150px;
	}
	.list-box {
	    font-size: small;
	}
	
	.help-box {
	    font-size: 20px;
	    height: 100px;
	    width: 800px;
	    margin: 0 auto;
	    line-height: 100px;
	}
	
	li {
	    list-style: none;
	}
	
	.footer-list {
	    padding: 20px;
	    color: grey;
	    background-color:black;
	
	}
	
	.list-box-hr {
	    margin: 10px 0px 10px 0;
	
	}
	
	.ul-align {
	    width: 800px;
	    margin: 0 auto;
	}
	
</style>
</head>
<body>
		<!-- header영역 -->
	<%@include file="/views/common/header.jsp" %>
	
	
	
<div class = "containers" align="center">
	<form name="idfindscreen" method ="post">
	<div class ="btnSearch">
		<br><br><br><br><br>
		<input type="button" id="" value="비밀번호변경" class="" data-bs-toggle="modal" data-bs-target="#pwdChange">
        <input type="button" id="" value="뒤로돌아가기" class="" onclick="history.back();">
 	</div>
 </form>
</div>
   
   <!-- The Modal -->
   <div class="modal" id="pwdChange">
     <div class="modal-dialog">
       <div class="modal-content">
   
         <!-- Modal Header -->
         <div class="modal-header">
           <h4 class="modal-title">비밀번호 변경하기</h4>
           <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
         </div>
   
         <!-- Modal body -->
         <div class="modal-body">
           <div id="pwdFormOuter">
              <form action="<%=contextPath%>/member/pwd" method="post">
                 <input type="hidden" name="frmId" value="${loginMember.getMemberMid() }">
                 <table>
                    <tr>
                       <td>기존 비밀번호</td>
                       <td><input type="password" name="memberPwd"></td>
                    </tr>
                    <tr>
                       <td>신규 비밀번호</td>
                       <td><input type="password" name="memberPwdNew"></td>
                    </tr>
                    <tr>
                       <td>신규 비밀번호 확인</td>
                       <td><input type="password" name="memberPwdNew2"></td>
                    </tr>
                    <tr>
                       <td colspan="2" align="center">
                       <br>
                         		<input type="submit" value="변경하기" class="btn btn-primary" onclick="return checkPwd();">
                       </td>
                    </tr>
                 </table>
              </form>
           </div>
         </div>
   
       </div>
     </div>
   </div>
   
   <script>
      function checkPwd(){
         isSame = $('input[name=memberPwdNew]').val() == $('input[name=memberPwdNew2]').val();
         if(isSame){
            return true;
         }else{
            alert("신규 비밀번호가 일치하지 않습니다.");
            return false;
         }
         
      }
   </script>
    <div class="footer-align">
        <hr>
        <div class="help-box">도움이 더 필요하신가요? <a href="chat.jsp">지금 채팅하기</a> 또는 000-000-000 번호로 문의하세요.</div>
        
   <!-- footer영역 -->
   	<%@include file="/views/common/footer.jsp" %>
   	
        </div>

</body>
</html>
