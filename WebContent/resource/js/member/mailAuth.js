console.clear();

var authFormSubmitted = false;

function submitAuthForm(form) {
	
	form.mailAuthCode.value = form.mailAuthCode.value.trim();
	if (form.mailAuthCode.value.length == 0) {
		alert('인증번호를 입력해주세요.');
		form.mailAuthCode.focus();

		return;
	}
	
	form.submit();
	authFormSubmitted = true;
}