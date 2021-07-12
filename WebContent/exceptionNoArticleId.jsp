<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>보도자료ID 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp" />	
	<div class="login_banner">
		<div class="container">
			<h2 class="alert alert-danger">해당 보도자료가 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="form-registeration">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
		<br>
		<p><a href="home.jsp#News" class="btn btn-secondary"> Home &raquo;</a>			
	</div>
</body>
</html>
