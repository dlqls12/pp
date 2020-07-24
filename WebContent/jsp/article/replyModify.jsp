<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.Reply"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

<script src="../../resource/js/detail.js"></script>

<%
	Article article = (Article) request.getAttribute("article");
%>

<div class="con">
	<div class="body-box">
		<h1 class="main-title">${article.title}</h1>
		<div class="cate-and-date">
			카테고리 :${cateItem.name}| 등록날짜 :${article.regDate} | 작성자:<c:forEach items="${members}" var="member"><c:if test="${member.id==article.memberId}">${member.nickname}</c:if></c:forEach>| 조회수 :${article.hit }
		</div>
		<div class="detail-box">
			<script type="text/x-template"><%=article.getBodyForXTemplate()%></script>
			<div class="toast-editor toast-editor-viewer"></div>
		</div>
		<div class="con flex flex-jc-sb">
			<div class="next-or-prev-button">
				<c:if test="${article.id > 1}"><a href="detail?id=${article.id-1}">[이전글]</a></c:if>
				<c:if test="${article.id < fullPage}"><a href="detail?id=${article.id+1}">[다음글]</a></c:if>
			</div>
			<div class="next-or-prev-button">
				<a onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;" href="${pageContext.request.contextPath}/s/article/delete?id=${article.id}">[삭제하기]</a>
				<a href="${pageContext.request.contextPath}/s/article/modify?id=${article.id}">[수정하기]</a>
			</div>
		</div>
		<div class="con">
			<h4 class="reply-title">댓글</h4>
			<div class="reply-box">
				<div>
					<c:if test="${replySize==0}">
						<div>댓글이 없습니다.😞</div>
					</c:if>
					<c:if test="${replySize!=0}">
						<c:forEach items="${replies}" var="reply">
							<div class="reply-body">
							<c:if test="${reply.id==replyId}">
								<form action="doModifyReply" method="POST" class="reply-form" onsubmit="submitReplyForm(this); return false;">
									<div class="form-row">
										<div class="input">
											<input name="replyId" type="hidden" value='${reply.id}' />
										</div>
									</div>
									<div class="form-row">
										<div class="label">댓글</div>
										<div class="input"><textarea name="body" placeholder="${reply.body}"/></textarea></div>
									</div>
									<div class="form-row">
										<div class="label">전송</div>
										<div class="input">
											<input type="submit" onclick="if ( confirm('댓글 수정을 완료하시겠습니까?') == false ) return false;" value="전송" />
										</div>
									</div>
								</form>
							</c:if>
							<c:if test="${reply.id!=replyId}">
							<div class="reply-writer">작성자 :<c:forEach items="${members}" var="member"><c:if test="${member.id==reply.memberId}">${member.nickname}</c:if></c:forEach></div>
							↪ ${reply.body}
							</c:if>
						</div>
						<div class="reply-info">작성날짜 :${reply.regDate} | 수정날짜 : ${reply.updateDate}</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="con add-reply-box">
				<form action="addReply" method="POST" class="reply-form"
					onsubmit="submitReplyForm(this); return false;">
					<div class="form-row">
						<div class="input">
							<input name="id" type="hidden" value='${article.id}' />
						</div>
					</div>
					<div class="form-row">
						<div class="label">댓글</div>
						<div class="input"><textarea class ="reply-field" name="body" placeholder="내용을 입력해주세요." /></textarea></div>
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