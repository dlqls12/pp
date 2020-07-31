<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/member/modifyPw.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">비밀번호 변경하기</h1>
		<div class="big-login-box">
			<div class="login-box">
				<form action="doModifyPw" method="POST" class="modifyPw-form" onsubmit="submitModifyPwForm(this); return false;">
					<input type="hidden" name="newLoginPwReal">
					<input type="hidden" name="nowLoginPwReal">
					<input name="id" type="hidden" value='${loginedMemberId}'/>
					<div class="login-form-box flex">
						<div>
							<div class="form-row">
								<div class="label">현재 비밀번호</div>
								<input name="nowLoginPw" type="password" placeholder="비밀번호를 입력해주세요.">
							</div>
							<div class="form-row">
								<div class="label">새로운 비밀번호</div>
								<input name="newLoginPw" type="password" placeholder="비밀번호를 입력해주세요.">
							</div>
							<div class="form-row">
								<div class="label">비밀번호 확인</div>
								<input name="newLoginPwConfirm" type="password" placeholder="비밀번호를 입력해주세요.">
							</div>
						</div>
						<div class="submit-button-box">
							<input type="submit" class="submit-button2" onclick="if ( confirm('정말 변경하시겠습니까?') == false ) return false;" value="변경">
						</div>
					</div>
				</form>
				<div>
					<a href="mypage">[돌아가기]</a>
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