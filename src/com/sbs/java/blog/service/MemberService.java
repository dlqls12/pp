package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;

public class MemberService extends Service {

	private MemberDao MemberDao;

	public MemberService(Connection dbConn) {
		MemberDao = new MemberDao(dbConn);
	}

	public int join(String userId, String userPw, String nickname) {
		return MemberDao.join(userId, userPw, nickname);
	}

}
