<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/join.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">회원가입</h1>
		<div class="join-box">
			<form action="doJoin" method="POST" class="join-form form1" onsubmit="submitJoinForm(this); return false;">
				<input type="hidden" name="loginPwReal">
				<div class="form-row">
					<div class="label"> * 아이디</div>
					<input name="loginId" type="text" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-row">
					<div class="label"> * 비밀번호</div>
					<input name="loginPw" type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="form-row">
					<div class="label"> * 비밀번호 확인</div>
					<input name="loginPwConfirm" type="password" placeholder="비밀번호 확인을 입력해주세요.">
				</div>
				<div class="form-row">
					<div class="label"> * 이름</div>
					<input name="name" type="text" placeholder="이름을 입력해주세요.">
				</div>
				<div class="form-row">
					<div class="label"> * 이메일</div>
					<input name="email" type="email" placeholder="이메일을 입력해주세요.">
				</div>
				<div class="form-row">
					<div class="label"> * 닉네임</div>
					<input name="nickname" type="text" placeholder="닉네임을 입력해주세요.">
				</div>
				<div>
					<input type="submit" value="가입!">
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