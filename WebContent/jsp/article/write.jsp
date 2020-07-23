<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

<script src="../../resource/js/write.js"></script>

<div class="con">
	<div class="con body-box">
		<h1 class="main-title">게시물 작성하기</h1>
		<form action="doWrite" method="POST" class="write-form form1" onsubmit="submitWriteForm(this); return false;">
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
				<div class="label">제목</div>
				<div class="input">
					<input name="title" type="text" placeholder="제목을 입력해주세요." />
				</div>
			</div>
			<div class="form-row">
				<div class="label">내용</div>
				<div class="input">
					<input type="hidden" name="body">
					<div id="editor1"></div>
				</div>
			</div>
			<div class="form-row">
				<div class="input">
					<input type="submit" onclick="if ( confirm('게시물 작성을 완료하시겠습니까?') == false ) return false;" value="등록하기" />
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
		initialValue : "# 내용을 입력해주세요...",
		plugins : [ toastui.Editor.plugin.codeSyntaxHighlight, youtubePlugin, replPlugin, codepenPlugin ]
	});
</script>