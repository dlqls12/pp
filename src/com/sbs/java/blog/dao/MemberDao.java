package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
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

	public List<Member> getAllMembers() {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * FROM `member` ");
		
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Member> members = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			members.add(new Member(row));
		}

		return members;
	}

	public Member getMemberById(int id) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * FROM `member` ");
		secSql.append("WHERE id = ? ", id);
		
		return new Member(DBUtil.selectRow(dbConn, secSql));
	}

	public int modifyNick(int id, String newNick) {
		SecSql secSql = new SecSql();

		secSql.append("UPDATE `member`");
		secSql.append("SET updateDate = NOW()");
		secSql.append(", nickname = ?", newNick);
		secSql.append(" WHERE id = ?", id);

		return DBUtil.update(dbConn, secSql);
	}
}