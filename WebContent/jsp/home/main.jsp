<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf" %>
<div class="con home-body">
	<div class="body-box">
		<c:if test="${isLogined }">
		<h1 class="main-title">${loginedMember.nickname} 님, 환영합니다 😃</h1>
		</c:if>
		<c:if test="${isLogined ==false}">
		<h1 class="main-title">환영합니다 😃</h1>
		</c:if>
		<div class="main-img"><img src="../../resource/img/human.jpg" alt="human" /></div>
	</div>
	<div class="bottom">
		<div>
			<div class="yb">
				<img src="../../resource/img/yb.png" alt="로고입니다." />
			</div>
			<div class="ment">
				dlqls0190@naver.com
			</div>
		</div>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf" %>