package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
			return doActionJoin();
		case "doJoin":
			return doActionDoJoin();
		case "login":
			return doActionLogin();
		case "doLogin":
			return doActionDoLogin();
		case "doLogout":
			return doActionDoLogout();
		case "mypage":
			return doActionMyPage();
		case "modifyMemberInfo":
			return doActionModifyMemberInfo();
		case "doModifyMemberInfo":
			return doActionDoModifyMemberInfo();
		case "seekId":
			return doActionSeekId();
		case "doSeekId":
			return doActionDoSeekId();
		case "seekPw":
			return doActionSeekPw();
		case "doSeekPw":
			return doActionDoSeekPw();
		case "modifyPw":
			return doActionModifyPw();
		case "doModifyPw":
			return doActionDoModifyPw();
		case "mailAuth":
			return doActionMailAuth();
		case "doMailAuth":
			return doActionDoMailAuth();
		}

		return "";
	}

	private String doActionDoMailAuth() {
		int id = Util.getInt(req, "id");
		String authCode = req.getParameter("authCode");
		String mailAuthCode = req.getParameter("mailAuthCode");
		
		if ( authCode.equals(mailAuthCode) ) {
			int isAuth = memberService.setMailAuthStatus(id);
			return "html:<script> alert('인증이 완료되었습니다.'); location.replace('../home/main'); </script>";
		}
		return "html:<script> alert('인증번호가 일치하지 않습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActionMailAuth() {
		int id = Util.getInt(req, "id");
		Member member = memberService.getMemberById(id);

		String authCode = Util.numberGen(6, 2);
		
		String email = member.getEmail();
		String title = "메일 인증";
		String body = "인증번호는 [" + authCode + "]입니다.";
		
		gmailSend(email, title, body);
		
		req.setAttribute("authCode", authCode);
		return "member/mailAuth.jsp";
	}

	private String doActionDoSeekPw() {
		String loginPwReal = req.getParameter("loginPwReal");
		String loginId = req.getParameter("loginId");
		String email = req.getParameter("email");
		int isExistId = memberService.isExistId(loginId);
		int isExistEmail = memberService.isExistEmail(email);
		
		if (isExistId < 0) {
			return "html:<script> alert('입력하신 아이디는 존재하지 않습니다.'); location.replace('login'); </script>";
		}
		if (isExistEmail < 0) {
			return "html:<script> alert('입력하신 이메일은 존재하지않습니다.'); location.replace('login'); </script>";
		}
		
		Member member = memberService.getMemberByEmail(email);
		int isModified = memberService.modifyPw(member.getId(), loginPwReal);
		
		if (isModified < 0 ) {
			return "html:<script> alert('수정 실패...'); location.replace('mypage'); </script>";
		}
		
		String title = "임시 비밀번호입니다.";
		String body = "임시 비밀번호를 발급합니다.\n임시 비밀번호는 [123456789a]입니다.\n로그인 후 비밀번호를 변경해주세요."; 
		gmailSend(email, title, body);
		
		return "html:<script> alert('해당 이메일로 임시 비밀번호를 전송하였습니다.'); location.replace('login'); </script>";
	}

	private String doActionSeekPw() {
		return "member/seekPw.jsp";
	}

	private String doActionDoModifyPw() {
		int id = Util.getInt(req, "id");
		String nowLoginPwReal = req.getParameter("nowLoginPwReal");
		String newLoginPwReal = req.getParameter("newLoginPwReal");
		
		Member member = memberService.getMemberById(id);
		String loginId = member.getLoginId();
		Member isMember = memberService.login(loginId, nowLoginPwReal);
		
		if (isMember == null) {
			return "html:<script> alert('비밀번호가 일치하지 않습니다.'); location.replace('mypage'); </script>";
		}
		
		int isModified = memberService.modifyPw(id, newLoginPwReal);
		
		if (isModified < 0 ) {
			return "html:<script> alert('수정 실패...'); location.replace('mypage'); </script>";
		}
		
		session.removeAttribute("loginedMemberId");
		return "html:<script> alert('비밀번호가 변경되었습니다.'); location.replace('login'); </script>";
	}

	private String doActionModifyPw() {
		int id = Util.getInt(req, "id");
		
		req.setAttribute("id", id);
		return "member/modifyPw.jsp";
	}

	private String doActionDoSeekId() {
		String email = req.getParameter("email");
		int isExistEmail = memberService.isExistEmail(email);
		
		if (isExistEmail < 0) {
			return "html:<script> alert('입력하신 이메일은 존재하지않습니다.'); location.replace('login'); </script>";
		}
		
		Member member = memberService.getMemberByEmail(email);
		String title = "아이디 찾기 결과입니다.";
		String body = "아이디는 [" + member.getLoginId() + "]입니다."; 
		gmailSend(email, title, body);
		
		return "html:<script> alert('해당 이메일로 아이디를 전송하였습니다.'); location.replace('login'); </script>";
	}

	private String doActionSeekId() {
		return "member/seekId.jsp";
	}

	private String doActionModifyMemberInfo() {
		int id = Util.getInt(req, "id");
		
		req.setAttribute("id", id);
		return "member/modifyMemberInfo.jsp";
	}

	private String doActionDoModifyMemberInfo() {
		int id = Util.getInt(req, "id");
		String newEmail = req.getParameter("newEmail");
		String newNick = req.getParameter("newNick");
		String pwConfirmReal = req.getParameter("pwConfirmReal");
		
		Member member = memberService.getMemberById(id);
		Member isMember = memberService.login(member.getLoginId(), pwConfirmReal);
		
		if (isMember == null) {
			return "html:<script> alert('비밀번호를 확인해주세요.'); location.replace('mypage'); </script>";
		}
		
		int isModified = memberService.modifyMemberInfo(id, newEmail, newNick);
		
		if (isModified < 0 ) {
			return "html:<script> alert('수정 실패...'); location.replace('mypage'); </script>";
		}
		
		return "html:<script> alert('회원 정보가 수정되었습니다.'); location.replace('mypage'); </script>";
	}

	private String doActionMyPage() {
		return "member/mypage.jsp";
	}

	private String doActionDoLogout() {
		session.removeAttribute("loginedMemberId");
		return "html:<script> alert('로그아웃 되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String doActionDoLogin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		
		Member member = null;
		member = memberService.login(loginId, loginPw);
		if (member != null) {
			session.setAttribute("loginedMemberId", member.getId());
			return "html:<script> alert('" + member.getNickname() + "님 환영합니다.'); location.replace('../home/main'); </script>";
		} else {
			return "html:<script> alert('아이디나 비밀번호가 틀렸습니다.'); location.replace('login'); </script>";
		}
	}

	private String doActionLogin() {
		return "member/login.jsp";		
	}

	private String doActionJoin() {
		return "member/join.jsp";
	}

	private String doActionDoJoin() {
		String loginId = req.getParameter("loginId");
		String loginPwReal = req.getParameter("loginPwReal");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String nickname = req.getParameter("nickname");

		int isExistId = memberService.isExistId(loginId);
		int isExistEmail = memberService.isExistEmail(email);
		int isExistNickname = memberService.isExistNickname(nickname);

		if (isExistId > 0) {
			return "html:<script> alert('입력하신 아이디가 이미 존재합니다.'); location.replace('join'); </script>";
		}
		if (isExistEmail > 0) {
			return "html:<script> alert('입력하신 이메일이 이미 존재합니다.'); location.replace('join'); </script>";
		}
		if (isExistNickname > 0) {
			return "html:<script> alert('입력하신 닉네임이 이미 존재합니다.'); location.replace('join'); </script>";
		}

		memberService.join(loginId, loginPwReal, name, email, nickname);
		String title = "회원가입을 환영합니다.";
		String body = nickname+"님, 환영합니다.";
		gmailSend(email, title, body);
		return "html:<script> alert('" + nickname + "님 환영합니다.'); location.replace('../home/main'); </script>";
	}
	
	private void gmailSend(String email, String title, String body) {
        String user = Util.gmailId; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = Util.gmailPw;   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

            // Subject
            message.setSubject(title); //메일 제목을 입력

            // Text
            message.setText(body);    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}