package com.sbs.java.blog.dto;

import java.util.Map;

public class Member extends Dto {
	private String updateDate;
	private String userId;
	private String userPw;
	private String name;
	private String email;
	private String nickname;

	public Member(Map<String, Object> row) {
		super(row);
		this.updateDate = (String) row.get("updateDate");
		this.userId = (String) row.get("userId");
		this.userPw = (String) row.get("userPw");
		this.name = (String) row.get("name");
		this.email = (String) row.get("email");
		this.nickname = (String) row.get("nickname");
	}

	@Override
	public String toString() {
		return "Article [updateDate=" + updateDate + ", userId=" + userId + ", userPw=" + userPw + ", name=" + name + ", email=" + email + ", nickname=" + nickname + ", dto=" + super.toString() + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
