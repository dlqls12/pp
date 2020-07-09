package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}
	
	public int join(String userId, String userPw, String nickname) {
		String sql = "";

		sql += String.format("INSERT INTO members ");
		sql += String.format("SET regDate = NOW() ");
		sql += String.format(", userId = '%s' ", userId);
		sql += String.format(", userPw = '%s' ", userPw);
		sql += String.format(", nickname = '%s' ", nickname);

		return DBUtil.insert(dbConn, sql);
	}
}
