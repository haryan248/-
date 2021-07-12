<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Article"%>
<%@ page import="dao.ArticleRepository"%>
<%@ page errorPage ="exceptionNoArticleId.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>보도자료 상세 내용</title>
<link rel="stylesheet" href="./resources/css/jquery.bxslider.css" media="screen">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<!-- 
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="shortcut icon" href="./resources/images/porsche_favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="./resources/js/sidemenu.js"></script>
<script type="text/javascript" src="./resources/js/banner.js"></script>
<script type="text/javascript" src="./resources/js/scroll.js"></script> -->

<title>Article</title>
</head>
<%@ include file="topbar.jsp"%>
	<%
		String id = request.getParameter("id");
		ArticleRepository dao = ArticleRepository.getInstance();
		Article article = dao.getArticleById(id);
	%>
<body>
	<hr>
	<br>
	<br>
	<article id="content">
		<section class="container">
			<div class="cover-list">
				<div class="inner">
					<div class="article_subtitle"><%=article.getArticle_subtitle()%></div>
					<img class="articlepicture"	src="./resources/images/<%=article.getFilename()%>">
					<div class="article">
						<hr>
						<h2><%=article.getArticle_title()%></h2>
						<p><%=article.getContent()%>
					</div>
				</div>
			</div>
			<%@ include file="location.jsp"%>
	</section>
	</article>
	<hr>
	<%@ include file="footer.jsp"%>
</body>
</html>