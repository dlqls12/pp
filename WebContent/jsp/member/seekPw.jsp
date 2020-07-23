<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/seekPw.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">비밀번호 찾기</h1>
		<form action="doSeekPw" method="POST" class="form2" onsubmit="submitSeekPwForm(this); return false;">
			<input type="hidden" name="loginPwReal">
			<input name="tempPw" type="hidden" value='123456789a'>
			<div>
				<div class="form-row">
					<div class="label">아이디 :</div>
					<input name="loginId" type="text" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-row">
					<div class="label">이메일 :</div>
					<input name="email" type="email" placeholder="이메일을 입력해주세요.">
				</div>
				<input type="submit" value="찾기">
			</div>
		</form>
	</div>
	<div class="bottom">
		<div>
			<div class="yb">
				<img src="../../resource/img/yb.png" alt="로고입니다." />
			</div>
			<div class="ment">dlqls0190@naver.com</div>
		</div>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>