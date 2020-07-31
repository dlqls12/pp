package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;
import java.util.UUID;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;

public class MemberService extends Service {

	private MemberDao MemberDao;
	private AttrService attrService;

	public MemberService(Connection dbConn, AttrService attrService) {
		MemberDao = new MemberDao(dbConn);
		this.attrService = attrService;
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

	public int setMailAuthStatus(int id) {
		return MemberDao.setMailAuthStatus(id);
	}

	public String genAuthCode(int actorId) {
		String authCode = UUID.randomUUID().toString();
		attrService.setValue("member__" + actorId + "__extra__modifyPrivateAuthCode", authCode);
		
		return authCode;
	}

	public boolean isValidAuthCode(int actorId, String authCode) {
		String authCodeOnDB = attrService.getValue("member__" + actorId + "__extra__modifyPrivateAuthCode");
		
		return authCodeOnDB.equals(authCode);
	}
}
