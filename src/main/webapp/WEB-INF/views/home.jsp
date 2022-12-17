<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="_header.jsp" />
<!-- ================================================ -->
<!-- Home Page -->
<!-- Content Blog -->
<div class="area__post container mt-5">

	<p class="fs-2 fw-bold">
		Tổng hợp các bài viết hay được các thành viên chia sẻ
		(${fn:length(listPosts) } / ${totalRows})
		<c:if test="${param['filter'] != null || param['search'] != null}">
			<a id="removeFilterAndSearch"
				class="name fs-6 text-danger text-center" href="home"><i
				class="fa-solid fa-filter mx-1"></i>Bỏ tìm kiếm và lọc</a>
		</c:if>
	</p>

	<div class="row">
		<!-- Post List -->
		<div class="area__post-list pe-5 col-md-8 col-sm-12 position-relative">
			<div class="area__post-list">
				<c:choose>
					<c:when test="${fn:length(listPosts) > 0}">
						<c:forEach var="post" items="${listPosts }" varStatus="status">
							<!-- Post Item 1 -->
							<div class="post__item">
								<div class="post__item-header">
									<div
										class="post__item-header-top d-flex align-items-center justify-content-between">
										<div class="header__author d-flex align-items-center">
											<img class="avatar" src="${post.getAnhDaiDien() }"
												width="40px" height="40px" alt="ảnh đại diện" /> <a
												href="profile/${post.getTacGia() }"
												class="d-flex align-items-center name post__item-header-name fw-bold ms-2">${post.getTenTacGia() }
												<c:if test="${post.getTichQuanTriVien() == 1}">
													<div class="d-flex" title="Đây là quản trị viên">
														<svg aria-hidden="true" focusable="false"
															data-prefix="fas" data-icon="circle-check"
															style="width: 15px; margin-left: 5px; color: #1b74e4;"
															class="svg-inline--fa fa-circle-check NewFeed_icon__SEASG"
															role="img" xmlns="http://www.w3.org/2000/svg"
															viewBox="0 0 512 512">
													<path fill="currentColor"
																d="M0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256zM371.8 211.8C382.7 200.9 382.7 183.1 371.8 172.2C360.9 161.3 343.1 161.3 332.2 172.2L224 280.4L179.8 236.2C168.9 225.3 151.1 225.3 140.2 236.2C129.3 247.1 129.3 264.9 140.2 275.8L204.2 339.8C215.1 350.7 232.9 350.7 243.8 339.8L371.8 211.8z"></path></svg>
													</div>
												</c:if>
											</a>
										</div>
										<div class="header__action d-flex align-items-center">
											<c:if test="${member != null }">
												<div id="action__bookmark-${status.index }"
													class="action__bookmark hightlight-button">
													<p id="postIdRequest-${status.index }" class="d-none">${post.getMaBaiViet()}</p>
													<c:set var="isBookmark" value="fa-regular" />
													<c:choose>
														<c:when
															test="${listBookmarks != null && fn:length(listBookmarks) > 0}">
															<c:forEach var="bookmark" items="${listBookmarks}"
																varStatus="statusBookmark">
																<c:if
																	test="${member.getMaThanhVien() == bookmark.getMaThanhVien() && post.getMaBaiViet() == bookmark.getMaBaiViet()}">
																	<c:set var="isBookmark" value="fa-solid" />
																	<!-- <i class="fa-solid fa-bookmark"></i> -->
																</c:if>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<c:set var="isBookmark" value="fa-regular" />
														</c:otherwise>
													</c:choose>
													<i class="${isBookmark} fa-bookmark"></i>
												</div>
											</c:if>
											<div id="action__other-${status.index }"
												class="action__other hightlight-button ms-1 position-relative">
												<i class="fa-solid fa-ellipsis"></i>
												<div id="list__action-${status.index }"
													class="list__action list__custom position-absolute">
													<ul style="width: 200px;">
														<c:if
															test="${member.getMaThanhVien() != post.getTacGia() }">
															<li class="list__custom-item"><a
																href="report-blog?postId=${post.getMaBaiViet() }"><i
																	class="fa-solid fa-flag me-1"></i>Báo cáo bài viết</a></li>
														</c:if>
														<c:if
															test="${member.getMaThanhVien() == post.getTacGia() }">
															<li class="list__custom-item list__custom-item--spread">
																<a href="edit-blog?postId=${post.getMaBaiViet() }"><i
																	class="fa-solid fa-pen-to-square me-1"></i>Sửa bài viết</a>
															</li>
															<li class="list__custom-item list__custom-item--spread">
																<a href="move-trash?postId=${post.getMaBaiViet() }"><i
																	class="fa-solid fa-trash-can me-1"></i>Bỏ vào thùng rác</a>
															</li>
														</c:if>

													</ul>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div
									class="post__item-content d-flex justify-content-between align-items-center">
									<div>
										<div class="post__item-header-title">
											<a href="detail/${post.getMaBaiViet() }"
												class="fs-3 name fw-bold mt-2 text-break">${post.getTieuDe() }
											</a>
										</div>

										<div class="post__item-header-description mt-2 mb-3">
											<div
												class="post__item-header-description--content text-muted text-break">
												${post.getNoiDung()}</div>
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
												class="post__item-footer-time d-flex align-items-center flex-wrap"
												title="<fmt:formatDate  pattern='dd-MM-yyyy HH:mm:ss' value='${post.getNgayXuatBan()}'/>">
												<i class="fa-regular fa-clock"></i> <span
													class="time__content ms-1">${post.getThoiGianKeTu()}</span>
											</div>
											<span class="post__item-dot">·</span> <span
												class="post__item-footer-total-emotion d-flex align-items-center flex-wrap"><span
												class="total-emotion__content me-1">${post.getSoLuotCamXuc() }</span><i
												class="fa-solid fa-heart text-danger"></i></span>
										</div>
									</div>
									<c:if test="${post.getAnhNen() != ''}">
										<div class="post__thumbnail">
											<a href="detail/${post.getMaBaiViet() }" class=""> <img
												style="border-radius: 15px;" src="${post.getAnhNen() }"
												width="250px" height="210px" />
											</a>
										</div>
									</c:if>
								</div>
							</div>
							<!-- End Post Item -->

						</c:forEach>
					</c:when>

					<c:otherwise>
						<div>
							<p class="text-center text-muted">
								Hiện tại không có bài đăng nào. <a href="write-blog">Đóng
									góp kiến thức cho mọi người qua bài viết của bạn nào!</a>
							</p>
						</div>
					</c:otherwise>
				</c:choose>


			</div>

			<!-- Pagination -->
			<c:if test="${param['page'] == null}">
				<c:set var="pageParam" value="1" />
			</c:if>
			<c:if test="${param['page'] != null}">
				<c:set var="pageParam" value="${param['page']}" />
			</c:if>
			<c:if test="${param['filter'] == null}">
				<c:set var="filterParam" value="" />
			</c:if>
			<c:if test="${param['filter'] != null}">
				<c:set var="filterParam" value="&filter=${param['filter']}" />
			</c:if>
			<nav class="position-absolute start-50 translate-middle-x"
				aria-label="Page navigation ">
				<ul class="pagination justify-content-center">
					<c:if test="${fn:length(listPageNum) > 0 && pageParam == 1}">
						<li class="page-item disabled" style="cursor: no-drop;"><a
							class="page-link text-secondary"><i
								class="fa-solid fa-angles-left"></i> </a></li>
					</c:if>
					<c:if test="${fn:length(listPageNum) > 0 && pageParam > 1}">
						<li id="btnPrevPaginate" class="page-item"><a
							href="home?page=${pageParam - 1}${filterParam}"
							class="page-link text-secondary"><i
								class="fa-solid fa-angles-left"></i> </a></li>
					</c:if>
					<c:forEach var="page" items="${listPageNum}">
						<c:choose>
							<c:when test="${pageParam == page}">
								<li class="page-item"><a
									class="page-link text-dark paginate--active">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li id="page-item-${page}" class="paginate__page-item page-item"><a
									class="page-link text-dark"
									href="home?page=${page}${filterParam}">${page}</a></li>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<!-- 					<li class="page-item"><a class="page-link text-dark" href="#">2</a> -->
					<!-- 					</li> -->
					<!-- 					<li class="page-item"><a class="page-link text-dark" href="#">3</a> -->
					<!-- 					</li> -->
					<!-- 					<li class="page-item disabled"><a class="page-link text-dark" -->
					<!-- 						href="#">...</a></li> -->
					<!-- 					<li class="page-item"><a class="page-link text-dark" href="#">20</a> -->
					<!-- 					</li> -->
					<c:if test="${pageParam == fn:length(listPageNum)}">
						<li class="page-item disabled" style="cursor: no-drop;"><a
							class="page-link text-secondary"><i
								class="fa-solid fa-angles-right"></i> </a></li>
					</c:if>
					<c:if test="${pageParam < fn:length(listPageNum)}">
						<li id="btnNextPaginate" class="page-item"><a
							class="page-link text-dark"
							href="home?page=${pageParam + 1}${filterParam}"> <i
								class="fa-solid fa-angles-right"></i>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>



		<!-- Filter -->
		<div class="area__filter col-md-4 col-sm-12">
			<div class="filter--category">
				<h2 class="text-muted">Lọc theo từng mục</h2>
				<div class="post__item-footer-tag-list d-flex flex-wrap">
					<c:forEach var="category" items="${listCategories }">
						<c:choose>
							<c:when test="${param['filter'] == category.getMaTheLoai()}">
								<a
									class="filter__category badge post__item-footer-tag m-1 p-2 text-decoration-underline text-light bg-dark">
									${category.getTenTheLoai() } </a>
							</c:when>
							<c:otherwise>
								<a
									href="home?page=1&filter=${category.getMaTheLoai() }${searchParam}"
									class="filter__category badge post__item-footer-tag m-1 p-2 name text-light">
									${category.getTenTheLoai() } </a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>

			<c:if test="${fn:length(threePostTrending) > 0}">
				<div class="mt-5 filter--hottrend">
					<h2 class="text-muted">Những bài viết nổi bật</h2>
					<div class="post__list--trend d-flex flex-column">
						<c:forEach var="trending" items="${threePostTrending}">
							<!-- Post Trend Item 1 -->
							<div class="post__item--trend">
								<div class="post__thumbnail hottrend">
									<a href="#" class="post__thumbnail--link"> <img
										src="${trending.getAnhNen()}"
										width="250px" height="180px" />
									</a>
								</div>
								<div class="text-center">
									<div class="post__item-header-title mt-3">
										<a href="${myContext}/detail/${trending.getMaBaiViet()}"
											class="fs-6 name fw-bold text-break">${trending.getTieuDe()}</a>
									</div>
								</div>
								<div
									class="post__item-content d-flex justify-content-between align-items-start">
									<div>
										<div class="post__item-footer d-flex align-items-center">
											<a
												href="home?page=1&filter=${trending.getTheLoai() }${searchParam}"
												class="badge post__item-footer-tag m-1 p-2 name text-light">
												${trending.getTenTheLoai() } </a> <span class="post__item-dot">·</span>
											<div
												class="post__item-footer-time d-flex align-items-center flex-wrap">
												<i class="fa-solid fa-calendar-days"></i> <span
													class="time__content ms-1"><fmt:formatDate
														pattern='dd-MM-yyyy' value='${trending.getNgayXuatBan()}' /></span>
											</div>
											<span class="post__item-dot">·</span> <span
												class="post__item-footer-total-emotion d-flex align-items-center flex-wrap"><span
												class="total-emotion__content me-1">${trending.getSoLuotCamXuc()}</span><i
												class="fa-solid fa-heart text-danger"></i></span>
										</div>
									</div>
								</div>
							</div>
							<!-- End Post Trend Item -->
						</c:forEach>
					</div>
				</div>
			</c:if>
		</div>
	</div>


