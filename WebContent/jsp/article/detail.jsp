<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.Reply"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

<%
	List<Member> members = (List<Member>) request.getAttribute("members");
	List<Reply> replies = (List<Reply>) request.getAttribute("replies");
	Article article = (Article) request.getAttribute("article");
	int fullPage = (int) request.getAttribute("fullPage");
	CateItem cateItem = (CateItem) request.getAttribute("cateItem");
%>

<script src="../../resource/js/detail.js"></script>

<div class="con">
	<div class="body-box">
		<h1 class="main-title"><%=article.getTitle()%></h1>
		<div class="cate-and-date">
			카테고리 :<%=cateItem.getName()%>| 등록날짜 :<%=article.getRegDate()%>| 작성자:<%for(Member member : members){%><%if(member.getId()==article.getMemberId()){%><%=member.getNickname()%><%}%><%}%>| 조회수 :<%=article.getHit()%>
		</div>
		<div class="detail-box">
			<script type="text/x-template"><%=article.getBodyForXTemplate()%></script>
			<div class="toast-editor toast-editor-viewer"></div>
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
			<h4 class="reply-title">댓글</h4>
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
						<div class="reply-info">작성날짜 :<%=reply.getRegDate()%> | 수정날짜 : <%=reply.getUpdateDate()%>
							<a href="${pageContext.request.contextPath}/s/article/removeReply?articleId=<%=article.getId() %>&replyId=<%=reply.getId()%>">[삭제하기]</a>
							<a href="${pageContext.request.contextPath}/s/article/modifyReply?articleId=<%=article.getId() %>&replyId=<%=reply.getId()%>">[수정하기]</a>
						</div>
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
					<div class="con form-row">
						<div class="label">댓글</div>
						<div class="input"><textarea class="reply-field" name="body" placeholder="내용을 입력해주세요." /></textarea></div>
					</div>
					<div class="form-row">
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