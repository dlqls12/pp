console.clear();

var pwCheckFormSubmitted = false;

function submitPwCheckForm(form) {

	form.loginPw.value = form.loginPw.value.trim();
	if (form.loginPw.value.length == 0) {
		alert('비밀번호를 입력해주세요.');
		form.loginPw.focus();

		return;
	}
	
	form.loginPwReal.value = sha256(form.loginPw.value);
	form.loginPw.value = '';

	form.submit();
	pwCheckFormSubmitted = true;
}