</div>

<!-- Jquery for post -->
<script type="text/javascript">
	$(document).ready(
			function() {
				var removeFilterAndSearch = $('#removeFilterAndSearch');
				var actionOthers = $(".action__other");
				var actionBookMark = $(".action__bookmark");
				var paginatePageItem = $('.paginate__page-item');
				var filterCategory = $('.filter__category');
				var btnPrevPaginate = $('#btnPrevPaginate');
				var btnNextPaginate = $('#btnNextPaginate');

				removeFilterAndSearch.click(function(e) {
					e.preventDefault();
					let url = $(this).attr('href');
					$.ajax({
						url : url,
						type : "get",
						success : function(data) {
							window.history.pushState("", "", url);
							$('body').html(data);
							$(document).scrollTop(0);
						}

					})
				})

				btnPrevPaginate.click(function(e) {
					e.preventDefault();
					let id = $(this).attr('id')[$(this).attr('id').length - 1]
					let aBtnPrevPaginate = $('#' + $(this).attr('id') + '> a');
					let url = aBtnPrevPaginate.attr('href');

					$.ajax({
						url : url,
						type : "get",
						success : function(data) {
							window.history.pushState("", "", url);
							$('body').html(data);
							$(document).scrollTop(0);
						}

					})
				})

				btnNextPaginate.click(function(e) {
					e.preventDefault();
					let id = $(this).attr('id')[$(this).attr('id').length - 1]
					let aBtnNextPaginate = $('#' + $(this).attr('id') + '> a');
					let url = aBtnNextPaginate.attr('href');

					$.ajax({
						url : url,
						type : "get",
						success : function(data) {
							window.history.pushState("", "", url);
							$('body').html(data);
							$(document).scrollTop(0);
						}

					})
				})

				paginatePageItem.click(function(e) {
					e.preventDefault();
					let paginatePageItemSize = 'page-item-';
					let id = $(this).attr('id').slice(
							paginatePageItemSize.length);
					let aPageItem = $('#' + $(this).attr('id') + '> a');
					let url = aPageItem.attr('href');

					$.ajax({
						url : url,
						type : "get",
						success : function(data) {
							window.history.pushState("", "", url);
							$('body').html(data);
							$(document).scrollTop(0);
						}

					})
				})

				filterCategory.click(function(e) {
					e.preventDefault();
					let url = $(this).attr('href');

					$.ajax({
						url : url,
						type : "get",
						success : function(data) {
							window.history.pushState("", "", url);
							$('body').html(data);
							$(document).scrollTop(0);
						}

					})
				})

				actionOthers.click(function() {
					let actionOthersSize = 'action__other-';
					let idActionOther = $(this).attr('id').slice(
							actionOthersSize.length);
					$('#list__action-' + idActionOther).toggle();
				})

				actionBookMark.click(function() {
					let actionBookMarkSize = 'action__bookmark-';
					let idBookMark = $(this).attr('id').slice(
							actionBookMarkSize.length);
					let actionBookMarkItem = $('#action__bookmark-'
							+ idBookMark + ' i');
					let isChecked = actionBookMarkItem.hasClass("fa-solid");
					var postIdRequest = $('#postIdRequest-' + idBookMark);
					var postIdRequestText = postIdRequest.text();
					console.log('postIdRequestText: ', postIdRequestText);
					if (isChecked) {
						actionBookMarkItem.removeClass("fa-solid");
						actionBookMarkItem.addClass("fa-regular");
					} else {
						actionBookMarkItem.addClass("fa-solid");
						actionBookMarkItem.removeClass("fa-regular");
						$('#toast__bookmark-' + idBookMark).show();
						$(".btn-close").click(function() {
							$('#toast__bookmark-' + idBookMark).hide();
						});
					}
					$.ajax({
						url : "add-bookmark",
						type : "post",
						data : {
							postId : postIdRequestText
						},
						success : function(data) {
							console.log('===> data: ', data)
						}
					})
				})
			});
</script>
</body>
</html>