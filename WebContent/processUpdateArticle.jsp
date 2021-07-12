	<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
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

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		String sql = "select * from article where a_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, articleId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE article SET a_title=?, a_subtitle=?, a_content=?, a_fileName=? WHERE a_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article_title);
				pstmt.setString(2, article_subtitle);
				pstmt.setString(3, content);
				pstmt.setString(4, fileName);
				pstmt.setString(5, articleId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE article SET a_title=?, a_subtitle=?, a_content=? WHERE a_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article_title);
				pstmt.setString(2, article_subtitle);
				pstmt.setString(3, content);
				pstmt.setString(4, articleId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editArticle.jsp?edit=update");
%>


