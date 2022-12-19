<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="myContext" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="myAppName" value="KiemTraKetThucHocPhan" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon"
	href="${myContext}/assets/images/favicon-32x32.png" type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<title>Trang chủ quản trị viên</title>
</head>

<c:choose>
	<c:when test="${param['tab_admin'] == 'member' }">
		<c:set var="isShowCategoryBtn" value="text-light" scope="page" />
		<c:set var="isShowMemberBtn" value="text-warning" scope="page" />
		<c:set var="isShowPostBtn" value="text-light" scope="page" />
		<c:set var="isShowCommentBtn" value="text-light" scope="page" />
	</c:when>
	<c:when test="${param['tab_admin'] == 'post' }">
		<c:set var="isShowCategoryBtn" value="text-light" scope="page" />
		<c:set var="isShowMemberBtn" value="text-light" scope="page" />
		<c:set var="isShowPostBtn" value="text-warning" scope="page" />
		<c:set var="isShowCommentBtn" value="text-light" scope="page" />
	</c:when>
	<c:when test="${param['tab_admin'] == 'comment' }">
		<c:set var="isShowCategoryBtn" value="text-light" scope="page" />
		<c:set var="isShowMemberBtn" value="text-light" scope="page" />
		<c:set var="isShowPostBtn" value="text-light" scope="page" />
		<c:set var="isShowCommentBtn" value="text-warning" scope="page" />
	</c:when>
	<c:otherwise>
		<c:set var="isShowCategoryBtn" value="text-warning" scope="page" />
		<c:set var="isShowMemberBtn" value="text-light" scope="page" />
		<c:set var="isShowPostBtn" value="text-light" scope="page" />
		<c:set var="isShowCommentBtn" value="text-light" scope="page" />
	</c:otherwise>
</c:choose>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
				<div
					class="d-flex flex-column text-center align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
					<a href="admin"
						class="d-flex align-items-center text-center justify-content-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
						<span class="fs-5 d-none text-center d-sm-inline"><i
							class="fa-solid fa-lock me-1"></i>Dashboard</span>
					</a>
					<ul
						class="pt-5 nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
						role="tablist" id="menu">
						<li class="nav-item"><a href="admin?tab_admin=category"
							class="nav-link align-middle px-0 py-3 ${isShowCategoryBtn} fw-bold">
								<i class="fa-solid fa-list me-1"></i> <span
								class="ms-1 d-none d-sm-inline">Quản lý thể loại</span>
						</a></li>
						<li><a href="admin?tab_admin=member"
							class="nav-link px-0 py-3 align-middle ${isShowMemberBtn} fw-bold"> <i
								class="fa-solid fa-users me-1"></i><span
								class="ms-1 d-none d-sm-inline">Quản lý thành viên</span>
						</a>
						<li><a href="admin?tab_admin=post"
							class="nav-link px-0 py-3 align-middle ${isShowPostBtn} fw-bold"><i
								class="fa-solid fa-paste me-1"></i> <span
								class="ms-1 d-none d-sm-inline">Quản lý bài viết</span></a></li>
						<li><a href="admin?tab_admin=comment"
							class="nav-link px-0 py-3 align-middle ${isShowCommentBtn} fw-bold"><i
								class="fa-solid fa-comments me-1"></i> <span
								class="ms-1 d-none d-sm-inline">Quản lý bình luận</span></a></li>
					</ul>
					<hr>
					<div class="dropdown pb-4">
						<a href="#"
							class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
							id="dropdownUser1" data-bs-toggle="dropdown"
							aria-expanded="false"> <img src="${member.getAnhDaiDien() }"
							alt="hugenerd" width="30" height="30" class="rounded-circle">
							<span class="d-none d-sm-inline mx-1"></span>
						</a>
						<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
							<li><a class="dropdown-item"
								href="profile/${member.getMaThanhVien() }">Hồ sơ</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="home?type=logout">Đăng
									xuất</a></li>
						</ul>
					</div>
				</div>
			</div>