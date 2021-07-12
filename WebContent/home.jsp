<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link rel="shortcut icon" href="./resources/images/porsche_favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="./resources/css/jquery.bxslider.css" media="screen">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="./resources/js/sidemenu.js"></script>
<script type="text/javascript" src="./resources/js/banner.js"></script>
<script type="text/javascript" src="./resources/js/scroll.js"></script>

<title>PoscheKorea</title>
</head>

<!-- side menu -->
<%@ include file="sidemenu.jsp"%>
<body>
	<!-- response.setIntHeader("Refresh", 10);0); %> -->
	<%@ include file="topbar.jsp"%>
	<hr>
	<article id="content">
		<!-- banner -->
		<%@ include file="banner.jsp"%>
		<!-- vehicle -->
		<%@ include file="vehicles.jsp"%>
		<!-- news room -->
		<%@ include file="newsRoom.jsp"%>
		<!-- video -->
		<%@ include file="video.jsp"%>
		<!-- location -->
		<%@ include file="location.jsp"%>
		<!-- footer -->
		<%@ include file="footer.jsp"%>
	</article>
	<hr>
</body>
</html>
