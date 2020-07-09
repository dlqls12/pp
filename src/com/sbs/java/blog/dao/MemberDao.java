package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}
	
	public int join(String userId, String userPw, String nickname) {
		SecSql secSql = new SecSql();
		
		secSql.append("INSERT INTO members");
		secSql.append("SET regDate = NOW()");
		secSql.append(", userId = ? ", userId);
		secSql.append(", userPw = ? ", userPw);
		secSql.append(", nickname = ?", nickname);

		return DBUtil.insert(dbConn, secSql);
	}
}
