<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Trang cá nhân của ${tvProfile.getTenThanhVien()}</title>
<c:import url="_header.jsp" />

<div class="row">
	<div class="col">
		<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item fw-bold text-success "><i
					class="fa-solid fa-house-chimney me-2"></i><a id="homePage"
					href="${myContext }/home" class="fw-bold text-success name">Trang chủ</a></li>
				<li class="breadcrumb-item active" aria-current="page">Thông
					tin cá nhân của <span class="fw-bold text-success">${tvProfile.getTenThanhVien() }</span>
				</li>
			</ol>
		</nav>
	</div>
</div>
<div class="area__profile container">
	<section class="mt-2">
		<div class="container py-5">
			<div class="row d-flex justify-content-center align-items-center">
				<div class="col col-lg-6 mb-4 mb-lg-0">
					<div class="card mb-3" style="border-radius: 0.5rem; border: none">
						<div class="row g-0">
							<div class="col-md-4 gradient-custom text-center text-white"
								style="border-top-left-radius: 0.5rem; border-bottom-left-radius: 0.5rem;">
								<img src="${tvProfile.getAnhDaiDien()}" alt="Avatar"
									class="img-fluid my-5" style="width: 80px; border-radius: 50%" />
								<h5 class="fw-bold text-dark text-uppercase">${tvProfile.getTenThanhVien()}
								</h5>
								<p class="text-muted">
									<i class="fa-solid fa-briefcase me-1"></i>${tvProfile.getCongViec()}
								</p>
								<c:if
									test="${tvProfile.getMaThanhVien() == member.getMaThanhVien() }">
									<i class="far text-muted fa-edit mb-5 fa-2x"
										data-bs-toggle="modal" data-bs-target="#profileModal"
										style="cursor: pointer"></i>
								</c:if>
							</div>
							<div class="col-md-8 gradient-custom--right"
								style="border-top-right-radius: 0.5rem; border-bottom-right-radius: 0.5rem;">
								<div class="card-body p-4">
									<h2 class="text-center fw-bold">Thông tin cá nhân</h2>
									<hr class="mt-0 mb-4" />
									<div class="row pt-1">
										<div class="col-6 mb-3">
											<h6 class="text-center">
												<i class="fa-solid fa-address-card me-1"></i>Họ và tên
											</h6>
											<p class="text-muted text-center text-break">${tvProfile.getTenThanhVien()}</p>
										</div>
										<div class="col-6 mb-3">
											<h6 class="text-center">
												<i class="fa-solid fa-user me-1"></i> Tên đăng nhập
											</h6>
											<p class="text-muted text-center text-break">${tvProfile.getTenDangNhap()}
											</p>
										</div>
									</div>
									<div class="row pt-1">
										<div class="col-6 mb-3">
											<h6 class="text-center">
												<i class="fa-solid fa-envelope me-1"></i>Email
											</h6>
											<p class="text-muted text-center text-break">
												${tvProfile.getEmail()}</p>
										</div>
										<div class="col-6 mb-3">
											<h6 class="text-center">
												<i class="fa-solid fa-phone me-1"></i>Số điện thoại
											</h6>
											<p class="text-muted text-center text-break">${tvProfile.getSoDienThoai()}
											</p>
										</div>
									</div>
									<div class="row pt-1">
										<div class="col-6 mb-3">
											<h6 class="text-center">
												<i class="fa-solid fa-location-dot me-1"></i>Địa chỉ
											</h6>
											<p class="text-muted text-center text-break">${tvProfile.getDiaChi()}</p>
										</div>
										<div class="col-6 mb-3">
											<h6 class="text-center">
												<i class="fa-solid fa-newspaper me-1"></i> Số bài viết
											</h6>
											<p class="text-muted text-center text-break">${tvProfile.getSoBaiViet()}
												bài</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1"
		aria-labelledby="profileModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-content--custom"
				style="margin-top: 150px">
				<div class="modal-header">
					<h1 class="modal-title fw-bold fs-3" id="profileModalLabel">
						Cập nhật thông tin cá nhân</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="${myContext }/profile/${member.getMaThanhVien() }"
					method="post">
					<div class="modal-body">
						<div class="row">
							<div class="col-md-6">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"><i
										class="fa-solid fa-address-card"></i></span> <input type="text"
										class="form-control" name="txtFullname"
										value="${member.getTenThanhVien()}" aria-label="Fullname"
										aria-describedby="basic-addon1" readonly
										style="background-color: #ddd" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"><i
										class="fa-solid fa-user"></i></span> <input type="text"
										class="form-control" name="txtUsername"
										value="${member.getTenDangNhap()}" aria-label="Username"
										aria-describedby="basic-addon1" readonly
										style="background-color: #ddd" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"><i
										class="fa-solid fa-envelope"></i></span> <input type="email"
										class="form-control" name="txtEmail"
										value="${member.getEmail()}"
										placeholder="Nhập địa chỉ email..." aria-label="Email"
										aria-describedby="basic-addon1" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"><i
										class="fa-solid fa-phone"></i></span> <input type="number"
										class="form-control" name="txtPhone"
										value="${member.getSoDienThoai()}"
										placeholder="Nhập số điện thoại..." aria-label="Phone"
										aria-describedby="basic-addon1" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-9">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"><i
										class="fa-solid fa-location-dot"></i></span> <select
										class="form-select" id="inputGroupSelectStatus"
										name="txtAddress">
										<c:forEach var="province" items="${listProvinces }">
											<c:choose>
												<c:when test="${tvProfile.getDiaChi() == province}">
													<option selected value="${province }">${province }</option>
												</c:when>
												<c:otherwise>
													<option value="${province }">${province}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"><i
										class="fa-solid fa-newspaper"></i></span> <input type="text"
										class="form-control" name="txtCountPost"
										value="${member.getSoBaiViet()}" aria-label="CountPost"
										aria-describedby="basic-addon1" readonly
										style="background-color: #ddd" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="input-group mb-3">
									<label class="input-group-text" for="inputGroupSelect01"><i
										class="fa-solid fa-briefcase me-1"></i></label> <select
										class="form-select" id="inputGroupSelectStatus" name="txtJob">
										<c:forEach var="job" items="${listJobs }">
											<c:choose>
												<c:when test="${tvProfile.getCongViec() == job}">
													<option selected value="${job }">${job }</option>
												</c:when>
												<c:otherwise>
													<option value="${job }">${job}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="input-group mb-3">
									<span class="input-group-text" id="basic-addon1"><i
										class="fa-solid fa-link"></i></span> <input type="text"
										class="form-control" name="txtAvatarUrl"
										value="${member.getAnhDaiDien()}"
										placeholder="Nhập liên kết ảnh..." aria-label="AvatarUrl"
										aria-describedby="basic-addon1" />
								</div>
							</div>
						</div>
					</div>
					<div
						class="modal-footer d-flex justify-content-around align-items-center">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">Huỷ bỏ</button>
						<button type="submit" name="btnUpdateProfile"
							class="btn btn-success">Cập nhật</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>