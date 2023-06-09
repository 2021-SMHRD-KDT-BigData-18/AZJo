<%@ page import="com.smhrd.entity.User"%>
<%@ page import="com.smhrd.entity.Board"%>
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
<title>Stellar by HTML5 UP</title>
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


<body class="is-preload">

	<!-- 유저정보 받아오기-->
	<%
	User user = (User) session.getAttribute("user");
	String login_id = user.getT_id();
	System.out.println(user);
	%>





	<!-- 맨 위에 있는, 이동하는 네비게이션 -->
	<nav id="nav">
		<ul>
			<li><a href="goMain.do" class="active">게시판</a></li>
			<li><a href="GomypagePrjList.do">프로젝트 리스트</a></li>
			<li><a href="goMypage.do">마이페이지</a></li>
			<%
			if (user != null) {
			%>
			<button type="submit" id="logout-btn">
				<a href="logout.do">로그아웃</a>
			</button>
			<span class="image"><img src="images/pic01.jpg" alt="" /></span>
			<%
			}
			%>
		</ul>
	</nav>

	<header id="header">
		<p></p>
	</header>

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">



			<!-- Content -->
			<section id="content" class="main">




				<!-- 폼 태그 -->
				<table>
					<tr>
						<td>
							<div style="float: left; max-width: none;">카테고리 :
								${viewPostContent.prj_category}</div>
							<div style="float: left; margin-left: 30%; max-width: none;">
								상태 : ${viewPostContent.status}</div>
							<div style="float: right; max-width: none;">글 번호 :
								${viewPostContent.prj_seq}</div>

						</td>
					</tr>
					<tr>
						<td>
							<div style="max-width: none;">인원모집 마감일 :
								${viewPostContent.deadline_dt}</div>
							<div style="float: left; max-width: none;">프로젝트 시작일 :
								${viewPostContent.start_dt}</div>
							<div style="float: right; max-width: none;">프로젝트 종료일 :
								${viewPostContent.end_dt}</div>
						</td>
					</tr>
					<tr>
						<td>
							<div
								style="float: left; max-width: none; margin: 12.5px 38px 0px 0px; padding-right: 15px;">
								제목 : ${viewPostContent.prj_name}</div> <!-- <input name="prj_name" type="text" placeholder="제목을 입력하세요"
								style="float: left; width: 70%;"> -->
						</td>
					</tr>
					<tr>
						<td>
							<div
								style="float: left; max-width: none; margin-top: 12.5px; padding-right: 15px;">
								모집현황 : ${viewPostContent.join_count} /
								${viewPostContent.recruit_count}</div> <!-- <div
									style="float: right; max-width: none; margin-top: 12.5px; padding-right: 15px;">
									이미지 첨부 : <input type="file" style="float: right;"> <br>
								</div> -->
						</td>
					</tr>
				</table>

				<!-- <table>
						<tr>
							<td><select id="font">
									<option value="default">글씨체</option>
									<option value="serif">Serif</option>
									<option value="sans-serif">Sans-serif</option>
									<option value="monospace">Monospace</option>
								</select> <select id="font_size">
									<option value="default">글씨 크기</option>
									<option value="small">작게</option>
									<option value="medium">보통</option>
									<option value="large">크게</option>
								</select> <select id="color">
									<option value="default">색상</option>
									<option value="red">빨강</option>
									<option value="green">초록</option>
									<option value="blue">파랑</option>
								</select></td>
						</tr>
					</table> -->

				<!--지도부분 시작-->
				<div id="map"
					style="width: 400x; height: 300px; margin-bottom: 20px;"></div>
				<!--  지도부분 끝 -->
				<table>
					<tr>
						<td style="padding: 50px 0px 50px 0px;">
							${viewPostContent.post}</td>
					</tr>
				</table>
				<!-- <div>
						<button id="mapBtn" type="button"
							style="float: left; margin-right: 15px;">검색</button>
						<input type="text" id="mapSearch" placeholder="지도 검색어를 입력하세요"
							style="float: left; width: 22.5%;">
					</div> -->





				<%
				Board viewPostContent = (Board) request.getAttribute("viewPostContent");
				String poster_id = viewPostContent.getT_id();
				%>
				<div style="display: flex; justify-content: flex-end;">
					<%
					if (login_id.equals(poster_id)) {
					%>
					<!-- 작성자 본인에게만 보이게 시작 -->
					<form action="goModifyPost.do" method="post">
						<input type="hidden" name="prj_seq"
							value="${viewPostContent.prj_seq}"> <input type="hidden"
							name="prj_category" value="${viewPostContent.prj_category}">
						<input type="hidden" name="deadline_dt"
							value="${viewPostContent.deadline_dt }"> <input
							type="hidden" name="start_dt" value="${viewPostContent.start_dt}">
						<input type="hidden" name="end_dt"
							value="${viewPostContent.end_dt}"> <input type="hidden"
							name="prj_name" value="${viewPostContent.prj_name}"> <input
							type="hidden" name="recruit_count"
							value="${viewPostContent.recruit_count}"> <input
							type="hidden" name="post" value="${viewPostContent.post}">
						<button type="submit" id="Modifybtn"
							style="float: right; max-width: none;">수정</button>
					</form>

					<form action="deletePost.do">
						<input type="hidden" name="prj_seq"
							value="${viewPostContent.prj_seq}">
						<button type="submit" id="deletebtn"
							style="float: right; max-width: none; margin-left: 5%;">삭제</button>
					</form>

					<!-- 작성자 본인에게만 보이게 끝 -->
					<%
					} else {
					%>


					<form id="joinForm">
						<input type="hidden" name="prj_seq"
							value="${viewPostContent.prj_seq}"> <input type="hidden"
							name="t_id" value="${user.t_id}">
						<button type="button" id="joinButton">참가신청</button>
					</form>


					<%
					}
					%>

				</div>

				<!-- 댓글 달기  -->
				<form action="uploadReply.do" method="post">
					<input type="hidden" name="prj_seq"
						value="${viewPostContent.prj_seq }"> <input type="hidden"
						name="t_id" value="${user.t_id }">
					<textarea name="reply_comment" placeholder="내용을 입력해주세요."></textarea>
					<div style="display: flex; justify-content: flex-end;">
						<button type="submit">댓글달기</button>
					</div>
				</form>

				<!--  댓글 리스트  -->
				<table>
					<c:forEach items="${viewReply}" var="reply">
						<tr>
							<td>
								<div style="float: left; max-width: none;">작성자 :
									${reply.t_id}</div>
								<div style="float: left; margin-left: 10%; max-width: none;">
									작성내용 : ${reply.reply_comment}</div>
								<div style="float: right; max-width: none;">작성일시 :
									${reply.comment_dt}</div>
							</td>
						</tr>
					</c:forEach>
				</table>


				<!-- <a><c items="${user}" var="user">${user.nickname}님</a> -->





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

	<!--  
		top_btn
		바로는 안보이고 아래로 어느정도 스크롤을 내려야 버튼이 표시됌 
	-->
	<div>
		<a href="#header" id="top_btn"><img src="/images/icon_to_top.png"
			title="위로 가기"></a>
	</div>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<!-- 스크립트 태그 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=66b7264945f08eec5af71755a23a6285&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		var mapOption = {
			center : new kakao.maps.LatLng(37.5665, 126.9780), // 지도 중심좌표 (서울시청)
			level : 8
		// 지도 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성

		var geocoder = new kakao.maps.services.Geocoder();

		var searchKeyword = document.getElementById('mapSearch');
		var searchButton = document.getElementById('mapBtn');

		searchButton.addEventListener('click', function() {
			var keyword = searchKeyword.value;
			geocoder.addressSearch(keyword,
					function(result, status) {
						if (status === kakao.maps.services.Status.OK) {
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);
							map.setCenter(coords);
							displayMarker(coords);
						}
					});
		});

		function displayMarker(coords) {
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});
		}
	</script>





	<script>
		// var registerbtn = document.getElementById("register");
		// registerbtn.addEventListener('click', () => {
		// alert("게시 완료")
		// })
		// var registerbtn = document.getElementById("esc");
		// registerbtn.addEventListener('click', () => {
		//	alert("취소 완료")
		//})
	</script>
	<script type="text/javascript">
		// var escBtn = document.getElementById("esc");
		//escBtn.addEventListener('click', () => {
		//alert("취소 완료");
		//});   
		//참가신청
		$(document).ready(function() {
			$('#joinButton').click(function() {
				$.ajax({
					url : 'joinParty.do',
					type : 'POST',
					data : $('#joinForm').serialize(),
					success : function(response) {
						alert('참가신청 완료');
					},
					error : function(xhr, status, error) {
						alert('참가신청 실패');
					}
				});
			});
		});
	</script>

</body>

</html>