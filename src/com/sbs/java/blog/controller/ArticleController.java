package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.dto.Reply;
import com.sbs.java.blog.util.Util;

public class ArticleController extends Controller {
	public ArticleController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}

	public String doAction() {
		switch (actionMethodName) {
		case "list":
			return actionList();
		case "detail":
			return actionDetail();
		case "doWrite":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionDoWrite();
		case "write":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionWrite();
		case "delete":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionDelete();
		case "modify":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionModify();
		case "doModify":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionDoModify();
		case "addReply":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionAddReply();
		case "removeReply":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionRemoveReply();
		case "modifyReply":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionModifyReply();
		case "doModifyReply":
			if (session.getAttribute("loginedMemberId") == null) {
				return "html:<script> alert('로그인 후 이용하실 수 있습니다.'); location.replace('../member/login'); </script>";
			}
			return actionDoModifyReply();
		}
		return "";
	}

	private String actionDoModifyReply() {
		String body = req.getParameter("body");
		int replyId = Util.getInt(req, "replyId");
		Reply reply = articleService.getReply(replyId);
		
		articleService.modifyReply(body, replyId);
		return "html:<script> alert('댓글 수정 완료.'); location.replace('detail?id=" + reply.getArticleId() + "&page=1'); </script>";
	}

	private String actionModifyReply() {
		int page = 1;
		int repliesInAPage = 5;
		
		page = Util.getInt(req, "page");
		int replyId = Util.getInt(req, "replyId");
		int articleId = Util.getInt(req, "articleId");
		
		int fullPage = articleService.getForPrintListArticlesCount(0, "", "");
		Article article = articleService.getForPrintArticle(articleId);
		CateItem cateItem = articleService.getCateItem(article.getCateItemId());
		List<Reply> replies = articleService.getForPrintListReplies(page, repliesInAPage, article.getId());
		List<Reply> AllReplies = articleService.getReplies(article.getId());
		List<Member> members = memberService.getAllMembers();
		
		int replySize = AllReplies.size();
		int allPage;
		if ( replySize%repliesInAPage == 0 ) {
			allPage = (replySize/repliesInAPage);
		}
		else {
			allPage = (replySize/repliesInAPage)+1;
		}
		
		req.setAttribute("paramPage", page);
		req.setAttribute("allPage", allPage);
		req.setAttribute("replySize", replySize);
		req.setAttribute("members", members);
		req.setAttribute("replies", replies);
		req.setAttribute("cateItem", cateItem);
		req.setAttribute("fullPage", fullPage);
		req.setAttribute("article", article);
		req.setAttribute("replyId", replyId);
		return "article/replyModify.jsp";
	}

	private String actionRemoveReply() {
		int replyId = Util.getInt(req, "replyId");
		int articleId = Util.getInt(req, "articleId");
		
		articleService.removeReply(replyId);
		return "html:<script> alert('댓글이 삭제되었습니다.'); location.replace('detail?id="+articleId+"&page=1'); </script>";
	}

	private String actionAddReply() {
		int articleId = Util.getInt(req, "id");
		String body = req.getParameter("body");
		int loginedMemberId = (int)session.getAttribute("loginedMemberId");
		articleService.addReply(articleId, body, loginedMemberId);
		
		return "html:<script> alert('댓글 작성 완료.'); location.replace('detail?id="+articleId+"&page=1'); </script>";
	}

	private String actionDoModify() {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int cateItemId = Util.getInt(req, "cateItemId");
		int id = Util.getInt(req, "id");
		
		articleService.update(cateItemId, title, body, id);
		
		return "html:<script> alert('" + id + "번 게시물이 수정되었습니다.'); location.replace('detail?id="+id+"&page=1'); </script>";
	}

	private String actionModify() {
		int id = Util.getInt(req, "id");
		Article article = articleService.getForPrintArticle(id);
		
		req.setAttribute("article", article);
		return "article/modify.jsp";
	}

	private String actionDelete() {
		int id = Util.getInt(req, "id");
		
		articleService.delete(id);
		
		return "html:<script> alert('" + id + "번 게시물이 삭제되었습니다.'); location.replace('list'); </script>";
	}

	private String actionWrite() {
		return "article/write.jsp";
	}

	private String actionDoWrite() {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int cateItemId = Util.getInt(req, "cateItemId");
		int loginedMemberId = (int)session.getAttribute("loginedMemberId");
		
		int id = articleService.write(cateItemId, title, body, loginedMemberId);
		
		return "html:<script> alert('" + id + "번 게시물이 생성되었습니다.'); location.replace('list'); </script>";
	}

	private String actionDetail() {
		int page = 1;
		int repliesInAPage = 5;
		
		page = Util.getInt(req, "page");
		int id = Util.getInt(req, "id");
		articleService.increaseHit(id);
		
		int fullPage = articleService.getForPrintListArticlesCount(0, "", "");
		Article article = articleService.getForPrintArticle(id);
		CateItem cateItem = articleService.getCateItem(article.getCateItemId());
		List<Reply> replies = articleService.getForPrintListReplies(page, repliesInAPage, article.getId());
		List<Reply> AllReplies = articleService.getReplies(article.getId());
		List<Member> members = memberService.getAllMembers();
		
		int replySize = AllReplies.size();
		int allPage;
		if ( replySize%repliesInAPage == 0 ) {
			allPage = (replySize/repliesInAPage);
		}
		else {
			allPage = (replySize/repliesInAPage)+1;
		}
		
		req.setAttribute("paramPage", page);
		req.setAttribute("allPage", allPage);
		req.setAttribute("replySize", replySize);
		req.setAttribute("members", members);
		req.setAttribute("replies", replies);
		req.setAttribute("cateItem", cateItem);
		req.setAttribute("fullPage", fullPage);
		req.setAttribute("article", article);

		return "article/detail.jsp";
	}

	private String actionList() {
		long startTime = System.nanoTime();
		int page = 1;

		if (!Util.empty(req, "page") && Util.isNum(req, "page")) {
			page = Util.getInt(req, "page");
		}

		int cateItemId = 0;

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}
		
		String cateItemName = "전체";
		
		if ( cateItemId != 0 ) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}
		req.setAttribute("cateItemName", cateItemName);
		

		String searchKeywordType = "";

		if (!Util.empty(req, "searchKeywordType")) {
			searchKeywordType = Util.getString(req, "searchKeywordType");
		}

		String searchKeyword = "";

		if (!Util.empty(req, "searchKeyword")) {
			searchKeyword = Util.getString(req, "searchKeyword");
		}

		int itemsInAPage = 10;
		int totalCount = articleService.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
		int totalPage = (int) Math.ceil(totalCount / (double) itemsInAPage);

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);

		List<Article> articles = articleService.getForPrintListArticles(page, itemsInAPage, cateItemId, searchKeywordType, searchKeyword);
		int size = articles.size();
		req.setAttribute("size", size);
		req.setAttribute("articles", articles);
		long endTime = System.nanoTime();
		long estimatedTime = endTime - startTime;
		// nano seconds to seconds
		double seconds = estimatedTime / 1000000000.0;
		System.out.println("seconds:" + seconds);
		return "article/list.jsp";
	}
}
