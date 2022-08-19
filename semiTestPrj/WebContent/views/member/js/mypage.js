/**
 * 
 */

function checkPwd() {
	
		var frm = document.frmMember;
		var frmPwd = frm.frm_password.value;
		var frmRePwd = frm.re_frmPassword.value;
		
		if(frmPwd.trim().length == 0)   {
			document.frmMember.frmPassword.focus();
			alert('비밀번호를 입력해주세요.')
			return false;
		}
		
		if(frmRePwd.trim().length == 0) {
			alert('새로운 비밀번호를 입력해주세요.');
			document.frmMember.re_frmPassword.focus();
			return false;

		}
		
		if(frmMember.frmPhone.value.trim().length == 0){
			alert('전화번호를 입력해주세요.');
			document.frmMember.frmPhone = "";
			document.frmMember.frmPhone.focus();
			return false;
		}

			alert('회원정보가 수정되었습니다.');
			frm.action = '/userProfileServlet';
			frm.submit();
		}