package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {
	
	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}

	@Override
	public String doAction() {
		switch (actionMethodName) {
		case "join":
			return doActionJoin(req, resp);
		case "doJoin":
			return doActionDoJoin(req, resp);
		case "login":
			return doActionLogin(req, resp);
		case "doLogin":
			return doActionDoLogin(req, resp);
		}

		return "";
	}

	private String doActionDoLogin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		
		if (memberService.isLogined(loginId) > 0) {
			return "html:<script> alert('이미 로그인 하셨습니다.'); location.replace('../home/main'); </script>";
		}
		
		Member member = null;
		member = memberService.login(loginId, loginPw);
		if (member != null) {
			memberService.loginComplete(loginId);
			return "html:<script> alert('" + member.getNickname() + "님 환영합니다.'); location.replace('../home/main'); </script>";
		} else {
			return "html:<script> alert('아이디나 비밀번호가 틀렸습니다.'); location.replace('../home/main'); </script>";
		}
	}

	private String doActionLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "member/login.jsp";		
	}

	private String doActionJoin(HttpServletRequest req, HttpServletResponse resp) {
		return "member/join.jsp";
	}

	private String doActionDoJoin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String loginPwReal = req.getParameter("loginPwReal");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String nickname = req.getParameter("nickname");

		int isExist = memberService.isExistId(loginId);

		if (isExist > 0) {
			return "html:<script> alert('입력하신 아이디가 이미 존재합니다.'); location.replace('../home/main'); </script>";
		}

		memberService.join(loginId, loginPwReal, name, email, nickname);

		return "html:<script> alert('" + nickname + "님 환영합니다.'); location.replace('../home/main'); </script>";

	}
}
