var ReplyFormSubmitted = false;

function submitReplyForm(form) {

	form.body.value = form.body.value.trim();
	if (form.body.value.length == 0) {
		alert('댓글을 작성해주세요.');
		form.body.focus();

		return;
	}	

	form.submit();
	ReplyFormSubmitted = true;
}