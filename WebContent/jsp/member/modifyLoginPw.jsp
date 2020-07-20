<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<div class="con">
	<div class="body-box con">
		<h1 class="main-title">My Page</h1>
		<div class="mp-box">
			<ul>
				<li>아이디 : <%=loginedMember.getLoginId() %></li>
				<li>이메일 : <%=loginedMember.getEmail() %></li>
				<li>
					별명 : <%=loginedMember.getNickname() %>
					<a href="${pageContext.request.contextPath}/s/member/modifyNick?id=<%=loginedMemberId %>">[변경하기]</a>
				</li>
				<li>가입날짜 : <%=loginedMember.getRegDate() %></li>
				<li>최근수정 : <%=loginedMember.getUpdateDate() %></li>
				<li class="flex">
				비밀번호 변경하기:
					<form action="doModifyLoginPw" method="POST" onsubmit="submitLoginPwForm(this); return false;">
							<div class="form-row">
								<div class="input">
									<input name="id" type="hidden" value='<%=loginedMemberId%>' />
								</div>
							</div>
							<div class="form-row">
								<input name="newPw" type="password" placeholder="새로운 비번입력"/>
								<input type="submit" value="변경!!" />
							</div>
					</form>
				</li>
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