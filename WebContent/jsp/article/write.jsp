<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

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

.form1 .form-row>.input>input, .form1 .form-row>.input>textarea {
	display: block;
	width: 100%;
	padding: 10px;
}

.form1 .form-row>.input>select {
	padding: 10px;
}

.form1 .form-row>.input>textarea {
	height: 500px;
}

@media ( max-width :700px ) {
	.form1 .form-row {
		display: block;
	}
}

</style>
<div class="con">
	<div class="write-form-box body-box con">
	<h1 class="main-title">article write</h1>
		<form action="doWrite" method="POST" class="write-form form1"
			onsubmit="submitJoinForm(this); return false;">
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
					<textarea name="body" placeholder="내용을 입력해주세요." /></textarea>
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