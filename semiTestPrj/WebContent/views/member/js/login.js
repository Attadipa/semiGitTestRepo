/**
 * 
 */

var logInOut = function(){

	
	var btnLogin = document.getElementById('btnLogin'); //document에서 element를 가져오는데 아이디를 사용해서 가져옴 object이름은 btnLogin으로
	var btnLogout = document.getElementById('btnLogout');
	
	if(btnLogin != null){
	btnLogin.onclick = function(){
		var frm = document.form_log; //name가져옴
		frm.action = '/SemiTestPrj/views/member/login.jsp';
		frm.submit();
	}
	}
		
	if(btnLogout != null){
	btnLogout.onclick = function(){
		if( confirm("정말 로그아웃 하시겠습니까?")){
		alert("로그아웃되었습니다");
		location.href = '/semiTestPrj/views/member/logout.jsp';
		}
	}
	}

}