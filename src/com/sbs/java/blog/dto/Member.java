package com.sbs.java.blog.dto;

import java.util.Map;

public class Member extends Dto {
	private String updateDate;
	private String loginId;
	private String loginPw;
	private String name;
	private String nickname;
	private String email;

	public Member(Map<String, Object> row) {
		super(row);
		this.updateDate = (String) row.get("updateDate");
		this.loginId = (String) row.get("loginId");
		this.loginPw = (String) row.get("loginPw");
		this.name = (String) row.get("name");
		this.email = (String) row.get("email");
		this.nickname = (String) row.get("nickname");
	}

	@Override
	public String toString() {
		return "Article [updateDate=" + updateDate + ", loginId=" + loginId + ", loginPw=" + loginPw + ", name=" + name + ", email=" + email + ", nickname=" + nickname + ", dto=" + super.toString() + "]";
	}

	public String getUserId() {
		return loginId;
	}

	public void setUserId(String userId) {
		this.loginId = loginId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserPw() {
		return loginPw;
	}

	public void setUserPw(String userPw) {
		this.loginPw = loginPw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
