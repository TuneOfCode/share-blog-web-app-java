<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="_header-admin.jsp" />
<c:choose>
	<c:when test="${param['tab_admin'] == 'member' }">
		<c:set var="isShowCategory" value="d-none" />
		<c:set var="isShowMember" value="" />
		<c:set var="isShowPost" value="d-none" />
		<c:set var="isShowComment" value="d-none" />
	</c:when>
	<c:when test="${param['tab_admin'] == 'post' }">
		<c:set var="isShowCategory" value="d-none" />
		<c:set var="isShowMember" value="d-none" />
		<c:set var="isShowPost" value="" />
		<c:set var="isShowComment" value="d-none" />
	</c:when>
	<c:when test="${param['tab_admin'] == 'comment' }">
		<c:set var="isShowCategory" value="d-none" />
		<c:set var="isShowMember" value="d-none" />
		<c:set var="isShowPost" value="d-none" />
		<c:set var="isShowComment" value="" />
	</c:when>
	<c:otherwise>
		<c:set var="isShowCategory" value="" />
		<c:set var="isShowMember" value="d-none" />
		<c:set var="isShowPost" value="d-none" />
		<c:set var="isShowComment" value="d-none" />
	</c:otherwise>
</c:choose>
<div class="col py-3">
	<!-- Tab Category -->
	<div class="container ${isShowCategory}">
		<h1 class="text-success text-center fw-bold mb-5">Quản lý thể
			loại</h1>
		<table id="area__category" class="table table-striped"
			style="width: 100%;">
			<thead>
				<tr>
					<th class="text-center">Mã thể loại</th>
					<th class="text-center">Tên thể loại</th>
					<th class="text-center"><span class="text-success text-center"
						data-bs-toggle="modal" data-bs-target="#addCategory"
						style="cursor: pointer;"><i class="fa-solid fa-plus me-1"></i>Thêm
							thể loại</span></th>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(listCategories) > 0}">
						<c:forEach var="category" items="${listCategories}"
							varStatus="status">
							<tr>
								<td class="text-center">${category.getMaTheLoai()}</td>
								<td class="text-center">${category.getTenTheLoai()}</td>
								<td class="text-center"><span class="text-warning mx-1"
									style="cursor: pointer;" data-bs-toggle="modal"
									data-bs-target="#editCategory-${status.index}"><i
										class="fa-solid fa-pen-to-square"></i></span> <span
									class="text-danger mx-1" style="cursor: pointer;"
									data-bs-toggle="modal"
									data-bs-target="#destroyCategory-${status.index}"><i
										class="fa-solid fa-trash"></i></span></td>

								<!-- Modal Edit Category -->
								<div class="modal fade" id="editCategory-${status.index}"
									data-bs-toggle="static" data-bs-keyboard="false" tabindex="-1"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="staticBackdropLabel">
													Cập nhật thể loại <i class="fw-bold">${category.getTenTheLoai()}</i>
												</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">Mã
														thể loại</span> <input disabled="disabled" type="text"
														class="form-control" placeholder="Nhập mã thể loại..."
														aria-label="categoryId" id="txtCategoryIdUpdate-${status.index}"
														name="txtCategoryId" style="background-color: #ddd"
														value="${category.getMaTheLoai()}"
														aria-describedby="basic-addon1">
												</div>
												<div class="input-group mb-3">
													<span class="input-group-text" id="basic-addon1">Tên
														thể loại</span> <input required="required" type="text"
														class="form-control" placeholder="Nhập tên thể loại..."
														aria-label="categoryName" id="txtCategoryNameUpdate-${status.index}"
														name="txtCategoryName" value="${category.getTenTheLoai()}"
														aria-describedby="basic-addon1">
												</div>
											</div>
											<div
												class="modal-footer d-flex justify-content-around align-items-center">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Huỷ</button>
												<button id="btnEditCategory-${status.index}"
													name="btnEditCategory" type="button"
													class="btn btn-warning btnEditCategory">Cập nhật</button>
											</div>
										</div>
									</div>
								</div>

								<!-- Modal Destroy Category -->
								<div class="modal fade" id="destroyCategory-${status.index}"
									data-bs-toggle="static" data-bs-keyboard="false" tabindex="-1"
									aria-labelledby="staticBackdropLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="staticBackdropLabel">
													Xoá thể loại <i class="fw-bold">${category.getTenTheLoai()}</i>
												</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<p class="text-muted text-center">
													Bạn có thực sự muốn xoá thể loại <i class="fw-bold">${category.getTenTheLoai()}</i>
													không?
												</p>
											</div>
											<div
												class="modal-footer d-flex justify-content-around align-items-center">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Huỷ</button>
												<button id="btnDestroyCategory-${status.index}"
													name="btnDestroyCategory" type="button"
													data-categoryId="${category.getMaTheLoai()}"
													class="btn btn-danger btnDestroyCategory">Xoá</button>
											</div>
										</div>
									</div>
								</div>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" class="text-muted text-center">Chưa có thể
								loại nào.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<!-- Modal Add Category -->
		<div class="modal fade" id="addCategory" data-bs-toggle="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">Thêm
							thể loại</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">Mã thể
								loại</span> <input required="required" type="text" class="form-control"
								placeholder="Nhập mã thể loại..." aria-label="categoryId"
								id="txtCategoryIdAdd" name="txtCategoryId"
								aria-describedby="basic-addon1">
						</div>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">Tên thể
								loại</span> <input required="required" type="text" class="form-control"
								placeholder="Nhập tên thể loại..." aria-label="categoryName"
								id="txtCategoryNameAdd" name="txtCategoryName"
								aria-describedby="basic-addon1">
						</div>
					</div>
					<div
						class="modal-footer d-flex justify-content-around align-items-center">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Huỷ</button>
						<button id="btnAddCategory" name="btnAddCategory" type="button"
							class="btn btn-success">Lưu</button>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript">
			window.alert = function() {
			};
			$(document).ready(function() {
				$('#area__category').DataTable();
				// thêm thể loại mới
				$('#btnAddCategory').click(function(e) {
					e.preventDefault();
					const data = {
						txtCategoryId : $('#txtCategoryIdAdd').val(),
						txtCategoryName : $('#txtCategoryNameAdd').val(),
						btnAddCategory : $(this).attr('name')
					}
					
					console.log(data)
					$.ajax({
						url : "admin?tab_admin=category",
						type : "post",
						data : data,
						success : function(data) {
							$('body').html(data);
						},
						error : function(err) {
							console.log('[ERROR] create category: ', err)
						}
					})
				})
				// sửa thể loại
				$('.btnEditCategory').click(function(e) {
					e.preventDefault();
					let btnEditCategorySize = 'btnEditCategory-';
					let idBtnEditCategory = $(this).attr('id').slice(btnEditCategorySize.length);
					const data = {
						txtCategoryId : $('#txtCategoryIdUpdate-' + idBtnEditCategory).val(),
						txtCategoryName : $('#txtCategoryNameUpdate-' + idBtnEditCategory).val(),
						btnEditCategory : $(this).attr('name')
					}
					console.log(data)
					$.ajax({
						url : "admin?tab_admin=category",
						type : "post",
						data : data,
						success : function(data) {
							$('body').html(data);
						},
						error : function(err) {
							console.log('[ERROR] edit category: ', err)
						}
					})
				})
				// xoá thể loại
				$('.btnDestroyCategory').click(function(e) {
					e.preventDefault();
					const data = {
						btnDestroyCategory : $(this).attr('data-categoryId')
					}
					$.ajax({
						url : "admin?tab_admin=category",
						type : "post",
						data : data,
						success : function(data) {
							$('body').html(data);
						},
						error : function(err) {
							console.log('[ERROR] edit category: ', err)
						}
					})
				})
			});
		</script>

	</div>
	<!-- End Tab Category -->

	<!-- 	Tab member -->
	<div id="tab-member" class="container ${isShowMember}">
		<div id="member-content">
			<h1 class="text-success text-center fw-bold mb-5">Quản lý thành
				viên</h1>
			<table id="area__member" class="table table-striped"
				style="width: 100%;">
				<thead>
					<tr>
						<th class="text-center">Ảnh đại diện</th>
						<th class="text-center">Mã thành viên</th>
						<th class="text-center">Tên thành viên</th>
						<th class="text-center">Tên đăng nhập</th>
						<th class="text-center">Email</th>
						<th class="text-center">Số bài viết</th>
						<th class="text-center">Trạng thái tài khoản</th>
						<th class="text-center">Hành động xoá vĩnh viễn</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(listMembers) > 0}">
							<c:forEach var="memberItem" items="${listMembers}"
								varStatus="status">
								<c:choose>
									<c:when test="${memberItem.getTrangThai() == 0}">
										<c:set var="underline" value="text-decoration-line-through" />
									</c:when>
									<c:otherwise>
										<c:set var="underline" value="" />
									</c:otherwise>
								</c:choose>
								<tr id="item-${status.index}" class="itemMember ${underline}">
									<td class="text-center"><img
										src="${memberItem.getAnhDaiDien()}" width="50px" height="50px"
										style="border-radius: 50%;" /></td>
									<td class="text-center">${memberItem.getMaThanhVien()}</td>
									<td class="text-center">${memberItem.getTenThanhVien()}</td>
									<td class="text-center">${memberItem.getTenDangNhap()}</td>
									<td class="text-center">${memberItem.getEmail()}</td>
									<td class="text-center">${memberItem.getSoBaiViet()}</td>
									<td class="text-center"><c:choose>
											<c:when test="${memberItem.getTrangThai() == 0}">
												<i id="ban-${status.index}"
													class="ban ban-member fa-solid fa-ban text-danger fw-bold"
													style="cursor: pointer;"
													data-memberIdUpdate="${memberItem.getMaThanhVien()}"></i>
											</c:when>
											<c:otherwise>
												<i id="ban-${status.index}"
													class="ban ban-member fa-solid fa-check text-success fw-bold"
													style="cursor: pointer;"
													data-memberIdUpdate="${memberItem.getMaThanhVien()}"></i>
											</c:otherwise>
										</c:choose></td>
									<td class="text-center"><span class="text-danger mx-1"
										style="cursor: pointer;" data-bs-toggle="modal"
										data-bs-target="#destroyMember-${status.index}"><i
											class="fa-solid fa-trash"></i></span> <!-- Modal Destroy Member -->
										<div class="modal fade" id="destroyMember-${status.index}"
											data-bs-toggle="static" data-bs-keyboard="false"
											tabindex="-1" aria-labelledby="staticBackdropLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="staticBackdropLabel">
															Xoá thành viên <i class="fw-bold">${memberItem.getTenThanhVien()}</i>
														</h1>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<p class="text-muted text-center">
															Bạn có thực sự muốn xoá thành viên <i class="fw-bold">${memberItem.getTenThanhVien()}</i>
															không?
														</p>
													</div>
													<div
														class="modal-footer d-flex justify-content-around align-items-center">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Huỷ</button>
														<button id="btnDestroyMember-${status.index}"
															name="btnDestroyMember" type="button"
															data-memberIdDestroy="${memberItem.getMaThanhVien()}"
															class="btn btn-danger btnDestroyMember">Xoá</button>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2" class="text-muted text-center">Chưa có
									thành viên nào.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
