<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

<script src="../../resource/js/article/write.js"></script>

<div class="con">
	<div class="write-form-box body-box con">
		<h1 class="main-title">게시물 수정</h1>
		<form action="doModify" method="POST" class="write-form form1" onsubmit="submitWriteForm(this); return false;">
			<input type="hidden" name="id" value="${article.id}" />
			<div class="form-row">
				<div class="label">카테고리 선택</div>
				<div class="input">
					<select name="cateItemId">
						<c:forEach items="${cateItems}" var="cateItem">
							<option value="${cateItem.id}">${cateItem.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-row">
				<div class="label">제목</div>
				<div class="input title-input">
					<input name="title" type="text" value="${article.title}" />
				</div>
			</div>
			<div class="form-row">
				<div class="label label1">내용</div>
				<div class="input">
					<input type="hidden" name="body">
					<script type="text/x-template" id="origin1" style="display:none;">${article.bodyForXTemplate}</script>
					<div id="editor1"></div>
				</div>
			</div>
			<div class="form-row">
				<a href="${pageContext.request.contextPath}/s/article/list" onclick="if ( confirm('작성중인 내용이 사라집니다. 정말 취소하시겠습니까?') == false ) return false;" class="write-form-cancle-button">취소하기</a>
				<div class="input submit-input">
					<input type="submit" onclick="if ( confirm('게시물 수정을 완료하시겠습니까?') == false ) return false;" value="수정하기" />
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
		height : "500px",
		initialEditType : "markdown",
		previewStyle : "vertical",
		initialValue : $('#origin1').html().trim().replace(/<!--REPLACE:script-->/gi, 'script'),
		plugins : [ toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin, replPlugin, codepenPlugin ]
	});
</script>