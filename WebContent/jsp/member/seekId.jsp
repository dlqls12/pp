<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/member/seekId.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">아이디찾기</h1>
		<div class="big-login-box">
			<div class="login-box">
				<form action="doSeekId" method="POST" class="login-form" onsubmit="submitSeekIdForm(this); return false;">
					<input type="hidden" name="loginPwReal">
					<input name="tempPw" type="hidden" value='123456789a'>
					<div class="login-form-box flex">
						<div>
							<div class="form-row">
								<div class="label">이름 :</div>
								<input name="name" type="text" placeholder="이름을 입력해주세요.">
							</div>
							<div class="form-row">
								<div class="label">이메일 :</div>
								<input name="email" type="email" placeholder="이메일을 입력해주세요.">
							</div>
						</div>
						<div class="submit-button-box">
							<input type="submit" class="submit-button" value="찾기">
						</div>
					</div>
				</form>
				<div>
					<a href="${pageContext.request.contextPath}/s/member/seekPw">[비밀번호 찾기]</a>
					<a href="${pageContext.request.contextPath}/s/member/login">[취소]</a>
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