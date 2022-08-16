<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 로그인 폼 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 링크 클릭시 호출되는 함수 -->

<script type="text/javascript"> 
function goPage() { 	
	// 링크가 눌려지면 해당 함수가 호출됨.
	document.loginf.action = "./MemberLoginAction.me";
	document.loginf.method = "post";
	document.loginf.submit();
}
</script>

<!-- 부트스트랩 css 적용 -->
<link rel="stylesheet" href="./bootst/css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

<body>
<% session.invalidate(); %>

	<h2 class="text-center">로그인 페이지</h2>
	<div align="center">
	<div class = "container my-3">
		<div class="card align-middle"style="width: 30rem; border-radius: 20px;">
			<div class="card-body">
			<form name="loginf">
				<input type="text" name="mid" id="id" placeholder="ID를 입력하세요"
					class="form-control"> <br> <input type="text"
					name="mpw" id="pw" placeholder="비밀번호를 입력하세요" class="form-control">
				<br>
				<div class="d-flex justify-content-around">
					<div><a href="javascript:;" onclick="goPage()">로그인</a></div>
					<div><a href="./joinForm.me">회원가입</a></div>
                    <div class="button-login" align ="center">
                        <a id="kakao-login-btn">
            <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="83%" height ="40px" />
            </a>
                    </div>
				</div>
			</form>
				</div>
			</div>
		</div>
	</div>
    <script type='text/javascript'>
        Kakao.init('efb8bc98de2690b12d96808f944979a6');
        
        
        $("#kakao-login-btn").on("click", function(){
            //1. 로그인 시도
            Kakao.Auth.login({
                success: function(authObj) {
                 
                  //2. 로그인 성공시, API 호출
                  Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(res) {
                      console.log(res);
                      var id = res.id;
                      scope : 'account_email';
                    alert('로그인성공');
                      location.href="callback url";
                
        
                      
                }
                  })
                  console.log(authObj);
                  var token = authObj.access_token;
                },
                fail: function(err) {
                  alert(JSON.stringify(err));
                }
              });
                
        }) //
        
        
        </script>
    <script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- 부트스트랩과 jquery 적용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>
</html>