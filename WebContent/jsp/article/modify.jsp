<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	Article article = (Article) request.getAttribute("article");
%>

<script src="../../resource/js/write.js"></script>

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
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<style>
/* lib */
.form1 {
	display: block;
	width: 100%;
}

.form1 .form-row {
	align-items: center;
	display: flex;
}

.form1 .form-row {
	margin-top: 10px;
}

.form1 .form-row>.label {
	width: 100px;
}

.form1 .form-row>.input {
	flex-grow: 1;
}

.form1 .form-row>.input>input {
	display: block;
	width: 100%;
	padding: 10px;
}

.form1 .form-row>.input>select {
	padding: 10px;
}

@media ( max-width :700px ) {
	.form1 .form-row {
		display: block;
	}
}
</style>
<div class="con">
	<div class="write-form-box body-box con">
		<h1 class="main-title">게시물 수정</h1>
		<form action="doModify" method="POST" class="write-form form1"
			onsubmit="submitWriteForm(this); return false;">
			<div class="form-row">
				<div class="label">카테고리 선택</div>
				<div class="input">
					<select name="cateItemId">
						<%
							for (CateItem cateItem : cateItems) {
						%>
						<option value="<%=cateItem.getId()%>"><%=cateItem.getName()%></option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="form-row">
				<div class="input">
					<input name="id" type="hidden" value='<%=article.getId()%>' />
				</div>
				<div class="input">
					<input name="memberId" type="hidden" value='<%=article.getMemberId()%>' />
				</div>
			</div>
			<div class="form-row">
				<div class="label">제목</div>
				<div class="input">
					<input name="title" type="text" value='<%=article.getTitle()%>' />
				</div>
			</div>
			<div class="form-row">
				<div class="label">내용</div>
				<div class="input">
					<input type="hidden" name="body">
					<script type="text/x-template" id="origin1" style="display:none;"><%=article.getBodyForXTemplate()%></script>
					<div id="editor1"></div>
				</div>
			</div>
			<div class="form-row">
				<div class="label">전송</div>
				<div class="input">
					<input type="submit" value="전송" /> <a href="list">취소</a>
				</div>
			</div>
		</form>
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

<script>
	var editor1 = new toastui.Editor({
		el : document.querySelector("#editor1"),
		height : "600px",
		initialEditType : "markdown",
		previewStyle : "vertical",
		initialValue : $('#origin1').html().trim().replace(/<!--REPLACE:script-->/gi, 'script'),
		plugins : [ toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin,
				replPlugin, codepenPlugin ]
	});
</script>