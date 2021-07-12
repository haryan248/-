<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="shortcut icon" href="./resources/images/porsche_favicon.ico" type="image/x-icon">
<script type="text/javascript">
	function idCheck(){
		if (!document.memberID.id.value) {
			alert("아이디를 입력하세요.");
			document.memberID.id.select();
			document.memberID.id.focus();
			return false;
		}else if (document.memberID.id.value.length >10 || document.memberID.id.value.length < 4) {
			alert("아이디를 4 ~ 10자 이내로 입력하세요.");
			document.memberID.id.select();
			document.memberID.id.focus();
			return false;
		}
	}
</script>
</head>
<body>
<br><br><br>
	<jsp:include page="/menu.jsp" />
	<form name="memberID" method="post" action="processCheckId.jsp" onsubmit="return idCheck()">
		<div class="col-sm-10" align ="center">
			아이디 : <input name="id" type="text" class="form-controler" placeholder="id" maxlength="10">
			<input type="submit" class="btn btn-primary " value="아이디 중복 확인">
		</div>
		<div class="col-sm-2">
		</div>
	</form>
</body>
</html>