// 				$('#area__member').DataTable();
				// cập nhật trạng thái thành viên
				$('.ban').click(function(e) {
					e.preventDefault();
					const data = {
						memberIdUpdate : $(this).attr('data-memberIdUpdate')
					}
					console.log(data);
					$.ajax({
						url : "admin?tab_admin=member",
						type : "post",
						data : data,
						success : function(data) {
							$('body').html(data);
						},
						error : function(err) {
							console.log('[ERROR] update status member: ', err)
						}
					})
				})
				// xoá thành viên
				$('.btnDestroyMember').click(function(e) {
					e.preventDefault();
					const data = {
						memberIdDestroy : $(this).attr('data-memberIdDestroy')
					}
					console.log(data);
					$.ajax({
						url : "admin?tab_admin=member",
						type : "post",
						data : data,
						success : function(data) {
							$('body').html(data);
						},
						error : function(err) {
							console.log('[ERROR] update destroy member: ', err)
						}
					})
				})
			});
		</script>
	</div>

	<!-- 	Tab post -->
	<div class="container ${isShowPost}">
		<h1 class="text-success text-center fw-bold mb-5">Quản lý bài
			viết</h1>
		<table id="area__post" class="table table-striped mb-5"
			style="width: 100%;">
			<thead>
				<tr>
					<th class="text-center">Mã bài viết</th>
					<th class="text-center">Ngày xuất bản</th>
					<th class="text-center">Tính tới thời điểm hiện tại</th>
					<th class="text-center">Tác giả</th>
					<th class="text-center">Số lượt cảm xúc</th>
					<th class="text-center">Số lượt bình luận</th>
					<th class="text-center">Số lượt báo cáo</th>
					<th class="text-center">Đường dẫn tới bài viết</th>
					<th class="text-center">Trạng thái</th>
					<th class="text-center">Hành động xoá vĩnh viễn</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(listPosts) > 0}">
						<c:forEach var="post" items="${listPosts}" varStatus="status">
							<c:choose>
									<c:when test="${post.getTrangThaiBaiViet() == 0}">
										<c:set var="underline" value="text-decoration-line-through" />
									</c:when>
									<c:otherwise>
										<c:set var="underline" value="" />
									</c:otherwise>
								</c:choose>
							<tr id="item-${status.index}" class="${underline}">
								<td class="text-center">${post.getMaBaiViet()}</td>
								<td class="text-center"><span><fmt:formatDate
											pattern='dd-MM-yyyy' value='${post.getNgayXuatBan()}' /></span></td>
								<td class="text-center"><span>${post.getThoiGianKeTu()}</span>
								</td>
								<td class="text-center">${post.getTenTacGia()}</td>
								<td class="text-center">${post.getSoLuotCamXuc()}</td>
								<td class="text-center">${post.getSoLuotBinhLuan()}</td>
								<td class="text-center">${post.getLuotBaoCao()}</td>
								<td class="text-center"><a
									href="detail/${post.getMaBaiViet()}" target="_blank">liên
										kết</a></td>
								<td class="text-center"><c:choose>
										<c:when test="${post.getTrangThaiBaiViet() == 0}">
											<i id="ban-post-${status.index}"
												class="ban-post fa-solid fa-ban text-danger fw-bold"
												style="cursor: pointer;" data-postId="${post.getMaBaiViet()}"></i>
										</c:when>
										<c:otherwise>
											<i id="ban-post-${status.index}"
												class="ban-post fa-solid fa-check text-success fw-bold"
												style="cursor: pointer;" data-postId="${post.getMaBaiViet()}"></i>
										</c:otherwise>
									</c:choose></td>
								<td class="text-center"><span class="text-danger mx-1"
									style="cursor: pointer;" data-bs-toggle="modal"
									data-bs-target="#destroyPost-${status.index}"><i
										class="fa-solid fa-trash"></i></span> <!-- Modal Destroy Member -->
									<div class="modal fade" id="destroyPost-${status.index}"
										data-bs-toggle="static" data-bs-keyboard="false" tabindex="-1"
										aria-labelledby="staticBackdropLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="staticBackdropLabel">
														Xoá bài viết <i class="fw-bold">${post.getMaBaiViet()}</i>
													</h1>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p class="text-muted text-center">
														Bạn có thực sự muốn xoá bài viết <i class="fw-bold">${post.getMaBaiViet()}</i>
														không?
													</p>
												</div>
												<div
													class="modal-footer d-flex justify-content-around align-items-center">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Huỷ</button>
													<button id="btnDestroyPost-${status.index}"
														name="btnDestroyPost" type="button"
														data-postId="${post.getMaBaiViet()}"
														data-authorId="${post.getTacGia()}"
														class="btn btn-danger btnDestroyPost">Xoá</button>
												</div>
											</div>
										</div>
									</div></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2" class="text-muted text-center">Chưa có bài
								viết nào.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<script type="text/javascript">
			$(document).ready(function() {
// 				$('#area__post').DataTable();
				// cập nhật trạng thái bài viết
				$('.ban-post').click(function(e) {
					e.preventDefault();
					let banSize = 'ban-post-';
					let idBan = $(this).attr('id').slice(banSize.length);
					let isBan = $(this).hasClass('fa-ban');
					let item = $('#item-' + idBan);
					if (isBan) {
						$(this).removeClass('fa-ban text-danger fw-bold');
						$(this).addClass('fa-check text-success fw-bold');
						item.removeClass('text-decoration-line-through');
					} else {
						$(this).removeClass('fa-check text-success fw-bold');
						$(this).addClass('fa-ban text-danger fw-bold');
						item.addClass('text-decoration-line-through');
					}
					console.log($(this));
					const data = {
						postIdUpdate: $('#'+banSize+idBan).attr('data-postId')
					}
					console.log(data)
					$.ajax({
						url: "admin?tab_admin=post",
						type: "post",
						data: data,
						success: function(data) {
							$('body').html(data)
						}, 
						error: function(err) {
							console.log('[ERROR] update status post: ', err)
						}
					})
				})
				
				// xoá bài viết
				$('.btnDestroyPost').click(function(e) {
					e.preventDefault();
					console.log($(this));
					let btnDestroyPostSize = 'btnDestroyPost-';
					let idBtnDestroyPost = $(this).attr('id').slice(btnDestroyPostSize.length);
					const data = {
						postIdDestroy: $('#'+btnDestroyPostSize+idBtnDestroyPost).attr('data-postId'),
						authorId: $('#'+btnDestroyPostSize+idBtnDestroyPost).attr('data-authorId')
					}
					console.log(data)
					$.ajax({
						url: "admin?tab_admin=post",
						type: "post",
						data: data,
						success: function(data) {
							$('body').html(data)
						}, 
						error: function(err) {
							console.log('[ERROR] destroy post: ', err)
						}
					})
				})
			});
		</script>
	</div>

	<!-- 	Tab comment -->
	<div class="container ${isShowComment}">
		<h1 class="text-success text-center fw-bold mb-5">Quản lý bình
			luận</h1>
		<table id="area__comment" class="table table-striped mb-3"
			style="width: 100%;">
			<thead>
				<tr>
					<th class="text-center">Mã bình luận</th>
					<th class="text-center">Ngày tạo</th>
					<th class="text-center">Tính từ thời điểm hiện tại</th>
					<th class="text-center">Người tạo</th>
					<th class="text-center">Số lượt cảm xúc</th>
					<th class="text-center">Số lượt báo cáo</th>
					<th class="text-center">Thuộc bài viết</th>
					<th class="text-center">Trạng thái</th>
					<th class="text-center">Hành động xoá vĩnh viễn bình luận</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(listComments) > 0}">
						<c:forEach var="comment" items="${listComments}"
							varStatus="status">
							<c:choose>
									<c:when test="${comment.getTrangThaiBinhLuan() == 0}">
										<c:set var="underline" value="text-decoration-line-through" />
									</c:when>
									<c:otherwise>
										<c:set var="underline" value="" />
									</c:otherwise>
								</c:choose>
							<tr id="item-${status.index}" class="${underline}">
								<td class="text-center">${comment.getMaBinhLuan()}</td>
								<td class="text-center" style="font-size: 14px;"><span><fmt:formatDate
											pattern='dd-MM-yyyy' value='${comment.getNgayTao()}' /></span></td>
								<td class="text-center">${comment.getThoiGianKeTu()}</td>
								<td class="text-center" style="font-size: 14px;">${comment.getTenNguoiTao()}</td>
								<td class="text-center">${comment.getSoLuotCamXuc()}</td>
								<td class="text-center">${comment.getLuotBaoCao()}</td>
								<td class="text-center"><a
									href="detail/${comment.getMaBaiViet()}" target="_blank">liên
										kết</a></td>
								<td class="text-center"><c:choose>
										<c:when test="${comment.getTrangThaiBinhLuan() == 0}">
											<i id="ban-comment-${status.index}"
												class="ban-comment fa-solid fa-ban text-danger fw-bold"
												style="cursor: pointer;"
												data-commentId="${comment.getMaBinhLuan()}"></i>
										</c:when>
										<c:otherwise>
											<i id="ban-comment-${status.index}"
												class="ban-comment fa-solid fa-check text-success fw-bold"
												style="cursor: pointer;"
												data-commentId="${comment.getMaBinhLuan()}"></i>
										</c:otherwise>
									</c:choose></td>
								<td class="text-center"><span class="text-danger mx-1"
									style="cursor: pointer;" data-bs-toggle="modal"
									data-bs-target="#destroyComment-${status.index}"><i
										class="fa-solid fa-trash"></i></span> <!-- Modal Destroy Member -->
									<div class="modal fade" id="destroyComment-${status.index}"
										data-bs-toggle="static" data-bs-keyboard="false" tabindex="-1"
										aria-labelledby="staticBackdropLabel" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
												<div class="modal-header">
													<h1 class="modal-title fs-5" id="staticBackdropLabel">
														Xoá bình luận <i class="fw-bold">${comment.getMaBinhLuan()}</i>
													</h1>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<p class="text-muted text-center">
														Bạn có thực sự muốn xoá bình luận <i class="fw-bold">${comment.getMaBinhLuan()}</i>
														không?
													</p>
												</div>
												<div
													class="modal-footer d-flex justify-content-around align-items-center">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Huỷ</button>
													<button id="btnDestroyComment-${status.index}"
														name="btnDestroyComment" type="button"
														data-commentId="${comment.getMaBinhLuan()}"
														data-postId="${comment.getMaBaiViet()}"
														class="btn btn-danger btnDestroyComment">Xoá</button>
												</div>
											</div>
										</div>
									</div></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2" class="text-muted text-center">Chưa có bình
								luận nào.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<script type="text/javascript">
			$(document).ready(function() {
// 				$('#area__comment').DataTable();
				// cập nhật trạng thái bình luận
				$('.ban-comment').click(function(e) {
					e.preventDefault();
					console.log($(this));
					const data = {
						commentIdUpdate: $(this).attr('data-commentId')
					}
					console.log(data)
					$.ajax({
						url: "admin?tab_admin=comment",
						type: "post",
						data: data,
						success: function(data) {
							$('body').html(data)
						}, 
						error: function(err) {
							console.log('[ERROR] update status comment: ', err)
						}
					})
				})
				
// 				$(document).click(function(e) {
// 					console.log(e)
// 				})
				
				// xoá bài viết
				$('.btnDestroyComment').click(function(e) {
					e.preventDefault();
					console.log($(this));
					const data = {
						commentIdDestroy: $(this).attr('data-commentId'),
						postId: $(this).attr('data-postId')
					}
					console.log(data)
					$.ajax({
						url: "admin?tab_admin=comment",
						type: "post",
						data: data,
						success: function(data) {
							$('body').html(data)
						}, 
						error: function(err) {
							console.log('[ERROR] destroy comment: ', err)
						}
					})
				})
			});
		</script>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('.ban').click(function(e) {
			let idBan = $(this).attr('id').slice(4);
			let isBan = $(this).hasClass('fa-ban');
			let item = $('#item-' + idBan);
			if (isBan) {
				$(this).removeClass('fa-ban text-danger fw-bold');
				$(this).addClass('fa-check text-success fw-bold');
				item.removeClass('text-decoration-line-through');
			} else {
				$(this).removeClass('fa-check text-success fw-bold');
				$(this).addClass('fa-ban text-danger fw-bold');
				item.addClass('text-decoration-line-through');
			}
		})
	});
</script>
<c:import url="_footer-admin.jsp" />