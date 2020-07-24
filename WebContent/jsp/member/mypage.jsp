<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">My Page</h1>
		<div class="mp-box">
			<ul>
				<li>아이디 : ${loginedMember.loginId}</li>
				<li>이메일 : ${loginedMember.email} <c:if test="${loginedMember.mailAuthStatus==0}"><a href="${pageContext.request.contextPath}/s/member/mailAuth?id=${loginedMemberId}">[이메일 인증하기]</a></c:if></li>
				<li>닉네임 : ${loginedMember.nickname}</li>
				<li>가입날짜 : ${loginedMember.regDate}</li>
				<li>최근수정 : ${loginedMember.updateDate}</li>
				<li><a href="${pageContext.request.contextPath}/s/member/modifyMemberInfo?id=${loginedMemberId}">[회원정보 수정하기]</a></li>
				<li><a href="${pageContext.request.contextPath}/s/member/modifyPw?id=${loginedMemberId}">[비밀번호 변경하기]</a></li>
			</ul>
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