<%@ page contentType="text/html; charset=utf-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="cover-footer">
	<div class="image"
		style="background-image: url(https://files.porsche.com/filestore/image/multimedia/none/e-performance-home-banner/normal/2de3eda7-bdd4-11e9-80c4-005056bbdc38/porsche-normal.jpg);">
	</div>
	<iframe width="100%" height="100" scrolling="no" frameborder="no"
		src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/412411938&color=%23c31b21&auto_play=true&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe>
</div>
<footer id="footer">
	<div class="row">
		<div class="header">
			<div class="header_icon">
				<ul>
					<li><a href="http://kutis.kyonggi.ac.kr/webkutis/"
						class="email"><span>KUTIS</span></a></li>
					<li><a href="https://www.facebook.com/porsche.sscl/"
						class="facebook"><span>Fackbook</span></a></li>
					<li><a href="https://www.instagram.com/porsche/?hl=ko"
						class="instagram"><span>instagram</span></a></li>
					<li><a href="https://www.youtube.com/user/Porsche"
						class="youtube"><span>youtube</span></a></li>
				</ul>
				<jsp:useBean id="now" class="java.util.Date"/>
				<fmt:timeZone value="GMT+9">
					<fmt:formatDate value="${now}" type="time"/>
				</fmt:timeZone>
			</div>
			<div>
				<span class="show-on-scroll" id="topBtn"></span>
			</div>
			<p class="copyright">&copy; DESIGN BY HyunJoon</p>
		</div>
	</div>
</footer>