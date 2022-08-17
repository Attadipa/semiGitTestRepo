/**
 * 
 */

function check_Pwd() {
	
		var frm = document.frm_member;
		var frmPwd = frm.frm_password.value;
		var frmRePwd = frm.re_frm_password.value;
		
		if(frmPwd.trim().length == 0)   {
			document.frm_member.frm_password.focus();
			alert('비밀번호를 입력해주세요.')
			return false;
		}
		
		if(frmRePwd.trim().length == 0) {
			alert('새로운 비밀번호를 입력해주세요.');
			document.frm_member.re_frm_password.focus();
			return false;

		}
		
		if(frm_member.frm_phone.value.trim().length == 0){
			alert('전화번호를 입력해주세요.');
			document.frm_member_frm_phone = "";
			document.frm_member_frm_phone.focus();
			return false;
		}

			alert('회원정보가 수정되었습니다.');
			frm.action = '/userProfileServlet';
			frm.submit();
		}