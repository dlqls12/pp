var writeFormSubmitted = false;

function submitWriteForm(form) {
  
  form.body.value = form.body.value.trim();
  if ( form.body.value.length == 0 ) {
    alert('내용을 입력해주세요.');
    form.body.focus();
    
    return;
  }
  
  form.title.value = form.title.value.trim();
  if ( form.title.value.length == 0 ) {
    alert('제목을 입력해주세요.');
    form.title.focus();
    
    return;
  }
  
  form.submit();
  writeFormSubmitted = true;
}