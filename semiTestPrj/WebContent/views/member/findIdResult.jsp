<%@page import="com.kh.member.repository.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
    String memberName = request.getParameter("MEMBER_NAME");
    String memberPhone = request.getParameter("MEMBER_PHONE");
     
	MemberDao dao = new MemberDao();
 	String memberMid = dao.findId(conn, memberName, memberPhone); //아이디를 디비에서 가져옴..실패시 널
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="../member/css/findinfo.css">

<script src="../member/js/findinfo.js"></script>

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
		color : black;
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
		color : black;
		cursor : pointer;
	}
	.find-id{
		
			margin-bottom : 20px;
	}
	.find-id label{
		margin-left : -15px;
		
	}
</style>
</head>
<body>

		<!-- header영역 -->
	<%@include file="/views/common/header.jsp" %>


  <form name="idSearch" method="post">
      
      <% if (memberMid != null) {%>
      
      
      <div class = "containers">
      	<div class = "found-success">
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=memberMid%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="로그인" onclick = "login();"/>
       	</div>
       </div>
      <%} else {%>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onclick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onclick="joinIn()"/>
       	</div>
       </div>
       
    <div class = "adcontainer">
	<a href="#" ><img src = "../member/img/원형로고.png" /></a>                
</div>   
<%}%> 
      </form>
     
    <div class="footer-align">
        <hr>
        <div class="help-box">도움이 더 필요하신가요? <a href="chat.jsp">지금 채팅하기</a> 또는 000-000-0000 번호로 문의하세요.</div>
       <!-- footer영역 -->
   	<%@include file="/views/common/footer.jsp" %>
        </div>
</body>
</html>