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

	Vehicle vehicle = dao.getVehicleById(id);
	if (vehicle == null) {
		response.sendRedirect("exceptionNoVehicleId.jsp");
	}

	ArrayList<Vehicle> goodsList = dao.getAllVehicles();
	Vehicle goods = new Vehicle();
	for (int i = 0; i < goodsList.size(); i++) {
		goods = goodsList.get(i);
		if (goods.getVehicleId().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Vehicle> list = (ArrayList<Vehicle>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Vehicle>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Vehicle goodsQnt = new Vehicle();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getVehicleId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		goods.setQuantity(1);
		list.add(goods);
	}

	response.sendRedirect("vehicle.jsp?id=" + id);
%>