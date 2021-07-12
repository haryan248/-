<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="./resources/css/jquery.bxslider.css" media="screen">
<title>보도자료 정보 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="editArticlebar.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">보도자료 정보 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String vehicleId = request.getParameter("id");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from article where a_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, vehicleId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>
	<div class="form-registeration">
		<img src="./resources/images/<%=rs.getString("a_filename")%>"
			alt="image" style="width: 100%" align="center" />
			<br>
			<br>
		<form name="newVehicle" action="./processUpdateArticle.jsp"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">기사 및 보도자료 제목</label>
				<div class="col-sm-7">
					<input type="text" id="article_title" name="article_title" class="form-control"
						value="<%=rs.getString("a_title")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">기사 및 보도자료 부제</label>
				<div class="col-sm-7">
					<input type="text" id="article_subtitle" name="article_subtitle"
						class="form-control" value="<%=rs.getString("a_subtitle")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-12">
					<textarea name="content" cols="2000" rows="11"
						class="form-control"><%=rs.getString("a_content")%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="articleImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>

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
</body>
</html>
