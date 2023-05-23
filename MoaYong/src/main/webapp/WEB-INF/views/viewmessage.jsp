<%@ page import="com.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
<title>viewMessage</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<!-- 캘린더 api -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
<!-- ajax 비동기 통신에 필요-->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- js파일 경로-->
<script src="assets/js/index.js"></script>
<!-- 프리셋 html로 작업 후 변경 필요-->
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>

</head>

<%
	User user = (User) session.getAttribute("user");
	System.out.println(user);
	%>

<!-- 맨 위에 있는 이동하는 네비게이션 -->
<nav id="nav">
	<ul>
		<!-- <div class="logo"><img src="/images/pic01.jpg" alt="" /></div> -->
		<li><a href="goMain.do" classs="active">게시판</a></li>
		<li><a href="GoPrjGant.do">프로젝트 관리</a></li>

		<!-- 로그인한 계정의 마이페이지로 이동이 되어야함. -->
		<li><a href="goMypage.do">마이페이지</a></li>

		<%
			if (user != null) {
			%>
		<button type="submit" id="logout-btn">
			<a href="logout.do">로그아웃</a>
		</button>
		<!-- 원래는 개인별 db에 저장된 이미지의 경로로 개인의 프로필 사진을 불러와야하지만 일단 이미지 절대경로로 로드-->
		<span class="image"><img src="images/pic01.jpg" alt="" /></span>
		<%
			}
			%>

	</ul>
</nav>

<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<h1>쪽지 보기</h1>
		</header>
		<!-- Main -->
		<div id="main">
			<!-- Content -->
			<section id="content" class="main">
				<h3>MOAYONG</h3>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>보낸 사람 : ${viewmessage.sender_id}</th>
								<th>보낸 시간 : ${viewmessage.msg_dt}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3"><br> ${viewmessage.msg_content} <br> <br> <br>
									<br> <br> <br> <br></td>
							</tr>
						</tbody>
						
					</table>
				</div>
				<a href="goMypage.do" class="button"> 뒤로가기 </a>


				<!-- 프로필 사진 클래스명 image에서 photo로 변경(css파일 선택자도 함께) 변경 -->
				<!-- 일단 이미지 크기는 높이 폭 모두 16em-->
		</div>

		<section></section>


		</section>

	</div>

	<!-- Footer -->
	<footer id="footer">
		<section>
			<h2>Aliquam sed mauris</h2>
			<p>Sed lorem ipsum dolor sit amet et nullam consequat feugiat
				consequat magna adipiscing tempus etiam dolore veroeros. eget
				dapibus mauris. Cras aliquet, nisl ut viverra sollicitudin, ligula
				erat egestas velit, vitae tincidunt odio.</p>
			<ul class="actions">
				<li><a href="#" class="button">Learn More</a></li>
			</ul>
		</section>
		<section>
			<h2>Etiam feugiat</h2>
			<dl class="alt">
				<dt>Address</dt>
				<dd>1234 Somewhere Road &bull; Nashville, TN 00000 &bull; USA</dd>
				<dt>Phone</dt>
				<dd>(000) 000-0000 x 0000</dd>
				<dt>Email</dt>
				<dd>
					<a href="#">information@untitled.tld</a>
				</dd>
			</dl>
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter alt"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f alt"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram alt"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-github alt"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble alt"><span
						class="label">Dribbble</span></a></li>
			</ul>
		</section>
		<p class="copyright">
			&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
		</p>
	</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>

</html>