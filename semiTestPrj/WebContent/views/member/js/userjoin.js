 function getId(id){ return document.getElementById(id)}


 // 다음 우편번호 검색 API를 사용한 주소 찾기
 var member = function() {
     
 var btnFindZip = getId('btnFindZip');
/* var idCheck = getId('idCheck');*/
 var memberInfo = getId('frmMember');
 
     if(btnFindZip != null) {
         btnFindZip.onclick = function() {
             var frm = document.getElementById("frmMember");
             new daum.Postcode({
                 oncomplete:function(data) {
                     frm.zipcode.value = data.zonecode;
                     frm.address.value = data.address;
 
                 }
             }).open();
         }
     
     }
     
     /*if(idCheck != null) {
             
             idCheck.onclick = function() {
             if(document.memberInfo.frmId.value == "") {
                 alert("아이디를 입력하세요.");
                 return;
             }
         
             var memberInfo = document.memberInfo;
             var userId =  memberInfo.frmId.value;
             console.log(userId);
             memberInfo.action = "/semiTestPrj/member/idCheck";
             memberInfo.method="POST";
             memberInfo.submit();
         }
     }*/
 }
 
 /* 전화번호 하이픈 자동 추가하기 */
 var phoneHypen = function() {
     var autoHypenPhone = function(str){
           str = str.replace(/[^0-9]/g, '');
           var tmp = '';
           if( str.length < 5){
               return str;
           }else if(str.length <= 8){
               tmp += str.substr(0, 4);
               tmp += '-';
               tmp += str.substr(4);
               return tmp;
           }
       
           return str;
     }
 
 
     var phoneNum = document.getElementById('phoneNum');
 
     phoneNum.onkeyup = function(){
       this.value = autoHypenPhone( this.value ) ;  
     }
 }
 
  
     
 function onlyEng(objtext1) {
   var inText = objtext1.value;
 
   if (deny_pattern.test(inText)) {
     alert("영문자와 한글,숫자만을 입력하세요");
     objtext1.value = "";
     objtext1.focus();
     return false;
   }
   return true;
 }
 
 
 
 function joinCheck(obj) {
     
    var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/
    var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
    var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    
     var memberInfo = document.memberInfo;
 
          /* example(html 태그에 pattern속성 미 사용시)
          var reg_mid = /[\w!$\-]{4,10}/;
          if( !reg_mid.test(frm.mid.value) ){
             alert('mid');
             checkFlag=false;
          }
         */ 
     
     
     if(!deny_char.test(obj.frmId.value)) {
         alert('영문자와 한글,숫자만을 입력하세요');
         obj.frmId.value ="";
         obj.frmId.focus();
         return false;
     }
     
     
     
     if(!regExpPw.test(obj.frmPassword.value)) {
         alert('숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력하세요');
         obj.frmPassword.value ="";
         obj.frmPassword.focus();
         return false;
     }
     
     var pwd = memberInfo.frmPassword.value;
     var re_pwd = memberInfo.re_frmPassword.value;
     
     if(re_pwd != pwd){
         alert('비밀번호가 다릅니다.');
         obj.re_frmPassword.value ="";
         obj.re_frmPassword.focus();
         return false;
     }
     
     if(!obj.frmName || obj.frmName.value.trim().length == 0){
         alert('이름을 입력해주세요.');
         obj.frmName ="";
         obj.frmName.focus();
         return false;
     }
     
     
     
     if(!regExpEm.test(obj.frmEmail.value)){
         alert('이메일 형식에 맞지 않습니다.');
         obj.frmEmail ="";
         obj.frmEmail.focus();
         return false;
     }
     
     if(!obj.frmPhone || obj.frmPhone.value.trim().length == 0){
         alert('전화번호를 입력해주세요.');
         obj.frmPhone = "";
         obj.frmPhone.focus();
         return false;
     }
     
     
     if(!obj.zipcode || obj.zipcode.value.trim().length == 0) {
         alert('우편번호를 입력해주세요.')
         obj.frmZipcode = "";
         obj.zipcode.focus();
         return false;
     }
     
         if(!obj.btnZipcode || obj.btnZipcode.value.trim().length == 0) {
         alert('상세 주소를 입력해주세요.')
         obj.btnZipcode = "";
         obj.btnZipcode.focus();
         return false;
     }
     
     return true;
 }

