<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/modifyPw.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">비밀번호 변경하기</h1>
		<form action="doModifyPw" method="POST" class="form2" onsubmit="submitModifyPwForm(this); return false;">
			<input type="hidden" name="newLoginPwReal">
			<input type="hidden" name="nowLoginPwReal">
			<div class="form-row">
				<div class="input">
					<input name="id" type="hidden" value='${loginedMemberId}' />
				</div>
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
			<input type="submit" onclick="if ( confirm('정말 변경하시겠습니까?') == false ) return false;" value="변경!!" /><a href="mypage">취소</a>
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