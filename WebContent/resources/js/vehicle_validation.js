function CheckAddVehicle() {

	var vehicleId = document.getElementById("vehicleId");
	var vname = document.getElementById("vname");
	var unitPrice = document.getElementById("unitPrice");
	var description = document.getElementById("description");
	var category = document.getElementById("category");
	var site = document.getElementById("site");
	var unitsInStock = document.getElementById("unitsInStock");
	
	// 차량아아디 체크
	if (vehicleId.value=="") {
		alert("필수 입력란입니다.");
		vehicleId.select();
		vehicleId.focus();
		return false;
	}else if (!check(/^Models[0-9]{1,6}$/, vehicleId,
			"[차량 코드]\nModels와 숫자를 조합하여 7~12자까지 입력하세요\n첫 글자는 반드시 Models로 시작하세요"))
		return false;
	
	// 차량명 체크
	if (vname.value=="") {
		alert("필수 입력란입니다.");
		vname.select();
		vname.focus();
		return false;
	}else if (vname.value.length < 4 || vname.value.length > 12) {
		alert("[차량명]\n최소 4자에서 최대 50자까지 입력하세요");
		vname.select();
		vname.focus();
		return false;
	}
	
	// 차량 가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;
	
	// 재고 수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newVehicle.submit()
}
