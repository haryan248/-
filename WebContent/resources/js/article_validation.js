function CheckAddArticle() {

	var articleId = document.getElementById("articleId");
	var title = document.getElementById("article_title");
	
	// 상품아아디 체크
	if (!check(/^article[0-9]{1,5}$/, articleId,
			"[보도 자료 코드]\narticle과 숫자를 조합하여 8~12자까지 입력하세요\n첫 글자는 반드시 article로 시작하세요"))
		return false;
	// 상품명 체크
	if (title.value.length < 4 || title.value.length > 12) {
		alert("[보도 자료 제목]\n최소 4자에서 최대 12자까지 입력하세요");
		title.select();
		title.focus();
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

	 document.newArticle.submit()
}
