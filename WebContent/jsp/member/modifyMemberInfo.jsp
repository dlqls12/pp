<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script src="../../resource/js/modifyMemberInfo.js"></script>
<div class="con">
	<div class="body-box con">
		<h1 class="main-title">My Page</h1>
		<div class="mp-box">
			<form action="doModifyMemberInfo" method="POST" onsubmit="submitNickForm(this); return false;">
				<div class="form-row">
					<div class="input">
						<input name="id" type="hidden" value='<%=loginedMemberId%>' />
					</div>
				</div>
				<ul>
					<li>아이디 : <%=loginedMember.getLoginId()%></li>
					<li class="flex">이메일 : 
						<div class="form-row">
							<input name="newEmail" type="email" value='<%=loginedMember.getEmail()%>' />
						</div>
					</li>
					<li class="flex">별명 :
						<div class="form-row">
							<input name="newNick" type="text" value='<%=loginedMember.getNickname()%>' />
						</div>
					</li>
					<li>가입날짜 : <%=loginedMember.getRegDate()%></li>
					<li>최근수정 : <%=loginedMember.getUpdateDate()%></li>
				</ul>
				<input type="submit" value="변경!!" /><a href="mypage">취소</a>
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