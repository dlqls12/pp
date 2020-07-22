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
	
	form.submit();
	writeFormSubmitted = true;
}