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
		}

		return "";
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
			return "html:<script> alert('아이디나 비밀번호가 틀렸습니다.'); location.replace('../home/main'); </script>";
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

		int isExist = memberService.isExistId(loginId);

		if (isExist > 0) {
			return "html:<script> alert('입력하신 아이디가 이미 존재합니다.'); location.replace('../home/main'); </script>";
		}

		memberService.join(loginId, loginPwReal, name, email, nickname);
		gmailSend(email, nickname);
		return "html:<script> alert('" + nickname + "님 환영합니다.'); location.replace('../home/main'); </script>";
	}
	
	private void gmailSend(String email, String nickname) {
        String user = ""; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "";   // 패스워드

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
            message.setSubject("회원가입을 환영합니다."); //메일 제목을 입력

            // Text
            message.setText(nickname + "님, 환영합니다.");    //메일 내용을 입력

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