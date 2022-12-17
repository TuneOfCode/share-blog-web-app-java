<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0">
<meta charset="utf-8">
<link rel="shortcut icon" href="assets/images/favicon-32x32.png"
	type="image/x-icon" />
<title>Trang tài khoản của thành viên</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
*, *::after, *::before {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	user-select: none;
}
/* Generic */
body {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Montserrat', sans-serif;
	font-size: 12px;
	background-color: #ecf0f3;
	color: #a0a5a8;
}
/**/
.main {
	position: relative;
	width: 1000px;
	min-width: 1000px;
	min-height: 600px;
	height: 600px;
	padding: 25px;
	background-color: #ecf0f3;
	box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #f9f9f9;
	border-radius: 12px;
	overflow: hidden;
}

@media ( max-width : 1200px) {
	.main {
		transform: scale(0.7);
	}
}

@media ( max-width : 1000px) {
	.main {
		transform: scale(0.6);
	}
}

@media ( max-width : 800px) {
	.main {
		transform: scale(0.5);
	}
}

@media ( max-width : 600px) {
	.main {
		transform: scale(0.4);
	}
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 0;
	width: 600px;
	height: 100%;
	padding: 25px;
	background-color: #ecf0f3;
	transition: 1.25s;
}

.form {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	width: 100%;
	height: 100%;
}

.form__icon {
	object-fit: contain;
	width: 30px;
	margin: 0 5px;
	opacity: 0.5;
	transition: 0.15s;
}

.form__icon:hover {
	opacity: 1;
	transition: 0.15s;
	cursor: pointer;
}

.form__input {
	width: 350px;
	height: 40px;
	margin: 4px 0;
	padding-left: 25px;
	font-size: 13px;
	letter-spacing: 0.15px;
	border: none;
	outline: none;
	font-family: 'Montserrat', sans-serif;
	background-color: #ecf0f3;
	transition: 0.25s ease;
	border-radius: 8px;
	box-shadow: inset 2px 2px 4px #d1d9e6, inset -2px -2px 4px #f9f9f9;
}

.form__input:focus {
	box-shadow: inset 4px 4px 4px #d1d9e6, inset -4px -4px 4px #f9f9f9;
}

.form__span {
	margin-top: 30px;
	margin-bottom: 12px;
}

.form__link {
	color: #181818;
	font-size: 15px;
	margin-top: 25px;
	border-bottom: 1px solid #a0a5a8;
	line-height: 2;
}

.title {
	font-size: 34px;
	font-weight: 700;
	line-height: 3;
	color: #181818;
}

.description {
	font-size: 14px;
	letter-spacing: 0.25px;
	text-align: center;
	line-height: 1.6;
}

.button {
	width: 180px;
	height: 50px;
	border-radius: 25px;
	margin-top: 50px;
	font-weight: 700;
	font-size: 14px;
	letter-spacing: 1.15px;
	background-color: #4b70e2;
	color: #f9f9f9;
	box-shadow: 8px 8px 16px #d1d9e6, -8px -8px 16px #f9f9f9;
	border: none;
	outline: none;
}

/**/
.a-container {
	z-index: 100;
	left: calc(100% - 600px);
}

.b-container {
	left: calc(100% - 600px);
	z-index: 0;
}

.switch {
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 400px;
	padding: 50px;
	z-index: 200;
	transition: 1.25s;
	background-color: #ecf0f3;
	overflow: hidden;
	box-shadow: 4px 4px 10px #d1d9e6, -4px -4px 10px #f9f9f9;
}

.switch__circle {
	position: absolute;
	width: 500px;
	height: 500px;
	border-radius: 50%;
	background-color: #ecf0f3;
	box-shadow: inset 8px 8px 12px #d1d9e6, inset -8px -8px 12px #f9f9f9;
	bottom: -60%;
	left: -60%;
	transition: 1.25s;
}

.switch__circle--t {
	top: -30%;
	left: 60%;
	width: 300px;
	height: 300px;
}

.switch__container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	position: absolute;
	width: 400px;
	padding: 50px 55px;
	transition: 1.25s;
}

.switch__button, .button-submit {
	cursor: pointer;
}

.switch__button:hover, .button-submit:hover {
	box-shadow: 6px 6px 10px #d1d9e6, -6px -6px 10px #f9f9f9;
	transform: scale(0.985);
	transition: 0.25s;
}

.switch__button:active, .switch__button:focus, .button-submit:focus {
	box-shadow: 2px 2px 6px #d1d9e6, -2px -2px 6px #f9f9f9;
	transform: scale(0.97);
	transition: 0.25s;
}
/**/
.is-txr {
	left: calc(100% - 400px);
	transition: 1.25s;
	transform-origin: left;
}

.is-txl {
	left: 0;
	transition: 1.25s;
	transform-origin: right;
}

