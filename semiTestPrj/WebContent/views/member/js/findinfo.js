/**
 * 아이디, 비밀번호 찾기
 */


//아이디찾기
function idSearch1() { 
	 	var frm = document.idfindscreen;

	 	if (frm.memberName.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (frm.memberPhone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }

	 frm.method = "post";
	 frm.action = "findIdResult.jsp"; //넘어간화면
	 frm.submit();  
	 }


//비밀번호찾기
 function pwSearch(){

  var frm=document.pwfindscreen;

  if(frm.memberMid.value.length<3){
   alert("아이디를 올바르게 입력해주세요");
   return;
  }

   if (frm.memberPhone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }
	
  frm.method="post";
  frm.action="findPwResult.jsp"; //넘어간화면
  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보냄
  }

   


 function addHypen(obj) {
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	
function login() {
		if(btnLogin != null){
	btnLogin.onclick = function(){
		location.href = 'loginForm.jsp';
	}
	}
}
  function joinIn() {
		if(btnjoin != null){
	btnjoin.onclick = function(){
		location.href = '/semiTestPrj/index.jsp';
	}
	}
}
  