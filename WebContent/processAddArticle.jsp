<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="dto.Article"%>
<%@ page import="dao.ArticleRepository"%>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	
	File isDir = new File(realFolder); //해당 파일의 경로가 없을 경우 생성
    if(!isDir.isDirectory()){
    	isDir.mkdir();
    }
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String articleId = multi.getParameter("articleId");
	String article_title = multi.getParameter("article_title");
	String article_subtitle = multi.getParameter("article_subtitle");
	String content = multi.getParameter("content");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	ArticleRepository dao = ArticleRepository.getInstance();

	Article newArticle = new Article();
	newArticle.setArticleId(articleId);
	newArticle.setArticle_title(article_title);
	newArticle.setArticle_subtitle(article_subtitle);
	newArticle.setContent(content);
	newArticle.setFilename(fileName);

	dao.addArticle(newArticle);

	PreparedStatement pstmt = null;
	
	String sql = "insert into article values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, articleId);
	pstmt.setString(2, article_title);
	pstmt.setString(3, article_subtitle);
	pstmt.setString(4, content);
	pstmt.setString(5, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("home.jsp#News");
%>
