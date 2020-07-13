package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;

public class MemberService extends Service {

	private MemberDao MemberDao;

	public MemberService(Connection dbConn) {
		MemberDao = new MemberDao(dbConn);
	}

	public Member login(String loginId, String loginPw) {
		return MemberDao.login(loginId, loginPw);
	}

	public int join(String loginId, String loginPw, String name, String email, String nickname) {
		return MemberDao.join(loginId, loginPw, name, email, nickname);
	}

	public int isExistId(String loginId) {
		return MemberDao.isExistId(loginId);
	}

	public int loginComplete(String loginId) {
		return MemberDao.loginComplete(loginId);
	}
}
