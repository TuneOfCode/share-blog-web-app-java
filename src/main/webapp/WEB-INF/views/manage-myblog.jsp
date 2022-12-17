<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Trang quản lý cá nhân của ${member.getTenThanhVien()}</title>
<c:import url="_header.jsp" />
<!-- Manage My Blog Page -->
<div class="row">
	<div class="col">
		<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item fw-bold text-success "><i
					class="fa-solid fa-house-chimney me-2"></i><a id="homePage"
					href="${myContext }/home" class="fw-bold text-success name">Trang
						chủ</a></li>
				<li class="breadcrumb-item active" aria-current="page">Quản lý
					bài viết của thành viên <span class="fw-bold text-success">${member.getTenThanhVien() }</span>
				</li>
			</ol>
		</nav>
	</div>
</div>
<c:choose>
	<c:when test="${param['tab'] == 'bookmark' }">
		<c:set var="isShowTrash" value="" />
		<c:set var="isShowBookmark" value="show active" />
		<c:set var="isShowPost" value="" />
	</c:when>
	<c:when test="${param['tab'] == 'post' }">
		<c:set var="isShowTrash" value="" />
		<c:set var="isShowBookmark" value="" />
		<c:set var="isShowPost" value="show active" />
	</c:when>
	<c:otherwise>
		<c:set var="isShowTrash" value="show active" />
		<c:set var="isShowBookmark" value="" />
		<c:set var="isShowPost" value="" />
	</c:otherwise>
