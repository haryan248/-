<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

<div class="cover-list">
	<div class="inner">
		<div class="Models_title" id="News">Newsroom</div>
		<div align="center">
		<div class="add_N">
			<a href="addArticle.jsp">보도자료 등록</a>
		</div>
		<div class="add_N">
			<a href="./editArticle.jsp?edit=update">보도자료 수정</a>
		</div>
		<div class="add_N">
			<a href="./editArticle.jsp?edit=delete">보도자료 삭제</a>
		</div>
		</div>
		<h2>국내 포르쉐 보도자료</h2>
		<%
				PreparedStatement pstmt_a = null;
				ResultSet rs_a = null;
				
				String sql_a = "select * from article";
				pstmt_a = conn.prepareStatement(sql_a);
				rs_a = pstmt_a.executeQuery();
				while (rs_a.next()) {
		%>
		<ul>
			<li><a href="./article.jsp?id=<%=rs_a.getString("a_id")%>">
					<figure>
						<img src="./resources/images/<%=rs_a.getString("a_fileName")%>"
							alt="news1" />
					</figure> 
					<span class="title"><%=rs_a.getString("a_title")%></span> 
					<span class="excerpt"><%=rs_a.getString("a_content")%></span>
			</a></li>
		</ul>
		<%
				}
				
			if (rs_a != null)
				rs_a.close();
 			if (pstmt_a != null)
 				pstmt_a.close();
 			if (conn != null)
				conn.close();
			%>
	</div>
</div>