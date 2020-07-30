package com.sbs.java.blog.dto;

import java.util.Map;

public class Reply extends Dto {
	private int articleId;
	private String body;
	private int memberId;
	
	public Reply(Map<String, Object> row) {
		super(row);
		this.articleId = (int) row.get("articleId");
		this.body = (String) row.get("body");
		this.memberId = (int) row.get("memberId");
	}

	@Override
	public String toString() {
		return "Reply [articleId=" + articleId + ", body=" + body + ", memberId=" + memberId + ", getId()=" + getId()
				+ ", getRegDate()=" + getRegDate() + ", getUpdateDate()=" + getUpdateDate() + ", getExtra()="
				+ getExtra() + "]";
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public String getBodyForXTemplate() {
		return body.replaceAll("(?i)script", "<!--REPLACE:script-->").trim();
	}
}
