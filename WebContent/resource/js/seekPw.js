console.clear();

var seekPwFormSubmitted = false;

function submitSeekPwForm(form) {

	form.loginId.value = form.loginId.value.trim();
	if (form.loginId.value.length == 0) {
		alert('아이디를 입력해주세요.');
		form.loginId.focus();

		return;
	}
	
	form.email.value = form.email.value.trim();
	if (form.email.value.length == 0) {
		alert('이메일을 입력해주세요.');
		form.email.focus();

		return;
	}
	
	form.tempPw.value = form.tempPw.value.trim();
	form.loginPwReal.value = sha256(form.tempPw.value);
	form.tempPw.value = '';
	
	form.submit();
	seekPwFormSubmitted = true;
}