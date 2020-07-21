console.clear();

var loginFormSubmitted = false;

function submitNickForm(form) {

	form.newNick.value = form.newNick.value.trim();
	if (form.newNick.value.length == 0) {
		alert('닉네임을 입력해주세요.');
		form.newNick.focus();

		return;
	}
	
	form.newEmail.value = form.newEmail.value.trim();
	if (form.newEmail.value.length == 0) {
		alert('이메일을 입력해주세요.');
		form.newEmail.focus();

		return;
	}
	
	form.loginPw.value = form.loginPw.value.trim();
	form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
	if (form.loginPw.value.length == 0) {
		alert('비밀번호를 입력해주세요.');
		form.loginPw.focus();

		return;
	}
	if (form.loginPwConfirm.value.length == 0) {
		alert('비밀번호확인을 입력해주세요.');
		form.loginPwConfirm.focus();

		return;
	}
	if ( form.loginPwConfirm.value != form.loginPw.value) {
		alert('비밀번호가 일치하지 않습니다.');
		return;
	}
	
	form.submit();
	writeFormSubmitted = true;
}