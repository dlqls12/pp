<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script src="../../resource/js/login.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">로그인</h1>
		<div class="big-login-box">
			<div class="login-box">
				<form action="doLogin" method="POST" class="login-form" onsubmit="submitLoginForm(this); return false;">
					<input type="hidden" name="loginPwReal">
					<div class="login-form-box flex">
						<div>
							<div class="form-row">
								<div class="label">아이디</div>
								<input name="loginId" type="text" placeholder="아이디를 입력해주세요.">
							</div>
							<div class="form-row">
								<div class="label">비밀번호</div>
								<input name="loginPw" type="password" placeholder="비밀번호 입력해주세요.">
							</div>
						</div>
						<div class="submit-button-box">
							<input type="submit" class="submit-button" value="LOGIN">
						</div>
					</div>
				</form>
				<div>
					<div>
						<a href="${pageContext.request.contextPath}/s/member/seekId">[아이디 찾기]</a>
						<a href="${pageContext.request.contextPath}/s/member/seekPw">[비밀번호 찾기]</a>
					</div>
				</div>
			</div>
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