</c:choose>
<div class="my__blog--write container">
	<h2 class="mt-5 fw-bold">Quản lý bài viết cá nhân</h2>
	<ul class="mt-5 nav nav-tabs d-flex justify-content-center" id="myTab"
		role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link text-dark ${isShowTrash}" id="trash-tab"
				data-bs-toggle="tab" data-bs-target="#trash-tab-pane" type="button"
				role="tab" aria-controls="trash-tab-pane" aria-selected="true">
				<i class="fa-solid fa-trash-can me-1"></i>Thùng rác
				(${fn:length(listPostsOfTrash)})
			</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link text-dark ${isShowBookmark}"
				id="bookmark-tab" data-bs-toggle="tab"
				data-bs-target="#bookmark-tab-pane" type="button" role="tab"
				aria-controls="bookmark-tab-pane" aria-selected="false">
				<i class="fa-regular fa-bookmark me-1"></i>Bài viết đã được đánh dấu
				(${fn:length(listBookmarks) })
			</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link text-dark ${isShowPost}" id="post-tab"
				data-bs-toggle="tab" data-bs-target="#post-tab-pane" type="button"
				role="tab" aria-controls="post-tab-pane" aria-selected="false">
				<i class="fa-solid fa-chart-simple me-1"></i>Bài viết đã xuất bản
				(${fn:length(listPostsOfAuthor)})
			</button>
		</li>
	</ul>
	<div class="tab-content mt-5" id="myTabContent">
		<div class="tab-pane fade ${isShowTrash}" id="trash-tab-pane"
			role="tabpanel" aria-labelledby="trash-tab" tabindex="0">

			<div class="area__post-list">
				<c:if test="${fn:length(listPostsOfTrash) > 0}">
					<c:forEach var="trash" items="${listPostsOfTrash}"
						varStatus="status">
						<!-- Post Item 1 -->
						<div class="post__item">
							<div class="post__item-header">
								<div
									class="post__item-header-top d-flex align-items-center justify-content-between">
									<div class="header__author d-flex align-items-center">
										<div
											class="post__item-header-title name fw-bold mt-2 text-break">
											${trash.getTieuDe() }</div>
									</div>
									<div class="header__action d-flex align-items-center">
										<span class="badge bg-danger text-light">Đã bị ẩn đi</span>
										<div id="action__other--trash-${status.index }"
											class="action__other--trash hightlight-button ms-1 position-relative">
											<i class="fa-solid fa-ellipsis"></i>
											<div id="list__action--trash-${status.index }"
												class="list__action--trash list__custom position-absolute"
												style="display: none; top: 40px;">
												<ul style="width: 200px;">
													<li class="list__custom-item"><a
														href="restore?postId=${trash.getMaBaiViet() }"><i
															class="me-1 fa-solid fa-arrow-rotate-left"></i>Khôi phục
															bài viết</a></li>
													<li class="list__custom-item list__custom-item--spread">
														<a href="delete-blog?postId=${trash.getMaBaiViet() }"><i
															class="me-1 fa-regular fa-circle-xmark"></i>Xoá vĩnh viễn
															bài viết</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div
								class="mt-3 post__item-content d-flex justify-content-between align-items-start">

								<div class="post__item-footer d-flex align-items-center">
									<div class="post__item-footer-tag-list d-flex flex-wrap">
										<a href="home?filter=${trash.getTheLoai() }"
											class="badge post__item-footer-tag m-1 p-2 name text-light">${trash.getTenTheLoai() }</a>
									</div>
									<span class="post__item-dot">·</span>
									<div
										class="post__item-footer-time d-flex align-items-center flex-wrap">
										<i class="fa-solid fa-calendar-days"></i> <span
											class="time__content ms-1"> <fmt:formatDate
												pattern='dd-MM-yyyy HH:mm:ss'
												value='${trash.getNgayXuatBan() }' />
										</span>
									</div>
									<span class="post__item-dot">·</span> <span
										class="post__item-footer-total-emotion d-flex align-items-center flex-wrap"><span
										class="total-emotion__content me-1">${trash.getSoLuotCamXuc() }</span><i
										class="fa-solid fa-heart text-danger"></i></span>
								</div>
							</div>

						</div>
						<!-- End Post Item -->

					</c:forEach>
				</c:if>
			</div>

			<c:if test="${fn:length(listPostsOfTrash) <= 0}">
				<p class="text-center text-muted">
					Chưa có bản nháp nào. Bạn có thể<a href="write-blog"
						class="mx-1 fw-bold name text-success">viết bài mới</a>hoặc<a
						href="home" class="mx-1 fw-bold name text-success">đọc bài
						viết</a>khác.
				</p>
			</c:if>
		</div>

		<!-- Jquery for trash -->
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								var actionOthers = $(".action__other--trash");
								actionOthers
										.click(function() {
											let actionOthersSize = 'action__other--trash-';
											let idActionOther = $(this).attr(
													'id').slice(
													actionOthersSize.length)
											$(
													'#list__action--trash-'
															+ idActionOther)
													.toggle();
										})
							});
		</script>

		<!-- 		tab content bookmark -->
		<div class="tab-pane fade ${isShowBookmark}" id="bookmark-tab-pane"
			role="tabpanel" aria-labelledby="profile-tab" tabindex="0">

			<c:choose>
				<c:when test="${fn:length(listBookmarks) >0}">
					<div class="area__post-list">
						<c:forEach var="bookmark" items="${listBookmarks}"
							varStatus="status">
							<!-- Post Item 1 -->
							<div class="post__item">
								<div class="post__item-header">
									<div
										class="post__item-header-top d-flex align-items-center justify-content-between">
										<div class="header__author d-flex align-items-center">
											<div class="post__item-header-title">
												<a href="detail/${bookmark.getMaBaiViet() }"
													class="name fw-bold mt-2 text-break">${bookmark.getTieuDe() }</a>
											</div>
										</div>
										<div class="header__action d-flex align-items-center">
											<div id="action__other--bookmark-${status.index }"
												class="action__other--bookmark hightlight-button ms-1 position-relative">
												<i class="fa-solid fa-ellipsis"></i>
												<div id="list__action--bookmark-${status.index }"
													class="list__action--bookmark list__custom position-absolute"
													style="display: none; top: 40px;">
													<ul>
														<li class="list__custom-item list__custom-item--spread">
															<a
															href="remove-bookmark?postId=${bookmark.getMaBaiViet() }"><i
																class="me-1 fa-solid fa-circle-minus"></i>Xoá khỏi mục
																đã lưu</a>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div
									class="mt-3 post__item-content d-flex justify-content-between align-items-start">

									<div class="post__item-footer d-flex align-items-center">
										<div
											class="post__item-footer-time d-flex align-items-center flex-wrap text-success">
											<i class="me-1 fa-regular fa-clock"></i> <span
												title="<fmt:formatDate  pattern='dd-MM-yyyy HH:mm:ss' value='${bookmark.getThoiGianLuu()}'/>"
												class="time__content ms-1">Đã lưu
												${bookmark.getThoiGianKeTu()}</span>
										</div>
										<span class="post__item-dot">·</span> Tác giả: <a
											href="profile/${bookmark.getMaTacGia() }"
											class="ms-1 name text-success fw-bold">${bookmark.getTenTacGia() }</a>
									</div>
								</div>

							</div>
							<!-- End Post Item -->
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<p class="text-center text-muted">
						Chưa có bài viết đã được đánh dấu nào. Bạn có thể<a
							href="write-blog" class="mx-1 fw-bold name text-success">viết
							bài mới</a>hoặc<a href="home" class="mx-1 fw-bold name text-success">đọc
							bài viết</a>khác.
					</p>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- Jquery for bookmark -->
		<script type="text/javascript">
			$(document).ready(
					function() {
						var actionOthers = $(".action__other--bookmark");
						actionOthers.click(function() {
							let actionOthersSize = 'action__other--bookmark-';
							let idActionOther = $(this).attr('id').slice(
									actionOthersSize.length)
							$('#list__action--bookmark-' + idActionOther)
									.toggle();
						})
					});
		</script>


		<!-- 		tab content post -->
		<div class="tab-pane fade ${isShowPost}" id="post-tab-pane"
			role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
			<c:choose>
				<c:when test="${fn:length(listPostsOfAuthor) > 0}">
					<div class="area__post-list">
						<c:forEach var="post" items="${listPostsOfAuthor }"
							varStatus="status">
							<!-- Post Item 1 -->
							<div class="post__item">
								<div class="post__item-header">
									<div
										class="post__item-header-top d-flex align-items-center justify-content-between">
										<div class="header__author d-flex align-items-center">
											<div class="post__item-header-title">
												<a href="detail/${post.getMaBaiViet() }"
													class="fs-3 name fw-bold mt-2 text-break">${post.getTieuDe() }
												</a>
											</div>
										</div>
										<div class="header__action d-flex align-items-center">
											<div id="action__other--post-${status.index }"
												class="action__other--post hightlight-button ms-1 position-relative">
												<i class="fa-solid fa-ellipsis"></i>
												<div id="list__action--post-${status.index }"
													class="list__action--post list__custom position-absolute"
													style="display: none; top: 40px;">
													<ul style="width: 200px;">

														<li class="list__custom-item list__custom-item--spread">
															<a href="edit-blog?postId=${post.getMaBaiViet() }"><i
																class="fa-solid fa-pen-to-square me-1"></i>Sửa bài viết</a>
														</li>
														<li class="list__custom-item list__custom-item--spread">
															<a href="move-trash?postId=${post.getMaBaiViet() }"><i
																class="fa-solid fa-trash-can me-1"></i>Bỏ vào thùng rác</a>
														</li>

													</ul>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div
									class="post__item-content d-flex justify-content-between align-items-center">
									<div>
										<div class="post__item-header-description mt-2 mb-3">
											<div
												class="post__item-header-description--content text-muted text-break">${post.getNoiDung()}</div>
										</div>
										<div class="post__item-footer d-flex align-items-center">
											<div class="post__item-footer-tag-list d-flex flex-wrap">
												<a href="home?filter=${post.getTheLoai() }"
													class="badge post__item-footer-tag m-1 p-2 name text-light">${post.getTenTheLoai() }</a>
											</div>
											<span class="post__item-dot">·</span>
											<div
												class="post__item-footer-time d-flex align-items-center flex-wrap">
												<i class="fa-solid fa-calendar-days"></i> <span
													class="time__content ms-1"> <fmt:formatDate
														pattern="dd-MM-yyyy" value="${post.getNgayXuatBan() }" />
												</span>
											</div>
											<span class="post__item-dot">·</span>
											<div
												class="post__item-footer-time d-flex align-items-center flex-wrap">
												<i class="fa-regular fa-clock"></i> <span
													class="time__content ms-1">
													${timeSinces[status.index]} </span>
											</div>
											<span class="post__item-dot">·</span> <span
												class="post__item-footer-total-emotion d-flex align-items-center flex-wrap"><span
												class="total-emotion__content me-1">${post.getSoLuotCamXuc() }</span><i
												class="fa-solid fa-heart text-danger"></i></span>
										</div>
									</div>
									<c:if test="${post.getAnhNen() != ''}">
										<div class="post__thumbnail">
											<a href="detail/${post.getMaBaiViet() }"
												class="post__thumbnail--link"> <img
												style="object-fit: contain;" src="${post.getAnhNen() }"
												width="300px" height="250px" />
											</a>
										</div>
									</c:if>
								</div>
							</div>
							<!-- End Post Item -->
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
					<p class="text-center text-muted">
						Chưa có xuất bản nào. Bạn có thể<a href="write-blog"
							class="mx-1 fw-bold name text-success">viết bài mới</a>hoặc<a
							href="home" class="mx-1 fw-bold name text-success">đọc bài
							viết</a>khác.
					</p>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- Jquery for post -->
		<script type="text/javascript">
			$(document).ready(
					function() {
						var actionOthers = $(".action__other--post");
						actionOthers.click(function() {
							let actionOthersSize = 'action__other--post-';
							let idActionOther = $(this).attr('id').slice(
									actionOthersSize.length)
							$('#list__action--post-' + idActionOther).toggle();
						})
					});
		</script>
	</div>
</div>
</body>
</html>