package com.sbs.java.blog.dto;

import java.util.Map;

public class Member extends Dto {
	private String userId;
	private String userPw;
	private String nickname;

	public Member(Map<String, Object> row) {
		super(row);
		this.userId = (String) row.get("userId");
		this.userPw = (String) row.get("userPw");
		this.nickname = (String) row.get("nickname");
	}

	@Override
	public String toString() {
		return "Article [userId=" + userId + ", userPw=" + userPw + ", nickname=" + nickname + ", dto=" + super.toString() + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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
