<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./resources/css/jquery.bxslider.css" media="screen">
<title>보도자료 정보 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 뉴스을 삭제합니다.") == true)
			location.href = "./deleteArticle.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="editArticlebar.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">보도자료 정보 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;	
				ResultSet rs = null;
				
				String sql = "select * from article";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-6">
				<img src="./resources/images/<%=rs.getString("a_fileName")%>" style="width: 100%">
				<br><br>
				<h3><%=rs.getString("a_title")%></h3>
				<br>				
				<p><%=rs.getString("a_subtitle")%>
				<p><div class="content"><%=rs.getString("a_content")%></div>
				<br>
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="./updateArticle.jsp?id=<%=rs.getString("a_id")%>"	class="btn btn-success" role="button"> 수정 >></a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("a_id")%>')" class="btn btn-success" role="button">삭제 >></a>
					<%
						}
					%>				
			</div>
			<%
				}
				if (rs != null)
					rs.close();
	 			if (pstmt != null)
	 				pstmt.close();
	 			if (conn != null)
					conn.close();
	 			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>