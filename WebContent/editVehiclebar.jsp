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
						<a href="./home.jsp#Vehicle" class="login_btn btn-sm btn-success pull-right">차량 목록</a> 
						<a href="./addVehicle.jsp" class="login_btn btn-sm btn-success pull-right">차량 등록</a>
						<a href="./editVehicle.jsp?edit=update" class="login_btn btn-sm btn-success pull-right">차량 수정</a>
						<a href="./editVehicle.jsp?edit=delete" class="login_btn btn-sm btn-success pull-right">차량 삭제</a>		
					</div>
				</div>
			</div>
		<!--top bar-->
		<div class="topbar_container"></div>
	</header>
</div>