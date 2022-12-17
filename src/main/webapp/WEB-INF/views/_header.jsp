<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="myContext" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="myAppName" value="KiemTraKetThucHocPhan" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon"
	href="${myContext}/assets/images/favicon-32x32.png" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
	integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- link ckeditor -->
<script src="https://cdn.ckeditor.com/4.20.1/full-all/ckeditor.js"></script>
<!-- link css custom -->
<link rel="stylesheet" href="${myContext}/assets/css/site.css" />
<c:set var="titlePage" value="Trang chia sẻ blog" scope="application" />
<title>${titlePage }</title>
</head>
<body>
	<!-- Header Blog -->
	<div id="myContext" class="d-none">${myContext}/</div>
	<nav
		class="navbar position-sticky top-0 navbar-expand-lg area__header position-relative">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse"
				data-bs-target="#navbarToggleExternalContent"
				aria-controls="navbarToggleExternalContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div id="navbarToggleExternalContent" class="collapse navbar-collapse">
			<div class="area__header-logo">
				<a class="logo__content" href="${myContext}/home"> <img
					src="${myContext}/assets/images/logo-blog.png" width="120px"
					height="80px" alt="ảnh logo" />
				</a>
			</div>
			<form action="home" method="get" class="area__search">
				<div class="area__search-icon">
					<i class="fa-solid fa-magnifying-glass"></i>
				</div>
				<input id="txtSearch" name="search" value="${param['search'] }"
					placeholder="Tìm kiếm bài viết..." />
			</form>

			<c:choose>
				<c:when test="${member ne null }">
					<!-- Logged -->
					<div class="area__profile">
						<img class="area__profile-btn avatar"
							src="${member.getAnhDaiDien() }" width="40px" height="40px"
							alt="ảnh đại diện" />
						<div class="list__custom list__profile position-absolute">
							<ul>
								<li>
									<div class="area__profile-header">
										<img class="avatar" src="${member.getAnhDaiDien() }"
											width="40px" height="40px" alt="ảnh đại diện" />
										<div class="area__profile-header-name">${member.getTenThanhVien() }</div>
									</div>
								</li>
								<li class="list__custom-item"><a id="profilePage"
									href="/${myAppName }/profile/${member.getMaThanhVien()}">Trang
										cá nhân</a></li>
								<li class="list__custom-item list__custom-item--spread"><a
									id="writeBlogPage" href="/${myAppName }/write-blog">Viết
										blog cá nhân</a></li>
								<li class="list__custom-item list__custom-item--spread"><a
									id="manageMyBlogPage" href="/${myAppName }/manage-myblog">Quản
										lý bài viết cá nhân</a></li>
								<li class="list__custom-item list__custom-item--spread"><a
									href="/${myAppName }/home?type=logout">Đăng xuất</a></li>
							</ul>
						</div>
					</div>

				</c:when>
				<c:otherwise>

					<!-- Don't login -->
					<div
						class="area__account d-flex align-items-center justify-content-end">
						<a href="${myContext}/account?type=register"
							class="btn area__account--btn area__account--sign-up mx-2">
							Đăng ký </a> <a href="${myContext}/account?type=login"
							class="btn area__account--btn area__account--sign-in mx-2">
							Đăng nhập </a>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</nav>


	<!-- Jquery for breadcrumb-->
	<script type="text/javascript">
		$(document).ready(
				function() {
					var homePage = $('#homePage');
					homePage.click(function(e) {
						e.preventDefault();
						let url = $(this).attr('href');
						$.ajax({
							url : url,
							type : "get",
							success : function(data) {
								window.history.pushState("",
										"Trang chia sẻ blog", url);
								$(document).prop('title', 'Trang chia sẻ blog')
								$('body').html(data);
							}
						})
					})
				});
	</script>
	<!-- Jquery for post -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$(".area__profile-btn").click(function() {
								$(".list__profile").toggle();
							});
							var profilePage = $('#profilePage');
							var writeBlogPage = $('#writeBlogPage');
							var manageMyBlogPage = $('#manageMyBlogPage');
							profilePage
									.click(function(e) {
										e.preventDefault();
										let url = $(this).attr('href');
										$
												.ajax({
													url : url,
													type : "get",
													success : function(data) {
														window.history
																.pushState(
																		"",
																		"Trang thông tin cá nhân",
																		url);
														$(document)
																.prop(
																		'title',
																		'Trang thông tin cá nhân của '
																				+ $(
																						'.area__profile-header-name')
																						.text())
														$('body').html(data);
													}
												})
									})

							writeBlogPage.click(function(e) {
								e.preventDefault();
								let url = $(this).attr('href');
								$.ajax({
									url : url,
									type : "get",
									success : function(data) {
										window.history.pushState(
												"Trang viết blog",
												"Trang viết blog", url);
										$(document).prop('title',
												'Trang viết blog cá nhân')
										$('body').html(data);
									}
								})
							})

							manageMyBlogPage.click(function(e) {
								e.preventDefault();
								let url = $(this).attr('href');
								$.ajax({
									url : url,
									type : "get",
									success : function(data) {
										window.history.pushState("",
												"Trang quản lý blog", url);
										$(document).prop('title',
												'Trang quản lý blog cá nhân')
										$('body').html(data);
									}
								})
							})
						});
	</script>