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

	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType,
			String searchKeyword) {
		SecSql secSql = new SecSql();

		int limitFrom = (page - 1) * itemsInAPage;

		secSql.append("SELECT * ");
		secSql.append("FROM article ");
		secSql.append("WHERE displayStatus = 1 ");
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

		secSql.append("SELECT * ");
		secSql.append("FROM article ");
		secSql.append("WHERE 1 ");
		secSql.append("AND id = ? ", id);
		secSql.append("AND displayStatus = 1 ");

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

		secSql.append("SELECT * FROM articleReply");
		secSql.append("WHERE articleId = ?", id);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, secSql);
		List<Reply> replies = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			replies.add(new Reply(row));
		}

		return replies;
	}
}