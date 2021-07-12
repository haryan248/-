<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Vehicle"%>
<%@ page import="dao.VehicleRepository"%>
<%@ page errorPage ="exceptionNoVehicleId.jsp"%>
<html>
<head>
<link rel="shortcut icon" href="./resources/images/porsche_favicon.ico" type="image/x-icon">
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<title>차량 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("차량을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">차량 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		VehicleRepository dao = VehicleRepository.getInstance();
	    Vehicle vehicle = dao.getVehicleById(id);
	%>
	<div class="container" align = "Center">
		<div class="row">
			<h1><%=vehicle.getVname()%></h1>
			<div class ="col-md-5">
				<img src="./resources/images/<%=vehicle.getFilename()%>" style="width: 100%" />
			</div>
			<div class="col-md-5" >
				<br><h3><%=vehicle.getDescription()%></h3><br>
				<h4><b>차량 코드 : </b><span class="badge badge-danger"> <%=vehicle.getVehicleId()%></span></h4><br>
				<h4><b>분류 </b> : <%=vehicle.getCategory()%></h4><br>
				<h4><b>재고 수</b> : <%=vehicle.getUnitsInStock()%></h4><br>
				<h4><b>출시일</b> : <%=vehicle.getReleaseDate()%></h4><br>
				<h4><%=vehicle.getUnitPrice()%>000 KRW </h4><br>
				<h2><form name="addForm" action="./addCart.jsp?id=<%=vehicle.getVehicleId()%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 차량 주문 &raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>					
					<a href="./home.jsp#Vehicle" class="btn btn-secondary"> 차량 목록 &raquo;</a>
				</form>
				</h2>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