.is-z200 {
	z-index: 200;
	transition: 1.25s;
}

.is-hidden {
	visibility: hidden;
	opacity: 0;
	position: absolute;
	transition: 1.25s;
}

.is-gx {
	animation: is-gx 1.25s;
}

.error {
	display: block;
	text-align: center;
	font-weight: bold;
	font-size: 18px;
	color: red;
	background-color: lightpink;
	padding: 5px 10px;
	margin-bottom: 5px;
	border-radius: 5px;
	text-align: center;
	border-radius: 5px;
}

@
keyframes is-gx { 0%, 10%, 100% {
	width: 400px;
}

30


















































%
,
50


















































%
{
width


















































:


















































500px



































;
}
/* capcha */
#image {
	margin-top: 10px;
	box-shadow: 5px 5px 5px 5px gray;
	width: 60px;;
	padding: 20px;
	font-weight: 400;
	padding-bottom: 0px;
	height: 40px;
	user-select: none;
	text-decoration: line-through;
	font-style: italic;
	font-size: x-large;
	border: red 2px solid;
	margin-left: 10px;
}

#user-input {
	box-shadow: 5px 5px 5px 5px gray;
	width: auto;
	margin-right: 10px;
	padding: 10px;
	padding-bottom: 0px;
	height: 40px;
	border: red 0px solid;
}

input {
	border: 1px black solid;
}

.inline {
	display: inline-block;
}

