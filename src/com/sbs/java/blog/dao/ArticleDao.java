package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Reply;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class ArticleDao extends Dao {
	private Connection dbConn;

	public ArticleDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public List<Reply> getForPrintListReplies(int page, int itemsInAPage, int id) {
		SecSql secSql = new SecSql();

		int limitFrom = (page - 1) * itemsInAPage;

		secSql.append("SELECT AR.*, M.nickname AS extra__writer");
		secSql.append("FROM articleReply AS AR ");
		secSql.append("INNER JOIN member AS M ");
		secSql.append("ON AR.memberId = M.id");
		secSql.append("WHERE AR.articleId = ? ", id);
		secSql.append("ORDER BY AR.id DESC ");
		secSql.append("LIMIT ?, ? ", limitFrom, itemsInAPage);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Reply> replies = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			replies.add(new Reply(row));
		}

		return replies;
	}
	
	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType,
			String searchKeyword) {
		SecSql secSql = new SecSql();

		int limitFrom = (page - 1) * itemsInAPage;

		secSql.append("SELECT A.*, M.nickname AS extra__writer");
		secSql.append("FROM article AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A.memberId = M.id");
		secSql.append("WHERE A.displayStatus = 1 ");
		if (cateItemId != 0) {
			secSql.append("AND cateItemId = ? ", cateItemId);
		}
		if (searchKeywordType.equals("title") && searchKeyword.length() > 0) {
			secSql.append("AND title LIKE CONCAT('%%', ?, '%%')", searchKeyword);
		}
		secSql.append("ORDER BY id DESC ");
		secSql.append("LIMIT ?, ? ", limitFrom, itemsInAPage);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Article> articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles;
	}

	public int getForPrintListArticlesCount(int cateItemId, String searchKeywordType, String searchKeyword) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT COUNT(*) AS cnt ");
		secSql.append("FROM article ");
		secSql.append("WHERE displayStatus = 1 ");

		if (cateItemId != 0) {
			secSql.append("AND cateItemId = ? ", cateItemId);
		}

		if (searchKeywordType.equals("title") && searchKeyword.length() > 0) {
			secSql.append("AND title LIKE CONCAT('%%', ?, '%%')", searchKeyword);
		}

		int count = DBUtil.selectRowIntValue(dbConn, secSql);
		return count;
	}

	public Article getForPrintArticle(int id) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT A.*, M.nickname AS extra__writer ");
		secSql.append("FROM article AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A.memberId = M.id");
		secSql.append("WHERE 1 ");
		secSql.append("AND A.id = ? ", id);
		secSql.append("AND A.displayStatus = 1 ");

		return new Article(DBUtil.selectRow(dbConn, secSql));
	}

	public List<CateItem> getForPrintCateItems() {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * ");
		secSql.append("FROM cateItem ");
		secSql.append("WHERE 1 ");
		secSql.append("ORDER BY id ASC ");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<CateItem> cateItems = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			cateItems.add(new CateItem(row));
		}

		return cateItems;
	}

	public CateItem getCateItem(int cateItemId) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * ");
		secSql.append("FROM cateItem ");
		secSql.append("WHERE 1 ");
		secSql.append("AND id = ? ", cateItemId);

		return new CateItem(DBUtil.selectRow(dbConn, secSql));
	}

	public int write(int cateItemId, String title, String body, int memberId) {
		SecSql secSql = new SecSql();

		secSql.append("INSERT INTO article");
		secSql.append("SET regDate = NOW()");
		secSql.append(", updateDate = NOW()");
		secSql.append(", title = ? ", title);
		secSql.append(", body = ? ", body);
		secSql.append(", displayStatus = '1'");
		secSql.append(", cateItemId = ?", cateItemId);
		secSql.append(", memberId = ?", memberId);

		return DBUtil.insert(dbConn, secSql);
	}

	public int delete(int id) {
		SecSql secSql = new SecSql();

		secSql.append("DELETE FROM article");
		secSql.append("WHERE id = ?", id);

		return DBUtil.delete(dbConn, secSql);
	}

	public int update(int cateItemId, String title, String body, int id) {
		SecSql secSql = new SecSql();

		secSql.append("UPDATE article");
		secSql.append("SET updateDate = NOW()");
		secSql.append(", title = ? ", title);
		secSql.append(", body = ? ", body);
		secSql.append(", cateItemId = ?", cateItemId);
		secSql.append(" WHERE id = ?", id);

		return DBUtil.update(dbConn, secSql);
	}

	public int increaseHit(int id) {
		SecSql sql = SecSql.from("UPDATE article");
		sql.append("SET hit = hit + 1") ;
		sql.append("WHERE id = ?", id);
		
		return DBUtil.update(dbConn, sql);
	}

	public int addReply(int articleId, String body, int memberId) {
		SecSql secSql = new SecSql();

		secSql.append("INSERT INTO articleReply");
		secSql.append("SET regDate = NOW()");
		secSql.append(", updateDate = NOW()");
		secSql.append(", articleId = ? ", articleId);
		secSql.append(", body = ? ", body);
		secSql.append(", memberId = ?", memberId);

		return DBUtil.insert(dbConn, secSql);
	}

	public List<Reply> getReplies(int id) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT AR.*, M.nickname AS extra__writer FROM articleReply AS AR");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON AR.memberId = M.id");
		secSql.append("AND AR.articleId = ?", id);
		secSql.append("ORDER BY AR.id DESC");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Reply> replies = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			replies.add(new Reply(row));
		}

		return replies;
	}

	public int removeReply(int replyId) {
		SecSql secSql = new SecSql();

		secSql.append("DELETE FROM articleReply");
		secSql.append("WHERE id = ?", replyId);

		return DBUtil.delete(dbConn, secSql);
	}

	public int modifyReply(String body, int replyId) {
		SecSql secSql = new SecSql();

		secSql.append("UPDATE articleReply");
		secSql.append("SET updateDate = NOW()");
		secSql.append(", body = ? ", body);
		secSql.append(" WHERE id = ?", replyId);

		return DBUtil.update(dbConn, secSql);
	}

	public Reply getReply(int replyId) {
		SecSql secSql = new SecSql();

		secSql.append("SELECT * ");
		secSql.append("FROM articleReply ");
		secSql.append("WHERE 1 ");
		secSql.append("AND id = ? ", replyId);

		return new Reply(DBUtil.selectRow(dbConn, secSql));
	}
}