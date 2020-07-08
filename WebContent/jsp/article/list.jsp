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