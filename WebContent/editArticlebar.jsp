<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

<%@ page contentType="text/html; charset=utf-8"%>

<div id="wrap">
	<header id="header">
			<div class="topbar">
				<a href="home.jsp" style="text-decoration: none"> <img
					class="Logo" src="./resources/images/Logo.png">
				</a>
				<div class="text-right">
					<div class="login_logout_text">
						<a href="./home.jsp#News" class="login_btn btn-sm btn-success pull-right">뉴스 목록</a> 
						<a href="./addArticle.jsp" class="login_btn btn-sm btn-success pull-right">뉴스 등록</a>
						<a href="./editArticle.jsp?edit=update" class="login_btn btn-sm btn-success pull-right">뉴스 수정</a>
						<a href="./editArticle.jsp?edit=delete" class="login_btn btn-sm btn-success pull-right">뉴스 삭제</a>		
					</div>
				</div>
			</div>
		<!--top bar-->
		<div class="topbar_container"></div>
	</header>
</div>