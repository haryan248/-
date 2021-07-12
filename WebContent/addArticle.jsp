<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="./resources/images/porsche_favicon.ico" type="image/x-icon">

<script type="text/javascript"
	src="./resources/js/article_validation.js"></script>
<title>보도자료 등록</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<jsp:include page="menu.jsp" />
		<jsp:include page="editArticlebar.jsp" />
		<title><fmt:message key="title" /></title>
		<div class="login_banner">
			<div class="container">
				<h1 class="login_banner_text">
					<fmt:message key="title_a" />
				</h1>
			</div>
		</div>
		<div class="form-registeration">
			<div class="text-right">
				<a href="?language=ko" class="btn btn-sm btn-success pull-right">Korean</a>
				<a href="?language=en" class="btn btn-sm btn-success pull-right">English</a>
			</div>
			<form name="newArticle" action="./processAddArticle.jsp"
				class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="articleId" /></label>
					<div class="col-sm-3">
						<input type="text" id="articleId" name="articleId"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="article_title" /></label>
					<div class="col-sm-3">
						<input type="text" id="article_title" name="article_title"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="article_subtitle" /></label>
					<div class="col-sm-3">
						<input type="text" id="article_subtitle" name="article_subtitle"
							class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="content" /></label>
					<div class="col-sm-5">
						<textarea name="content" cols="900" rows="5"
							class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="articleImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="articleImage" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="button" class="btn btn-primary"
							value="<fmt:message key="button" />" onclick="CheckAddArticle()">
					</div>
				</div>
			</form>
		</div>
	</fmt:bundle>
</body>
</html>