#btn {
	box-shadow: 5px 5px 5px grey;
	color: aqua;
	margin: 10px;
	background-color: brown;
}
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;800&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="main">
		<div id="styleForm">${styleForm }</div>

		<c:choose>
			<c:when test="${param['btnSignUp'] != null && isCorrect == '1'}">
				<c:set var="msgSignUpForm"
					value="Đăng ký thành công! Hãy đăng nhập." scope="page" />
				<c:set var="msgSignInForm" value="" scope="page" />
				<c:set var="cssAForm" value="is-txl" scope="page" />
				<c:set var="cssBForm" value="is-txl is-z200" scope="page" />
				<c:set var="cssBtn" value="is-txr" scope="page" />
				<c:set var="notify" value="Thông báo" scope="page" />
				<c:set var="text" value="text-success" scope="page" />
				<c:set var="alert" value="alert-success" scope="page" />
				<c:set var="icon" value="fa-bell" scope="page" />
				<c:set var="showNotify" value="d-block" scope="page" />
			</c:when>
			<c:when test="${param['btnSignUp'] != null && isCorrect == '0'}">
				<c:set var="msgSignUpForm"
					value="Đăng ký thất bại! Email hoặc tên đăng nhập của bạn đã được sử dụng trước đó."
					scope="page" />
				<c:set var="msgSignInForm" value="" scope="page" />
				<c:set var="cssAForm" value="is-txl" scope="page" />
				<c:set var="cssBForm" value="is-txl is-z200" scope="page" />
				<c:set var="cssBtn" value="is-txr" scope="page" />
				<c:set var="notify" value="Lỗi" scope="page" />
				<c:set var="text" value="text-danger" scope="page" />
				<c:set var="alert" value="alert-danger" scope="page" />
				<c:set var="icon" value="fa-triangle-exclamation" scope="page" />
				<c:set var="showNotify" value="d-block" scope="page" />
			</c:when>
			<c:when test="${param['btnSignIn'] != null && isCorrect == '0'}">
				<c:set var="msgSignUpForm" value="" scope="page" />
				<c:set var="msgSignInForm"
					value="Đăng nhập thất bại! Tài khoản hoặc mật khẩu không chính xác hoặc tài khoản của bạn đã bị vô hiệu hoá. 
					Vui lòng nhập lại!"
					scope="page" />
				<c:set var="cssAForm" value="" scope="page" />
				<c:set var="cssBForm" value="" scope="page" />
				<c:set var="cssBtn" value="" scope="page" />
				<c:set var="notify" value="Lỗi" scope="page" />
				<c:set var="text" value="text-danger" scope="page" />
				<c:set var="alert" value="alert-danger" scope="page" />
				<c:set var="icon" value="fa-triangle-exclamation" scope="page" />
				<c:set var="showNotify" value="d-block" scope="page" />
			</c:when>
			<c:otherwise>
				<c:set var="msgSignUpForm" value="" scope="page" />
				<c:set var="msgSignInForm" value="" scope="page" />
				<c:set var="cssAForm" value="" scope="page" />
				<c:set var="cssBForm" value="" scope="page" />
				<c:set var="cssBtn" value="" scope="page" />
				<c:set var="notify" value="" scope="page" />
				<c:set var="text" value="" scope="page" />
				<c:set var="alert" value="" scope="page" />
				<c:set var="icon" value="" scope="page" />
				<c:set var="showNotify" value="d-none" scope="page" />
			</c:otherwise>
		</c:choose>

		<c:if test="${param['type'] == 'register'}">
			<c:set var="cssAForm" value="is-txl" scope="page" />
			<c:set var="cssBForm" value="is-txl is-z200" scope="page" />
			<c:set var="cssBtn" value="is-txr" scope="page" />
		</c:if>

		<div class="container a-container ${cssAForm }" id="a-container">
			<form class="form" id="a-form" method="post" action="account">
				<h2 class="form_title title">Đăng nhập Thành Viên</h2>
				<div
					class="${showNotify } alert ${alert } ${text } text-center alert-dismissible fade show fs-6"
					role="alert">
					<i class="fa-solid ${icon }"></i> <strong>${notify }</strong>
					${msgSignInForm }
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

				<input required="required" id="txtUsername" class="form__input"
					type="text" name="txtUsername" placeholder="Tên đăng nhập"
					value="${usernameLogin }"><input required="required"
					id="txtPass" class="form__input" type="password" name="txtPass"
					placeholder="Mật khẩu" value="${passLogin }">

				<div id="area_capcha" onload="generate()">
					<div class="capcha"
						style="display: flex; flex-direction: row-reverse; justify-content: space-evenly; align-items: center;">
						<div onclick="generate()">
							<i class="fas fa-sync fa-2x"></i>
						</div>

						<div id="image" class="inline" style="font-size: 2em;"
							selectable="False"></div>
					</div>
					<div id="user-input" class="inline">
						<input required="required" type="text" class="form__input"
							id="txtCapcha" placeholder="Mã capcha" />
					</div>

					<p id="key"></p>
				</div>

				<!-- 					<a class="form__link">Quên mật khẩu? onclick="printmsg()"</a>  -->
				<input type="submit" id="btnSignIn"
					class="form__button button button-submit" name="btnSignIn"
					onclick="printmsg()" value="ĐĂNG NHẬP" />
			</form>
		</div>

		<div class="container b-container ${cssBForm }" id="b-container">
			<form class="form" id="b-form" method="post" action="account">
				<h2 class="form_title title">Đăng ký thành viên mới</h2>
				<div
					class="${showNotify } alert ${alert } ${text } text-center alert-dismissible fade show fs-6"
					role="alert">
					<i class="fa-solid ${icon }"></i> <strong>${notify }</strong>
					${msgSignUpForm }
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

				<input required="required" class="form__input" type="text"
					id="txtFullname" name="txtFullname"
					value="${ tv.getTenThanhVien()}" placeholder="Họ và tên (*)">
				<input required="required" class="form__input" type="text"
					id="txtUsername" name="txtUsername" value="${tv.getTenDangNhap() }"
					placeholder="Tên đăng nhập (*)"> <input required="required"
					class="form__input" type="password" id="txtPass" name="txtPass"
					value="${tv.getMatKhau() }" placeholder="Mật khẩu (*)"> <input
					required="required" class="form__input" type="email" id="txtEmail"
					name="txtEmail" value="${tv.getEmail() }" placeholder="Email (*)">
				<input class="form__input" type="tel"
					pattern="(84|0[3|5|7|8|9])+([0-9]{8})" id="txtPhone"
					name="txtPhone" value="${tv.getSoDienThoai() }"
					placeholder="Số điện thoại"> <select id="txtAddress"
					class="form__input form-select form-select-sm" name="txtAddress">
					<c:if test="${tv == null }">
						<option selected>-- Chọn địa chỉ tỉnh/TP đang sinh sống
							--</option>
					</c:if>
					<c:forEach var="province" items="${listProvinces}">
						<c:choose>
							<c:when test="${tv != null && tv.getDiaChi() == province}">
								<option value="${province }" selected>${province }</option>
							</c:when>
							<c:otherwise>
								<option value="${province }">${province }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> <select id="txtJob" class="form__input form-select form-select-sm"
					name="txtJob">
					<c:if test="${tv == null }">
						<option selected>-- Nghề nghiệp hiện tại --</option>
					</c:if>
					<c:forEach var="job" items="${listJobs }">
						<c:choose>
							<c:when test="${tv.getCongViec() == job}">
								<option selected value="${job }">${job }</option>
							</c:when>
							<c:otherwise>
								<option value="${job }">${job}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> <input id="btnSignUp" type="submit"
					class="form__button button button-submit" name="btnSignUp"
					value="ĐĂNG KÝ" />

			</form>
		</div>
		<script>
			$(document).ready(function(){
				$('#btnSignUp').click(function(){
					const data = {
							txtFullname: $('#txtFullname').val(),
							txtUsername: $('#txtUsername').val(),
							txtPass: $('#txtPass').val(),
							txtEmail: $('#txtEmail').val(),
							txtPhone: $('#txtPhone').val(),
							txtAddress: $('#txtAddress').val(),
							txtJob: $('#txtJob').val()
					}
					console.log('data: ', data)
					$.ajax({
						url: "account",
						type: "post",
						data: {
							txtFullname: $('#txtFullname').val(),
							txtUsername: $('#txtUsername').val(),
							txtPass: $('#txtPass').val(),
							txtEmail: $('#txtEmail').val(),
							txtPhone: $('#txtPhone').val(),
							txtAddress: $('#txtAddress').val(),
							txtJob: $('#txtJob').val()
						},
						success: function(data) {
							console.log(data)
						}
					})
				})
				setTimeout(function(){
					$('.alert').addClass("d-none");
				}, 10000)
			})
		</script>

		<div class="switch ${cssBtn }" id="switch-cnt">
			<div class="switch__circle is-txl"></div>
			<div class="switch__circle switch__circle--t is-txl"></div>
			<div class="switch__container is-hidden" id="switch-c1">
				<h2 class="switch__title title">Chào mừng !</h2>
				<p class="switch__description description">Bạn chưa có tài
					khoản? Hãy bấm vào đây</p>
				<button class="switch__button button switch-btn">Đăng ký</button>
			</div>
			<div class="switch__container" id="switch-c2">
				<h2 class="switch__title title">Chào mừng !</h2>
				<p class="switch__description description">Bạn đã có tài khoản?
					Hãy bấm vào đây</p>
				<button class="switch__button button switch-btn">Đăng nhập</button>
			</div>
		</div>
	</div>

	<!-- 	capcha -->
	<script type="text/javascript">

