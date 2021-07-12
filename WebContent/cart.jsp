<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Vehicle"%>
<%@ page import="dao.VehicleRepository"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="./resources/images/porsche_favicon.ico" type="image/x-icon">
<%
	String cartId = session.getId();
%>
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="login_banner">
		<div class="container">
			<h1 class="login_banner_text">장바구니</h1>
		</div>
	</div>
	<div class="form-registeration">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%				
					int sum = 0;
					ArrayList<Vehicle> cartList = (ArrayList<Vehicle>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Vehicle>();

					for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
						Vehicle product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=product.getVehicleId()%> - <%=product.getVname()%></td>
					<td><%=product.getUnitPrice()%>000 KRW</td>
					<td><%=product.getQuantity()%></td>
					<td><%=total%>000 KRW</td>
					<td><a href="./removeCart.jsp?id=<%=product.getVehicleId()%>" class="badge badge-danger">삭제</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<%
						if (sum == 0) {
					%>
					<th><%=sum%> KRW</th>
					<%
						} else{
					%>
					<th><%=sum%>000 KRW</th>
					<%
						}
					%>
					<th></th>
				</tr>
			</table>
			<a href="./home.jsp#Vehicle" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
