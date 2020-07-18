<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script src="../../resource/js/login.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">로그인</h1>
		<div class="join-box">
			<form action="doLogin" method="POST" onsubmit="submitLoginForm(this); return false;">
				<input type="hidden" name="loginPwReal">
				<div class="form-row">
					<div class="label">아이디</div>
					<input name="loginId" type="text" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-row">
					<div class="label">비밀번호</div>
					<input name="loginPw" type="password" placeholder="비밀번호 입력해주세요.">
				</div>
				<div>
					<input type="submit" value="제출">
				</div>
			</form>
		</div>
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