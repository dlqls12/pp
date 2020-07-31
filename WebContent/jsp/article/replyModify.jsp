<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page import="com.sbs.java.blog.dto.Reply"%>
<%@ page import="com.sbs.java.blog.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>
<%
	int replySize = (int) request.getAttribute("replySize");
	int paramPage = (int) request.getAttribute("paramPage");
%>
<script src="../../resource/js/article/detail.js"></script>

<style>
	.reply-paging {
		justify-content:center;
	}
	
	.reply-paging > div > a {
		padding:0 10px;
		text-decoration:underline;
		color:#787878;
	}
	
	.reply-paging > div > a:hover {
		color:black;
	}
	
	.current > a {
		color:red !important;
	}
</style>

<div class="con">
	<div class="body-box">
		<h1 class="main-title">${article.title}</h1>
		<div class="cate-and-date">
			카테고리 :${cateItem.name}| 등록날짜 :${article.regDate} | 작성자: ${article.extra.writer} | 조회수 :${article.hit }
		</div>
		<div class="detail-box">
			<script type="text/x-template">${article.bodyForXTemplate}</script>
			<div class="toast-editor toast-editor-viewer"></div>
		</div>
		<div class="con flex flex-jc-sb">
			<div class="next-or-prev-button">
				<c:if test="${article.id > 1}">
					<a href="detail?id=${article.id-1}">[이전글]</a>
				</c:if>
				<c:if test="${article.id < fullPage}">
					<a href="detail?id=${article.id+1}">[다음글]</a>
				</c:if>
			</div>
			<div class="next-or-prev-button">
				<a onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) return false;" href="${pageContext.request.contextPath}/s/article/delete?id=${article.id}">[삭제하기]</a>
				<a href="${pageContext.request.contextPath}/s/article/modify?id=${article.id}">[수정하기]</a>
			</div>
		</div>
		<div class="con">
			<h4 class="reply-title">댓글</h4>
			<div class="reply-box">
				<c:if test="${replySize==0}">
					<div>댓글이 없습니다.😞</div>
				</c:if>
				<c:if test="${replySize!=0}">
					<% int i = 0; %>
					<c:forEach items="${replies}" var="reply">
						<% i = i + 1; %>
						<% int no = 0; %>
						<% no = replySize - ((paramPage-1)*5)-(i-1); %>
						<c:if test="${reply.id==replyId}">
							<div class="con add-reply-box">
								<form action="doModifyReply" method="POST" class="reply-form" onsubmit="submitReplyForm(this); return false;">
									<input name="replyId" type="hidden" value='${reply.id}' />
									<input name="paramPage" type="hidden" value='${paramPage}' />
									<div class="form-row">
										<div class="input">
											<textarea class="reply-field" name="body" placeholder="${reply.body}" /></textarea>
										</div>
									</div>
									<input type="submit" onclick="if ( confirm('댓글 수정을 완료하시겠습니까?') == false ) return false;" value="수정" />
									<a href="${pageContext.request.contextPath}/s/article/detail?id=${article.id}">취소</a>
								</form>
							</div>
						</c:if>
						<c:if test="${reply.id!=replyId}">
							<div class="reply-body">
								<div class="reply-writer">no.<%=no%> | 작성자 : ${reply.extra.writer }</div>
								↪ ${reply.body}
							</div>
						</c:if>
						<div class="reply-info">작성날짜 :${reply.regDate} | 수정날짜 : ${reply.updateDate}</div>
					</c:forEach>
				</c:if>
				<div class ="reply-paging flex">
					<c:if test="${replySize==0}">
					</c:if>
					<c:if test="${replySize!=0}">
						<c:forEach var="cnt" begin="1" end="${allPage}">
							<div class="${cnt==paramPage ? "current" : "" }">
								<a href="${pageContext.request.contextPath}/s/article/detail?id=${article.id}&page=${cnt}">${cnt}</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="con add-reply-box">
				<form action="addReply" method="POST" class="reply-form" onsubmit="submitReplyForm(this); return false;">
					<input name="id" type="hidden" value='${article.id}' />
					<div class="form-row">
						<div class="reply-title">댓글작성하기</div>
						<div class="input">
							<textarea class="reply-field" name="body" placeholder="내용을 입력해주세요." /></textarea>
						</div>
					</div>
					<input type="submit" onclick="if ( confirm('댓글 작성을 완료하시겠습니까?') == false ) return false;" value="전송" />
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