package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.Map;

import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao extends Dao {
	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public Member login(String loginId, String loginPw) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * FROM `member` ");
		secSql.append("WHERE loginId = ? ", loginId);
		secSql.append("AND loginPw = ? ", loginPw);
		
		if(!DBUtil.selectRow(dbConn, secSql).isEmpty()) {
			Map<String, Object> row = DBUtil.selectRow(dbConn, secSql);
			Member m = new Member(row);
			return m;
		}

		return null;
	}

	public int join(String loginId, String loginPw, String name, String email, String nickname) {
		SecSql secSql = new SecSql();

		secSql.append("INSERT INTO `member`");
		secSql.append("SET regDate = NOW()");
		secSql.append(", updateDate = NOW() ");
		secSql.append(", loginId = ? ", loginId);
		secSql.append(", loginPw = ? ", loginPw);
		secSql.append(", name = ?", name);
		secSql.append(", email = ?", email);
		secSql.append(", nickname = ?", nickname);

		return DBUtil.insert(dbConn, secSql);
	}

	public int isExistId(String loginId) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * FROM `member` ");
		secSql.append("WHERE loginId = ? ", loginId);
		
		if(!DBUtil.selectRow(dbConn, secSql).isEmpty()) {
			Map<String, Object> row = DBUtil.selectRow(dbConn, secSql);
			Member m = new Member(row);
			return m.getId();
		}
		
		return -1;
	}

	public int loginComplete(String loginId) {
		SecSql secSql = new SecSql();

		secSql.append("INSERT INTO nowLogin ");
		secSql.append("SET loginId = ? ", loginId);
		
		return DBUtil.insert(dbConn, secSql);
	}

	public int isLogined(String loginId) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * FROM nowLogin ");
		secSql.append("WHERE loginId = ? ", loginId);
		
		if(!DBUtil.selectRow(dbConn, secSql).isEmpty()) {
			return 100;
		}
		
		return -1;
	}
}