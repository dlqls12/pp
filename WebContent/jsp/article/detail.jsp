<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.Reply"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Member> members = (List<Member>) request.getAttribute("members");
	List<Reply> replies = (List<Reply>) request.getAttribute("replies");
	Article article = (Article) request.getAttribute("article");
	int fullPage = (int) request.getAttribute("fullPage");
	CateItem cateItem = (CateItem) request.getAttribute("cateItem");
%>

<script src="../../resource/js/detail.js"></script>

<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<div class="con">
	<div class="body-box">
		<h1 class="main-title"><%=article.getTitle()%></h1>
		<div class="cate-and-date">
			카테고리 :<%=cateItem.getName()%>| 등록날짜 :<%=article.getRegDate()%>| 조회수 :<%=article.getHit()%>
		</div>
		<div class="detail-box">
			<script type="text/x-template" id="origin1" style="display: none;"><%=article.getBody()%></script>
			<div id="viewer1"></div>
			<script>
				var editor1__initialValue = $('#origin1').html().trim();
				var editor1 = new toastui.Editor({
					el : document.querySelector('#viewer1'),
					initialValue : editor1__initialValue,
					viewer : true,
					plugins : [ toastui.Editor.plugin.codeSyntaxHighlight,
							youtubePlugin, replPlugin, codepenPlugin ]
				});
			</script>
		</div>
		<div class="con flex flex-jc-sb">
			<div class="next-or-prev-button">
				<%if (article.getId() > 1) {%><a href="detail?id=<%=article.getId() - 1%>">[이전글]</a><%}%>
				<%if (article.getId() < fullPage) {%><a href="detail?id=<%=article.getId() + 1%>">[다음글]</a><%}%>
			</div>
			<div class="next-or-prev-button">
				<a href="${pageContext.request.contextPath}/s/article/delete?id=<%=article.getId()%>">[삭제하기]</a>
				<a href="${pageContext.request.contextPath}/s/article/modify?id=<%=article.getId()%>">[수정하기]</a>
			</div>
		</div>
		<div class="con">
			<h4>댓글</h4>
			<div class="reply-box">
				<div>
					<%if (replies.size() == 0) {%>
						<div>댓글이 없습니다.😞</div>
					<%} else {%>
						<%for (Reply reply : replies) {%>
						<div class="reply-body">
						<div class="reply-writer">작성자 :<%for (Member member : members) {%><%if (member.getId() == reply.getMemberId()) {%><%=member.getNickname()%><%}%><%}%></div>
						↪ <%=reply.getBody()%>
						</div>
						<div class="reply-info">작성날짜 :<%=reply.getRegDate()%> | 수정날짜 : <%=reply.getUpdateDate()%></div>
						<%}%>
					<%}%>
				</div>
			</div>
			<div class="con add-reply-box">
				<form action="addReply" method="POST" class="reply-form"
					onsubmit="submitReplyForm(this); return false;">
					<div class="form-row">
						<div class="input">
							<input name="id" type="hidden" value='<%=article.getId()%>' />
						</div>
					</div>
					<div class="form-row">
						<div class="label">댓글</div>
						<div class="input"><textarea name="body" placeholder="내용을 입력해주세요." /></textarea></div>
					</div>
					<div class="form-row">
						<div class="label">전송</div>
						<div class="input">
							<input type="submit" value="전송" />
						</div>
					</div>
				</form>
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