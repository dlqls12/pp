console.clear();

var modifyPwFormSubmitted = false;

function submitModifyPwForm(form) {
	if (modifyPwFormSubmitted) {
		alert('처리 중입니다.');
		return;
	}

	form.nowLoginPw.value = form.nowLoginPw.value.trim();
	if (form.nowLoginPw.value.length == 0) {
		alert('현재 비밀번호를 입력해주세요.');
		form.nowLoginPw.focus();

		return;
	}
	
	form.newLoginPw.value = form.newLoginPw.value.trim();
	if (form.newLoginPw.value.length == 0) {
		alert('새로운 비밀번호를 입력해주세요.');
		form.newLoginPw.focus();

		return;
	}
	
	form.newLoginPwConfirm.value = form.newLoginPwConfirm.value.trim();
	if (form.newLoginPwConfirm.value.length == 0) {
		alert('새로운 비밀번호 확인을 입력해주세요.');
		form.newLoginPwConfirm.focus();

		return;
	}
	
	if ( form.newLoginPwConfirm.value != form.newLoginPw.value) {
		alert('비밀번호가 일치하지 않습니다.');
		return;
	}
	
	form.newLoginPwReal.value = sha256(form.newLoginPw.value);
	form.nowLoginPwReal.value = sha256(form.nowLoginPw.value);
	form.nowLoginPw.value = '';
	form.newLoginPw.value = '';
	form.newLoginPwConfirm.value = '';
	
	form.submit();
	modifyPwFormSubmitted = true;
}