var capcha;
function generate() {

	// Clear old input
	let txtCapcha = document.getElementById("txtCapcha");
	if (txtCapcha) {
		txtCapcha.value = "";
	}

	// Access the element to store
	// the generated captcha
	capcha = document.getElementById("image");
	var uniquechar = "";

	const randomchar =
"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	// Generate captcha for length of
	// 5 with random character
	for (let i = 1; i < 5; i++) {
		uniquechar += randomchar.charAt(
			Math.random() * randomchar.length)
	}

	// Store generated input
	if (txtCapcha) {
		capcha.innerHTML = uniquechar;
	}
}

window.onload = function() {	
	generate()
}

function printmsg() {
	let usr_input = document.getElementById("txtCapcha").value;
	let txtUsername = document.getElementById('txtUsername').value;
	let txtPass = document.getElementById("txtPass").value;
	let result;
	const btnSignIn = document.querySelector('#btnSignIn');
	const a_form = document.querySelector('#a-form');
	const notify = document.querySelector("#notify");
	const message = document.querySelector("#message");
	
	if (txtUsername === "" && txtPass === "" && usr_input === "") {
		result = "";
		return;
	}
	
	// Check whether the input is equal
	// to generated captcha or not
	
	if (usr_input === capcha.innerHTML) {
		result = "Mã chính xác";
		document.getElementById("key").innerHTML = result;
	}
	else {
		result = "Mã capcha không chính xác";
		document.getElementById("key").innerHTML = result;
		generate();
	}
}

</script>

	<script type="text/javascript">
		let switchCtn = document.querySelector("#switch-cnt");
		let switchC1 = document.querySelector("#switch-c1");
		let switchC2 = document.querySelector("#switch-c2");
		let switchCircle = document.querySelectorAll(".switch__circle");
		let switchBtn = document.querySelectorAll(".switch-btn");
		let aContainer = document.querySelector("#a-container");
		let bContainer = document.querySelector("#b-container");
		let allButtons = document.querySelectorAll(".submit");
		let styleForm = document.querySelector('#styleForm');
		
		let getButtons = (e) => e.preventDefault()
		
		let changeForm = (e) => {
		
		switchCtn.classList.add("is-gx");
		setTimeout(function(){
		    switchCtn.classList.remove("is-gx");
		}, 1500)
		
		switchCtn.classList.toggle("is-txr");
		switchCircle[0].classList.toggle("is-txr");
		switchCircle[1].classList.toggle("is-txr");
		
		switchC1.classList.toggle("is-hidden");
		switchC2.classList.toggle("is-hidden");
		
			if (styleForm.textContent == "1") {
				aContainer.classList.toggle("is-txr");
				bContainer.classList.toggle("is-txr");			
			} else {
				aContainer.classList.toggle("is-txl");
				bContainer.classList.toggle("is-txl");
				bContainer.classList.toggle("is-z200");			
			}
			
		}
		
		let mainF = (e) => {
		for (var i = 0; i < allButtons.length; i++)
		    allButtons[i].addEventListener("click", getButtons );
		for (var i = 0; i < switchBtn.length; i++)
		    switchBtn[i].addEventListener("click", changeForm)
		}
		
		window.addEventListener("load", mainF);

	</script>

</body>

</html>