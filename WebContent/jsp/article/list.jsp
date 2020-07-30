<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

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
			<div class="article-title">${cateItemName} 게시물 리스트</div>
			<div class="articles-amount">총 게시물 수 : ${totalCount}</div>
		</div>
		
		<div class="list-box">
			<c:if test="${size==0}">
				<h2>게시물이 존재하지 않습니다. 😞</h2>
			</c:if>
			<c:if test="${size!=0}">
			<table class="con">
				<thead>
					<tr>
						<th>ID</th>
						<th>제목</th>
						<th>등록날짜</th>
						<th>작성자</th>
						<th>카테고리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${articles}" var="article">
						<tr>
							<td>${article.id}</td>
							<td><a href="../article/detail?id=${article.id}&page=1">${article.title}</a></td>
							<td>${article.regDate}</td>
							<td>${article.extra.writer}</td>
							<td>
								<c:forEach items="${cateItems}" var="cateItem">
									<c:if test="${cateItem.id==article.cateItemId}">
										${cateItem.name}
									</c:if>
								</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
		<div class="con page-box">
			<ul class="flex flex-jc-c">
				<c:forEach var="cnt" begin="1" end="${totalPage}">
					<li class="${cnt==page ? "current" : "" }">
						<a href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=${cnt}" class="block">${cnt}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="con search-box flex flex-jc-c">	
			<form action="${pageContext.request.contextPath}/s/article/list">
				<input type="hidden" name="page" value="1" />
				<input type="hidden" name="cateItemId" value="${param.cateItemId}" /> 
				<input type="hidden" name="searchKeywordType" value="title" /> 
				<input type="text" name="searchKeyword" value="${param.searchKeyword}" />
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