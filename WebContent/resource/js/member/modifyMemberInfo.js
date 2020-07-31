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
	
	form.pwConfirm.value = form.pwConfirm.value.trim();
	if (form.pwConfirm.value.length == 0) {
		alert('비밀번호를 확인해주세요.');
		form.pwConfirm.focus();

		return;
	}
	
	form.pwConfirmReal.value = sha256(form.pwConfirm.value);
	form.pwConfirm.value = '';
	
	form.submit();
	writeFormSubmitted = true;
}