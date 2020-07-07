<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");
	String cateItemName = (String)request.getAttribute("cateItemName");
%>
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

<style>
.page-box>ul>li>a {
	padding: 0 10px;
	text-decoration: underline;
	color: #787878;
}

.page-box>ul>li:hover>a {
	color: black;
}

.page-box>ul>li.current>a {
	color: red;
}
</style>
<div class="con">
	<div class="con body-box">
		<div class="con main-title">
			<div class="article-title"><%=cateItemName%> 게시물 리스트</div>
			<div class="articles-amount">총 게시물 수 : ${totalCount}</div>
		</div>
		
		<div class="list-box">
			<%
				if (articles.size() == 0) {
			%>
				<h2>게시물이 존재하지 않습니다. 😞</h2>
			<%
				} else {
			%>
			<table class="con">
				<thead>
					<tr>
						<th>ID</th>
						<th>제목</th>
						<th>등록날짜</th>
						<th>갱신날짜</th>
						<th>카테고리</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Article article : articles) {
					%>
					<tr>
					<td><%=article.getId()%></td>
					<td><a href="../article/detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
					<td><%=article.getRegDate()%></td>
					<td><%=article.getUpdateDate()%></td>
					<td>
						<%
							for (int i = 0; i < cateItems.size(); i++) {
						%> 
								<%
								if (cateItems.get(i).getId() == article.getCateItemId()) {
								%>
								<%=cateItems.get(i).getName()%>
							<%
							}
							%>
						<%
						}
						%>
					</td>
					</tr>
						<%
						}
						%>
				</tbody>
			</table>
			<%
				}
			%>
		</div>
		<div class="con page-box">
			<ul class="flex flex-jc-c">
				<%
					for (int i = 1; i <= totalPage; i++) {
				%>
				<li class="<%=i == paramPage ? "current" : ""%>"><a
					href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=<%=i%>" class="block"><%=i%></a></li>
				<%
					}	
				%>
			</ul>
		</div>
		<div class="con search-box flex flex-jc-c">	
			<form action="${pageContext.request.contextPath}/s/article/list">
				<input type="hidden" name="page" value="1" /> <input type="hidden"
					name="cateItemId" value="${param.cateItemId}" /> <input
					type="hidden" name="searchKeywordType" value="title" /> <input
					type="text" name="searchKeyword" value="${param.searchKeyword}" />
				<button type="submit">검색</button>	
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