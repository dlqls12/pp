package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

import com.sbs.java.blog.dao.ArticleDao;
import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Reply;

public class ArticleService extends Service {

	private ArticleDao articleDao;

	public ArticleService(Connection dbConn) {
		articleDao = new ArticleDao(dbConn);
	}

	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType, String searchKeyword) {
		return articleDao.getForPrintListArticles(page, itemsInAPage, cateItemId, searchKeywordType, searchKeyword);
	}

	public int getForPrintListArticlesCount(int cateItemId, String searchKeywordType, String searchKeyword) {
		return articleDao.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
	}

	public Article getForPrintArticle(int id) {
		return articleDao.getForPrintArticle(id);
	}

	public List<CateItem> getForPrintCateItems() {
		return articleDao.getForPrintCateItems();
	}

	public CateItem getCateItem(int cateItemId) {
		return articleDao.getCateItem(cateItemId);
	}

	public int write(int cateItemId, String title, String body, int memberId) {
		return articleDao.write(cateItemId, title, body, memberId);
	}

	public int delete(int id) {
		return articleDao.delete(id);
	}

	public int update(int cateItemId, String title, String body, int id) {
		return articleDao.update(cateItemId, title, body, id);
	}

	public void increaseHit(int id) {
		articleDao.increaseHit(id);
	}

	public int addReply(int articleId, String body, int memberId) {
		return articleDao.addReply(articleId, body, memberId);
	}

	public List<Reply> getReplies(int id) {
		return articleDao.getReplies(id);
	}

	public int removeReply(int replyId) {
		return articleDao.removeReply(replyId);
	}

	public int modifyReply(String body, int replyId) {
		return articleDao.modifyReply(body, replyId);
	}

	public Reply getReply(int replyId) {
		return articleDao.getReply(replyId);
	}

	public List<Reply> getForPrintListReplies(int page, int repliesInAPage, int id) {
		return articleDao.getForPrintListReplies(page, repliesInAPage, id);
	}
}
