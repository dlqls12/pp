console.clear();

var loginFormSubmitted = false;

function submitNickForm(form) {

	form.newNick.value = form.newNick.value.trim();
	if (form.newNick.value.length == 0) {
		alert('닉네임을 입력해주세요.');
		form.newNick.focus();

		return;
	}
	
	form.submit();
	writeFormSubmitted = true;
}