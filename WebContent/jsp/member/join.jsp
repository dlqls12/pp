<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<style>
/* lib */
.form1 {
	display: block;
	width: 100%;
}

.form1 .form-row {
	align-items: center;
	display: flex;
}

.form1 .form-row>.label {
	width: 100px;
}

.form1 .form-row>.input {
	flex-grow: 1;
}

.form1 .form-row>.input {
	display: block;
	width: 100%;
	padding: 10px;
}

/* cus */
.join-form-box {
	margin-top: 30px;
}
</style>

<div class="join-form-box con">
	<form action="doJoin" method="POST" class="write-form form1">
		<div class="form-row">
			<div class="label">아이디</div>
			<div class="input">
				<input name="userId" type="text" placeholder="아이디를 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">비밀번호</div>
			<div class="input">
				<input name="userPw" placeholder="비밀번호를 입력해주세요." />
			</div>
		</div>
		
		<div class="form-row">
			<div class="label">닉네임</div>
			<div class="input">
				<input name="nickname" placeholder="닉네임을 입력해주세요." />
			</div>
		</div>
		<div class="form-row">
			<div class="label">전송</div>
			<div class="input">
				<input type="submit" value="전송" />
				<a href="../home/main">취소</a>
			</div>
		</div>
	</form>
</div>
<%@ include file="/jsp/part/foot.jspf"%>