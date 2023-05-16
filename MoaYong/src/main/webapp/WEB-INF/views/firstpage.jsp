<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>




		<style>
			body {
				background-image:
					url("https://ts2.mm.bing.net/th?q=%EC%97%B0%ED%95%9C%20%EB%B3%B4%EB%9D%BC%EC%83%89&w=154&h=288");
				background-repeat: no-repeat;
				background-size: cover;
			}

			.main {
				/* rgba(0~255, 0~255, 0~255, 0~1)
               a : 1에 가까워질수록 색깔이 선명해진다 */
				background-color: rgb(255, 255, 255, 0.4);
				width: 400px;
				padding: 50px;
				border-radius: 50px;
				/* div요소 가운데 정렬 */
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
				/* 내부 가운데 정렬 */
				text-align: center;
			}

			.main>h1 {
				margin-top: 0;
			}

			#user-input {
				width: 200px;
				height: 30px;
				border: 0;
				font-weight: bold;
				margin-top: 10px;
				margin-bottom: 10px;
			}

			#login-button {
				background-color: rgb(255, 255, 255);
				width: 200px;
				height: 50px;
			}

			#sign-button {
				background-color: rgb(255, 255, 255);
			}

			#reset-button {
				background-color: rgb(255, 255, 255);
			}

			#sign-button {
				background-color: rgb(95, 18, 18);
				transition: background-color 0.5s ease-in-out;
			}

			#sign-button:hover {
				background-color: rgb(25, 40, 126);
			}

			#login-button {
				background-color: rgb(255, 255, 255);
				transition: background-color 0.5s ease-in-out;
			}

			#login-button:hover {
				background-color: rgb(200, 200, 200);
			}

			#reset-button {
				background-color: rgb(255, 255, 255);
				transition: background-color 0.5s ease-in-out;
			}

			#reset-button:hover {
				background-color: rgb(200, 200, 200);
			}
		</style>
		</head>

		<body>

			<!--modal-->
			<!-- sign modal-->
			<li>
				<h5>회원가입</h5>
			</li>
			<form action="join.do" method="POST">
				<li><input id="check" name="email" type="text" placeholder="ID 입력하세요">
				<li><input name="pw" type="password" placeholder="PW 입력하세요"></li>
				<li><input name="tel" type="text" placeholder="nickname 입력하세요"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</form>
			
			
			<!-- <dialog id="sign">
			</dialog>
					<!-- <label for="username"> ID: </label> <input type="text" id="username"
			name="username" required><br> <label for="password">
			Pw: </label> <input type="password" id="password" name="password" required><br>
		<label for="nickname"> Nick:</label> <input type="text" id="nickname"
			name="nickname" required><br> <br> -->
			-->


			<!-- reset modal-->

			<dialog id="reset">
				<form>

					<label for="reset-email">Email:</label> <input type="email" id="reset-email" name="reset-email"
						required><br>

					<button type="submit">Submit</button>
				</form>
			</dialog>


			<div class="main">
				<h1>Login</h1>

				<div id="result-area">ID</div>
				<input type="text" id="user-input">

				<div id="chance-area">Passward</div>
				<input type="text" id="user-input">



				<div class="button-area">
					<button id="login-button">Login</button>
					<br> <br>

					<button id="sign-button">회원가입</button>

					<button id="reset-button">회원찾기</button>

				</div>
			</div>

			<!-- <script>
        const modal = document.querySelector("#modal")
        const btn = document.querySelector("#showBtn")

        btn.addEventListener("click", function () {
            modal.showModal();
        })

    </script> -->

			<script>
				$('#sign-button').on('click', function () {
					sign.showModal();
				});

				$('#login-button').on('click', function name(params) {

				});

				$('#reset-button').on('click', function () {
					reset.showModal();
				});
			</script>











		</body>

	</html>