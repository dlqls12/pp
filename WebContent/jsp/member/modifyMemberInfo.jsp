<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/modifyMemberInfo.js"></script>
<div class="con">
	<div class="body-box con">
		<h1 class="main-title">회원정보 수정</h1>
		<div class="mp-box">
			<form action="doModifyMemberInfo" method="POST" onsubmit="submitNickForm(this); return false;">
				<input type="hidden" name="pwConfirmReal">
				<div class="form-row">
					<div class="input">
						<input name="id" type="hidden" value='${loginedMemberId}' />
					</div>
				</div>
				<ul>
					<li>아이디 : ${loginedMember.loginId}</li>
					<li class="flex">이메일 : 
						<div class="form-row">
							<input name="newEmail" type="email" value='${loginedMember.email}' />
						</div>
					</li>
					<li class="flex">별명 :
						<div class="form-row">
							<input name="newNick" type="text" value='${loginedMember.nickname}' />
						</div>
					</li>
					<li>가입날짜 : ${loginedMember.regDate}</li>
					<li>최근수정 : ${loginedMember.updateDate}</li>
					<li class="flex">비밀번호 확인 :
						<div class="form-row">
							<input name="pwConfirm" type="password" placeholder="비밀번호 확인" />
						</div>
					</li>
				</ul>
				<input type="submit" onclick="if ( confirm('정말 변경하시겠습니까?') == false ) return false;" value="변경!!" />
				<a onclick="if ( confirm('취소하시겠습니까?') == false ) return false;" href="mypage">취소</a>
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