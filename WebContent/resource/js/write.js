var writeFormSubmitted = false;

function submitWriteForm(form) {
	form.title.value = form.title.value.trim();
	if (form.title.value.length == 0) {
		alert('제목을 입력해주세요.');
		form.title.focus();

		return;
	}
	
	var source = editor1.getMarkdown().trim();
	if (source.length == 0) {
		alert('내용을 입력해주세요.');
		editor1.focus();
		return;
	}
	form.body.value = source;
	form.submit();
	
	
	form.submit();
	writeFormSubmitted = true;
}