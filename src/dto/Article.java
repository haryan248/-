package dto;

import java.io.Serializable;

public class Article implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String articleId; // 보도자료 ID
	private String article_title; // 보도자료 제목
	private String article_subtitle; // 보도자료 부제
	private String content; // 내용
	private String filename; // 이미지 파일

	public Article() {
		super();
	}

	public Article(String articleId) {
		this.articleId = articleId;
	}

	public String getArticleId() {
		return articleId;
	}

	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String description) {
		this.content = description;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_subtitle() {
		return article_subtitle;
	}

	public void setArticle_subtitle(String article_subtitle) {
		this.article_subtitle = article_subtitle;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}
