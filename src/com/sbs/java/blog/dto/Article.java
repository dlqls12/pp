package com.sbs.java.blog.dto;

import java.util.Map;

public class Article extends Dto {
	private int cateItemId;
	private int hit;
	private String title;
	private String body;
	private int memberId;

	public Article(Map<String, Object> row) {
		super(row);

		this.cateItemId = (int) row.get("cateItemId");
		this.title = (String) row.get("title");
		this.body = (String) row.get("body");
		this.hit = (int) row.get("hit");
		this.memberId = (int) row.get("memberId");
	}

	public int getCateItemId() {
		return cateItemId;
	}

	public void setCateItemId(int cateItemId) {
		this.cateItemId = cateItemId;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	@Override
	public String toString() {
		return "Article [cateItemId=" + cateItemId + ", hit=" + hit + ", title=" + title + ", body=" + body
				+ ", memberId=" + memberId + ", getId()=" + getId() + ", getRegDate()=" + getRegDate()
				+ ", getUpdateDate()=" + getUpdateDate() + ", getExtra()=" + getExtra() + "]";
	}
	
	
}
