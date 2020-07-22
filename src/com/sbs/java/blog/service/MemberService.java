package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

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
	
	public int isExistEmail(String email) {
		return MemberDao.isExistEmail(email);
	}
	
	public int isExistNickname(String nickname) {
		return MemberDao.isExistNickname(nickname);
	}

	public List<Member> getAllMembers() {
		return MemberDao.getAllMembers();
	}

	public Member getMemberById(int id) {
		return MemberDao.getMemberById(id);
	}

	public int modifyMemberInfo(int id, String newEmail, String newNick) {
		return MemberDao.modifyMemberInfo(id, newEmail, newNick);
	}

	public Member getMemberByEmail(String email) {
		return MemberDao.getMemberByEmail(email);
	}

	public int modifyPw(int id, String newLoginPwReal) {
		return MemberDao.modifyPw(id, newLoginPwReal);
	}
}
