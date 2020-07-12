console.clear();

var joinFormSubmitted = false;

function submitJoinForm(form) {
  if ( joinFormSubmitted ) {
    alert('처리 중입니다.');
    return;
  }
  
  form.loginId.value = form.loginId.value.trim();
  if ( form.loginId.value.length == 0 ) {
    alert('아이디를 입력해주세요.');
    form.loginId.focus();
    
    return;
  }
  
  if ( form.loginId.value.indexOf(' ') != -1 ) {
    alert('아이디를 영문소문자와 숫자의 조합으로 입력해주세요.')
    form.loginId.focus();
    
    return;
  }
  
  form.loginPw.value = form.loginPw.value.trim();
  if ( form.loginPw.value.length == 0 ) {
    alert('비밀번호를 입력해주세요.');
    form.loginPw.focus();
    
    return;
  }
  
  form.nickname.value = form.nickname.value.trim();
  if ( form.nickname.value.length == 0 ) {
    alert('닉네임을 입력해주세요.');
    form.nickname.focus();
    
    return;
  }
  
  form.loginPwReal.value = sha256(form.loginPw.value);
  form.loginPw.value = '';
  
  form.submit();
  joinFormSubmitted = true;
}