console.clear();

var seekIdFormSubmitted = false;

function submitSeekIdForm(form) {

	form.email.value = form.email.value.trim();
	if (form.email.value.length == 0) {
		alert('이메일을 입력해주세요.');
		form.email.focus();

		return;
	}
	
	form.submit();
	seekIdFormSubmitted = true;
}