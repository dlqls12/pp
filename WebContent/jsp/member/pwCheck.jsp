<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/pwCheck.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">비밀번호 확인</h1>
		<form action="doPwCheck" method="POST" class="form2" onsubmit="submitPwCheckForm(this); return false;">
			<input type="hidden" name="loginPwReal">
			<div class="flex form-row">
				<div class="label">비밀번호 :</div>
				<input name="loginPw" type="password" placeholder="비밀번호를 입력해주세요.">
			</div>
			<input type="submit" value="확인">
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