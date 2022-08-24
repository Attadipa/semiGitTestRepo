<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>로그인</title>
    
    <!-- <link rel="stylesheet" href="..//member/css/login.css"> -->
    

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
	  
	.containers {
	    width: 500px;
	    margin: 0 auto;
	    margin-top: 50px;
	    margin-bottom: 50px;
	    border: 1px solid #d2d6dc;
	    padding: 30px;
	}
	
	
	
	form {
	    margin: 0 auto;
	    min-height: 300px;
	    display: flex;
	    align-items: center;
	}
	
	.align {
	    margin: 0 auto;
	}
	
	input,
	.button-login>button {
	    width: 400px;
	    height: 50px;
	    border-radius: 5px;
	    border: 1px solid;
	}
	
	#mid,
	#pwd{
	    text-indent: 20px;
	    font-size :0.8rem;
	}
	
	#btnLogin {
	    background-color: black;
	    color: white;
	    border: none;
	    font-size: 15px;
	      font-weight : 700;
	}
	#btnLogin:hover{
		background: white;
		border : black solid 1px;
		color : #2D9568;
		cursor : pointer;
	}
	.button-login {
	    margin-bottom: 30px;
	  
	}
	
	.button-login>button {
	    background-color: white;
	    display: flex;
	    align-items: center;
	    font-size: 15px;
	    justify-content: space-evenly;
	    margin: 0 auto;
	    font-weight: 800;
		cursor : pointer;
	}
	
	#kakao-login-btn img{
		cursor : pointer;
	}
	/* .button-login #kakao-login-btn {
	    background-color: rgb(254, 229, 0);
	    border: none;
		color : brown;
		      font-weight : 700;
		      font-size : 1rem;
		      width: 400px;
		      height: 50px;
		      line-height: 40px;
		          border-radius: 5px;
	} */
	.login-search {
	   text-align : center;
	   margin-bottom : 30px;
	   
	}
	
	.login-id {
	    margin: 0 auto;
	    display : inline-block;
	   
	   margin-right : 29px;
	}
	
	.login-pw {
	    margin: 0 auto;
	    display : inline;
	  padding-left : 20px;
	  padding-right : 20px;
	  border-left : 1px solid black;
	  border-right : 1px solid black;
	}
	.login-join {
	    margin: 0 auto;
	    display : inline;
	   margin-left: 30px;
	}
	.text-id {
	    margin-bottom: 30px;
	    width: 100%;
	}
	
	.item-center {
	    display: flex;
	    align-items: center;
	    margin-bottom: 30px;
	
	}
	
	.item-center>span {
	    margin: 0 5px 0 5px;
	}
	
	.flex-1 {
	    width: 50%;
	    border-top: 2px solid gray;
	
	}
	
	a {
	    text-decoration: none;
	    color:black;
	    font-weight: bold;
	
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
	    background-color: #f5f5f7;
	}
	
	.list-box-hr {
	    margin: 10px 0px 10px 0;
	
	}
	
	.ul-align {
	    width: 800px;
	    margin: 0 auto;
	}
	
	.containers>h3{
		text-align : center;
	}
</style>  
</head>
<body>
		<!-- header영역 -->
	<jsp:include page="/views/common/header.jsp"/>

    <div class="containers" align="center">
    <h3>로그인</h3>
        <section class="form-write">
			<form action="/semiTestPrj/member/login" method="post">
                <div class="align">
                    <input type="text" id="mid" name ="memberMid" placeholder="아나바다 ID">
                     <div class="text-id">
                       
                    </div> 
                    <input type="password" id="pwd" name ="memberPwd" placeholder="비밀번호">
                   <div class="text-id">
                        
                    </div> 
                    <input type="submit" id="btnLogin" value="로그인">
                </div>
            </form>
            <section class="login-search">
                <div class="login-id">
                    <a style="text-decoration: none; color: black;" href="/semiTestPrj/views/member/findId.jsp">아이디찾기</a>
                </div>
                <div class="login-pw">
                    <a style="text-decoration: none; color: black;" href="/semiTestPrj/views/member/findPwd.jsp">비밀번호찾기</a>
                </div>
                <div class="login-join">
                    <a style="text-decoration: none; color: black;" href="/semiTestPrj/views/member/joinForm.jsp">회원가입</a>
                </div>
            </section>
            <div class="item-center">
                <div class="flex-1"></div>
                <span>OR</span>
                <div class="flex-1"></div>
            </div>
        </section>
        
        
        <section class="login-write">
            <div class="button-login" align ="center" >
                <a id="kakao-login-btn" >
    <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="400px" height ="50px" />
    </a>
            </div>
            
        </section>
    </div>
    <div class="footer-align">
        <hr>
        <div class="help-box">도움이 더 필요하신가요? <a href="chat.jsp">지금 채팅하기</a> 또는 000-000-0000 번호로 문의하세요.</div>
           <!-- footer영역 -->
   	<%@include file="/views/common/footer.jsp" %>
    </div>
     <script>/* logInOut() */</script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
Kakao.init('efb8bc98de2690b12d96808f944979a6');


$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
          //console.log(JSON.stringify(authObj));
          //console.log(Kakao.Auth.getAccessToken());
          //2. 로그인 성공시, API를 호출합니다.
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              //console.log(JSON.stringify(res));
              console.log(res);
              var id = res.id;
			  scope : 'account_email';
			alert('로그인성공');
              //var email = res.kakao_account.email;
			  //var name = res.properties.nickname;
			  location.href="http://localhost:8083/semiTestPrj/views/member/kakaocallback.jsp";
		

              
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) //e.o.kakao


</script>
</body>
</html>