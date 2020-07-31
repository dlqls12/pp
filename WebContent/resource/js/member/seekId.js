console.clear();

var seekIdFormSubmitted = false;

function submitSeekIdForm(form) {

	form.name.value = form.name.value.trim();
	if (form.name.value.length == 0) {
		alert('이름을 입력해주세요.');
		form.name.focus();

		return;
	}
	
	form.email.value = form.email.value.trim();
	if (form.email.value.length == 0) {
		alert('이메일을 입력해주세요.');
		form.email.focus();

		return;
	}
	
	form.submit();
	seekIdFormSubmitted = true;
}