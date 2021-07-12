<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Vehicle"%>
<%@ page import="dao.VehicleRepository"%>

<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("home.jsp#Vehicle");
		return;
	}

	VehicleRepository dao = VehicleRepository.getInstance();
	
	Vehicle product = dao.getVehicleById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoVehicleId.jsp");
	}

	ArrayList<Vehicle> cartList = (ArrayList<Vehicle>) session.getAttribute("cartlist");
	Vehicle goodsQnt = new Vehicle();
	for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
		goodsQnt = cartList.get(i);
		if (goodsQnt.getVehicleId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
