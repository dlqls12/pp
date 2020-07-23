<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<%String authCode = (String) request.getAttribute("authCode"); %>

<script src="../../resource/js/mailAuth.js"></script>
<script>alert("해당 이메일로 인증번호를 발송하였습니다.\n인증번호를 확인해주세요.") </script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">메일 인증</h1>
		<form action="doMailAuth" method="POST" class="form2 flex" onsubmit="submitAuthForm(this); return false;">
			<input type="hidden" name="authCode" value='<%=authCode%>'>
			<input type="hidden" name="id" value='<%=loginedMemberId%>'>
			<div class="form-row flex">
				<div class="label">
					인증번호 : <input name="mailAuthCode" type="text" placeholder="인증번호를 입력해주세요.">
				</div>
			</div>
			<input type="submit" value="인증">
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