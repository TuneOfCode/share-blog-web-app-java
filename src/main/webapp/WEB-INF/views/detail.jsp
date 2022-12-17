<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="_header.jsp" />
<!-- Detail Page  -->
<!-- Content Detail Blog -->
<p id="memberIdRequest" data-link="${myContext}/account" class="d-none">${member.getMaThanhVien() }</p>
<div class="row">
	<div class="col">
		<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item fw-bold text-success "><i
					class="fa-solid fa-house-chimney me-2"></i><a id="homePage"
					href="${myContext }/home" class="fw-bold text-success name">Trang
						chủ</a></li>
				<li class="text-break breadcrumb-item active" aria-current="page">Chi
					tiết blog của tác giả <span class="fw-bold text-success">${post.getTenTacGia() }</span>
				</li>
			</ol>
		</nav>
	</div>
</div>
<p id="rootPathApp" class="d-none">${myContext}</p>
<div class="area__detail-post container mt-5">
	<div class="row">
		<section class="author__action col-md-2">
			<div class="position-sticky author__action-content">
				<a href="${myContext}/profile/${post.getTacGia()}"
					class="name d-flex align-items-center justify-content-center fs-5 fw-bold text-center">${post.getTenTacGia() }
					<c:if test="${post.getTichQuanTriVien() == 1}">
						<div class="d-flex" title="Đây là quản trị viên">
							<svg aria-hidden="true" focusable="false" data-prefix="fas"
								data-icon="circle-check"
								style="width: 15px; margin-left: 5px; color: #1b74e4;"
								class="svg-inline--fa fa-circle-check NewFeed_icon__SEASG"
								role="img" xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 512 512">
															<path fill="currentColor"
									d="M0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256zM371.8 211.8C382.7 200.9 382.7 183.1 371.8 172.2C360.9 161.3 343.1 161.3 332.2 172.2L224 280.4L179.8 236.2C168.9 225.3 151.1 225.3 140.2 236.2C129.3 247.1 129.3 264.9 140.2 275.8L204.2 339.8C215.1 350.7 232.9 350.7 243.8 339.8L371.8 211.8z"></path></svg>
						</div>
					</c:if>
				</a>
				<hr />
				<div
					class="action__emotion-comment--show d-flex align-items-center justify-content-around">
					<div class="custom--icon emotion fs-5">
						<p id="postIdEmotionRequest" class="d-none">${post.getMaBaiViet() }</p>
						<p id="rootUrlInDetail" class="d-none">${myContext }</p>
						<c:choose>
							<c:when test="${member != null && isCheckEmoteByPosId == 1 }">
								<i id="emotePost" class="fa-solid text-danger fa-heart"></i>
							</c:when>
							<c:otherwise>
								<i id="emotePost" class="fa-regular fa-heart"></i>
							</c:otherwise>
						</c:choose>
						<span class="count__heart ms-1">${post.getSoLuotCamXuc() }</span>
					</div>
					<div class="custom--icon comment fs-5 navbar-toggler">
						<i class="fa-regular fa-comment"></i> <span
							class="count__heart ms-1">${post.getSoLuotBinhLuan() }</span>
					</div>
				</div>
			</div>
		</section>

		<section class="detail__post text-center col-md-10">
			<h2 id="titleH2" class="detail__post-title fs-1 fw-bold">${post.getTieuDe() }</h2>
			<div
				class="post__item-header-top mt-3 d-flex align-items-center justify-content-around">
				<div class="header__author d-flex align-items-center">
					<img class="avatar" src="${post.getAnhDaiDien() }" width="60px"
						height="60px" alt="ảnh đại diện" />
					<div class="d-flex flex-column align-items-center">
						<a href="${myContext }/profile/${post.getTacGia() }"
							class="name d-flex align-items-center post__item-header-name fw-bold ms-2">${post.getTenTacGia() }
							<c:if test="${post.getTichQuanTriVien() == 1}">
								<div class="d-flex" title="Đây là quản trị viên">
									<svg aria-hidden="true" focusable="false" data-prefix="fas"
										data-icon="circle-check"
										style="width: 15px; margin-left: 5px; color: #1b74e4;"
										class="svg-inline--fa fa-circle-check NewFeed_icon__SEASG"
										role="img" xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 512 512">
															<path fill="currentColor"
											d="M0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256zM371.8 211.8C382.7 200.9 382.7 183.1 371.8 172.2C360.9 161.3 343.1 161.3 332.2 172.2L224 280.4L179.8 236.2C168.9 225.3 151.1 225.3 140.2 236.2C129.3 247.1 129.3 264.9 140.2 275.8L204.2 339.8C215.1 350.7 232.9 350.7 243.8 339.8L371.8 211.8z"></path></svg>
								</div>
							</c:if>
						</a>
						<div class="post__item-footer d-flex align-items-center">
							<div
								class="post__item-footer-time d-flex align-items-center flex-wrap text-muted">
								<i class="fa-solid fa-calendar-days"></i> <span
									class="time__content ms-1"><fmt:formatDate
										pattern="dd-MM-yyyy" value="${post.getNgayXuatBan() }" /></span>
							</div>
						</div>
					</div>
				</div>
				<div class="header__action d-flex align-items-center">
					<div id="action__other--detail"
						class="action__other hightlight-button ms-1 position-relative">
						<i class="fa-solid fa-ellipsis"></i>
						<div id="list__action--detail"
							class="list__action list__custom position-absolute"
							style="display: none; top: 40px;">
							<ul>
								<c:if test="${member.getMaThanhVien() != post.getTacGia() }">
									<li id="reportDetailBlog" class="list__custom-item"><a
										href="${myContext }/report-blog?postId=${post.getMaBaiViet() }"><i
											class="fa-solid fa-flag me-1"></i>Báo cáo bài viết</a></li>
								</c:if>
								<c:if test="${member.getMaThanhVien() == post.getTacGia() }">
									<li id="editDetailBlog"
										class="list__custom-item list__custom-item--spread"><a
										href="${myContext }/edit-blog?postId=${post.getMaBaiViet() }"><i
											class="fa-solid fa-pen-to-square me-1"></i>Sửa bài viết</a></li>
									<li id="destroyDetailBlog"
										class="list__custom-item list__custom-item--spread"><a
										href="${myContext }/delete-blog?postId=${post.getMaBaiViet() }"><i
											class="fa-solid fa-trash-can me-1"></i>Xoá bài viết</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div
				class="detail__post-content mt-3 px-5 d-flex flex-column justify-content-center text-muted text-break fs-5">
				<div class="paragraph">${post.getNoiDung() }</div>
			</div>
		</section>
	</div>
</div>

<!-- Comment Post -->
<div class="area__comments" tabindex="-1" id="area__comment">
	<div class="area__comments-item" style="height: 749px;">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title fw-bold fs-3" id="offcanvasNavbarLabel">
				Bình luận (${fn:length(listComments)})</h5>
			<button type="button" id="btn-close-area__comments" class="btn-close"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body mt-5" style="height: 636px;">
			<div class="header__author d-flex">
				<c:if test="${member != null }">
					<img class="avatar" src="${member.getAnhDaiDien() }" width="40px"
						height="40px" alt="ảnh đại diện" />
					<p id="postId" class="d-none">${post.getMaBaiViet()}</p>
					<div class="author__comment ms-2">
						<span class="comment--write">Viết bình luận của bạn...</span>
						<hr id="__spread" />
						<textarea id="editor" name="txtCommentContent"></textarea>
						<div class="editor__action mt-3">
							<button type="button" class="btn action__btn action__btn-cancel">
								Huỷ</button>
							<button type="button" id="btnAddComment" name="btnAddComment"
								class="btn btn-dark action__btn action__btn-comment">
								Bình luận</button>
						</div>
					</div>
				</c:if>
				<c:if test="${member == null }">
					<a href="${myContext}/account"
						class="name d-flex justify-content-center text-center text-danger fw-bold">Đăng
						nhập để bình luận</a>
				</c:if>
			</div>
			<div class="header__author mt-5">
				<div class="comments">
					<c:if test="${fn:length(listComments) > 0}">
						<c:forEach var="comment" items="${listComments}"
							varStatus="commentStatus">
							<!-- Start Comment Item 1 -->
							<div class="comment__item d-flex my-2">
								<img class="avatar" src="${comment.getAnhDaiDien()}"
									width="40px" height="40px" alt="ảnh đại diện" />
								<div class="d-flex flex-column ms-2">
									<div class="comment__item-content">
										<div class="d-flex align-items-center ">
											<a href="${myContext }/profile/${comment.getNguoiTao()}"
												class="name post__item-header-name fw-bold ms-2">
												${comment.getTenNguoiTao()} </a>
											<c:if test="${comment.getTichQuanTriVien() == 1}">
												<div class="d-flex" title="Đây là quản trị viên">
													<svg aria-hidden="true" focusable="false" data-prefix="fas"
														data-icon="circle-check"
														style="width: 15px; margin-left: 5px; color: #1b74e4;"
														class="svg-inline--fa fa-circle-check NewFeed_icon__SEASG"
														role="img" xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 512 512">
															<path fill="currentColor"
															d="M0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256zM371.8 211.8C382.7 200.9 382.7 183.1 371.8 172.2C360.9 161.3 343.1 161.3 332.2 172.2L224 280.4L179.8 236.2C168.9 225.3 151.1 225.3 140.2 236.2C129.3 247.1 129.3 264.9 140.2 275.8L204.2 339.8C215.1 350.7 232.9 350.7 243.8 339.8L371.8 211.8z"></path></svg>
												</div>
											</c:if>
										</div>
										<div id="textOldContent-${commentStatus.index}"
											class="text-muted ms-2 mt-2 text-break"
											style="text-align: justify; display: block;">${comment.getNoiDung()}</div>
										<div id="area__edit-${commentStatus.index}"
											style="display: none;">
											<textarea id="txtEditCommentContent-${commentStatus.index}"
												name="txtEditCommentContent-${commentStatus.index}"></textarea>
											<div class="mt-3">
												<button type="button" id="btnCancel-${commentStatus.index}"
													class="btn action__btn action__btn-cancel btnCancel">Huỷ</button>
												<button type="button"
													id="btnEditComment-${commentStatus.index}"
													name="${comment.getMaBinhLuan()}"
													data-postId="${comment.getMaBaiViet()}"
													class="btn btn-dark action__btn action__btn-comment btnEditComment">
													Cập nhật bình luận</button>
											</div>
										</div>
									</div>
									<div id="comment__item-footer-${commentStatus.index}"
										class="d-flex text-dark align-items-center text-danger comment__item-footer ms-2">
										<div id="comment__footer--heart-${commentStatus.index}"
											class="comment__footer--heart hightlight-button">
											<c:choose>
												<c:when test="${comment.getNguoiDaThaCamXuc() == 0}">
													<i id="emoteComment-${commentStatus.index}"
														data-link="${myContext}/emote-comment?commentId=${comment.getMaBinhLuan()}&postId=${comment.getMaBaiViet()}"
														class="emoteComment fa-regular fa-heart"></i>
												</c:when>
												<c:otherwise>
													<i id="emoteComment-${commentStatus.index}"
														data-link="${myContext}/emote-comment?commentId=${comment.getMaBinhLuan()}&postId=${comment.getMaBaiViet()}"
														class="emoteComment fa-solid fa-heart text-danger"></i>
												</c:otherwise>
											</c:choose>
										</div>
										<span id="heart__comment--count-${commentStatus.index}"
											class="heart__comment--count">${comment.getSoLuotCamXuc()}</span>
										<span class="post__item-dot">·</span>
										<div
											title="<fmt:formatDate  pattern='dd-MM-yyyy HH:mm:ss' value='${comment.getNgayTao()}'/>"
											class="comment__item-time text-muted">${comment.getThoiGianKeTu()}</div>
										<span class="post__item-dot">·</span>
										<div id="action__other--comment-${commentStatus.index}"
											class="action__other--comment action__other hightlight-button position-relative">
											<i class="fa-solid fa-ellipsis"></i>
											<div id="list__action--comment-${commentStatus.index}"
												class="list__action--comment list__custom position-absolute"
												style="display: none; top: 36px;">
												<ul>
													<c:if
														test="${member.getMaThanhVien() != comment.getNguoiTao() && member.getMaThanhVien() != post.getTacGia()}">
														<li id="btnReportComment-${commentStatus.index}"
															class="btnReportComment list__custom-item"><a
															href="${myContext}/report-comment?commentId=${comment.getMaBinhLuan()}&postId=${comment.getMaBaiViet()}"><i
																class="fa-solid fa-flag me-1"></i>Báo cáo bình luận</a></li>
													</c:if>
													<c:if
														test="${member.getMaThanhVien() == comment.getNguoiTao()}">
														<li id="btnShowEditComment-${commentStatus.index}"
															class="btnShowEditComment list__custom-item list__custom-item--spread">
															<a><i class="fa-solid fa-pen-to-square me-1"></i>Sửa
																bình luận</a>

														</li>
														<li class="list__custom-item list__custom-item--spread">
															<a id="btnDestroyComment-${commentStatus.index}"
															class="btnDestroyComment"
															href="${myContext}/destroy-comment?commentId=${comment.getMaBinhLuan()}&postId=${comment.getMaBaiViet()}"><i
																class="fa-solid fa-trash-can me-2"></i>Xoá bình luận</a>
														</li>
													</c:if>
													<c:if
														test="${member.getMaThanhVien() != comment.getNguoiTao() && member.getMaThanhVien() == post.getTacGia()}">
														<li class="list__custom-item"><a
															href="${myContext}/report-comment?commentId=${comment.getMaBinhLuan()}&postId=${comment.getMaBaiViet()}"><i
																class="fa-solid fa-flag me-1"></i>Báo cáo bình luận</a></li>
														<li class="list__custom-item list__custom-item--spread">
															<a id="btnDestroyComment-${commentStatus.index}"
															class="btnDestroyComment"
															href="${myContext}/destroy-comment?commentId=${comment.getMaBinhLuan()}&postId=${comment.getMaBaiViet()}"><i
																class="fa-solid fa-trash-can me-2"></i>Xoá bình luận</a>
														</li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Comment Item -->
						</c:forEach>
					</c:if>

				</div>
			</div>
		</div>
	</div>
</div>
<!-- Jquery of add comment -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// thêm bình luận
						var actionOthers = $(".action__other--comment");
						actionOthers.click(function() {
							let actionOthersSize = 'action__other--comment-'
							let idActionOther = $(this).attr('id').slice(
									actionOthersSize.length);
							$('#list__action--comment-' + idActionOther)
									.toggle();
						})
						$('#btnAddComment')
								.click(
										function(e) {
											e.preventDefault();
											let txtCommentContent = CKEDITOR.instances['editor']
													.getData();
											let postId = $('#postId').text();
											let btnAddComment = $(this).attr(
													'name');
											let url = $('#rootPathApp').text()
													+ '/add-comment';
											const data = {
												txtCommentContent : txtCommentContent,
												postId : postId,
												btnAddComment : btnAddComment
											}

											$
													.ajax({
														url : url,
														type : "post",
														data : data,
														success : function(data) {
															$('body')
																	.html(data);
															$('#area__comment')
																	.css(
																			'display',
																			'block');
														}
													})
										})
						// sửa bình luận
						var btnShowEditComment = $('.btnShowEditComment');
						var btnCancel = $('.btnCancel');
						var btnEditComment = $('.btnEditComment');
						btnShowEditComment
								.click(function(e) {
									e.preventDefault();
									let btnShowEditCommentSize = 'btnShowEditComment-';
									let idBtnShowEditComment = $(this).attr(
											'id').slice(
											btnShowEditCommentSize.length);
									$('#area__edit-' + idBtnShowEditComment)
											.show();
									let editorName = "txtEditCommentContent-"
											+ idBtnShowEditComment;
									let textOldContent = '#textOldContent-'
											+ idBtnShowEditComment;
									CKEDITOR
											.replace(
													editorName,
													{
														extraPlugins : "editorplaceholder, emoji,embed,autoembed,image2",
														editorplaceholder : "Viết bình luận ở đây...",
														height : 300,

														// Load the default contents.css file plus customizations for this sample.
														contentsCss : [
																'http://cdn.ckeditor.com/4.20.1/full-all/contents.css',
																'https://ckeditor.com/docs/ckeditor4/4.20.1/examples/assets/css/widgetstyles.css' ],
														// Setup content provider. See https://ckeditor.com/docs/ckeditor4/latest/features/media_embed
														embed_provider : '//ckeditor.iframe.ly/api/oembed?url={url}&callback={callback}',

														// Configure the Enhanced Image plugin to use classes instead of styles and to disable the
														// resizer (because image size is controlled by widget styles or the image takes maximum
														// 100% of the editor width).
														image2_alignClasses : [
																'image-align-left',
																'image-align-center',
																'image-align-right' ],
														image2_disableResizer : true,
														removeButtons : 'PasteFromWord'
													});
									let textOldContentHTML = $(textOldContent)
											.html();
									CKEDITOR.instances[editorName]
											.setData(textOldContentHTML);
									$(textOldContent).hide();
								})
						btnCancel.click(function(e) {
							e.preventDefault();
							let btnCancelSize = 'btnCancel-';
							let idBtnCancel = $(this).attr('id').slice(
									btnCancelSize.length);
							console.log('idBtnCancel: ', idBtnCancel);
							let textOldContent = '#textOldContent-'
									+ idBtnCancel;
							$(textOldContent).show();
							$('#area__edit-' + idBtnCancel).hide();
						})

						btnEditComment
								.click(function(e) {
									e.preventDefault();
									let btnEditCommentSize = 'btnEditComment-';
									let idBtnEditComment = $(this).attr('id')
											.slice(btnEditCommentSize.length);
									let editorName = "txtEditCommentContent-"
											+ idBtnEditComment;
									let textOldContent = '#textOldContent-'
											+ idBtnEditComment;
									let txtCommentContent = CKEDITOR.instances[editorName]
											.getData();
									let postId = $(this).attr('data-postId');
									let commentId = $(this).attr('name');
									const data = {
										txtCommentContent : txtCommentContent,
										postId : postId,
										btnEditCommentId : commentId
									}
									let url = $('#rootPathApp').text()
											+ '/edit-comment';
									$
											.ajax({
												url : url,
												type : "post",
												data : data,
												success : function(data) {
													$('body').html(data);
													$(textOldContent).show();
													$(
															'#area__edit-'
																	+ idBtnEditComment)
															.hide();
													$('#area__comment').css(
															'display', 'block');
												}
											})
								})
						// xoá bình luận
						var btnDestroyComment = $('.btnDestroyComment');
						btnDestroyComment.click(function(e) {
							e.preventDefault();
							let btnDestroyCommentSize = 'btnDestroyComment-';
							let idBtnDestroyComment = $(this).attr('id').slice(
									btnDestroyCommentSize.length);

							let url = $(this).attr('href');
							$
									.ajax({
										url : url,
										type : "get",
										success : function(data) {
											$('body').html(data);
											$('#area__comment').css('display',
													'block');
										}
									})
						})

						// hiển thị hành động trong đọc bài viết chi tiết
						$('#action__other--detail').click(function(e) {
							e.preventDefault();
							$('#list__action--detail').toggle();
						})
						// báo cáo chi tiết bài đăng
						$('#reportDetailBlog')
								.click(
										function(e) {
											e.preventDefault();
											var memberIdRequest = $('#memberIdRequest');
											if (memberIdRequest.text() === '') {
												window.location.replace($(
														memberIdRequest).attr(
														'data-link'));
												return;
											}
											let url = $('#reportDetailBlog > a')
													.attr('href');
											$
													.ajax({
														url : url,
														type : "post",
														success : function(data) {
															console
																	.log('báo cáo bài viết thành công');
														}
													})
										})

						// sửa chi tiết bài đăng
						$('#editDetailBlog').click(function(e) {
							e.preventDefault();
							let url = $('#editDetailBlog > a').attr('href');
							window.location.replace(url);
// 							$.ajax({
// 								url : url,
// 								type : "get",
// 								success : function(data) {
// 									$('body').html(data);
// 								}
// 							})
						})

						// xoá chi tiết bài đăng
						$('#destroyDetailBlog').click(function(e) {
							e.preventDefault();
							let url = $('#destroyDetailBlog > a').attr('href');
							$.ajax({
								url : url,
								type : "get",
								success : function(data) {
									$('body').html(data);
								}
							})
						})
						// báo cáo bình luận
						$('.btnReportComment')
								.click(
										function(e) {
											e.preventDefault();
											var memberIdRequest = $('#memberIdRequest');
											if (memberIdRequest.text() === '') {
												window.location.replace($(
														memberIdRequest).attr(
														'data-link'));
												return;
											}
											let btnReportCommentSize = 'btnReportComment-';
											let idBtnReportComment = $(this)
													.attr('id')
													.slice(
															btnReportCommentSize.length);
											let url = $(
													'#'
															+ btnReportCommentSize
															+ idBtnReportComment
															+ ' > a').attr(
													'href');
											$
													.ajax({
														url : url,
														type : "post",
														success : function(data) {
															console
																	.log('báo cáo bình luận thành công');
														}
													})
										})
						// thả cảm xúc bình luận
						$('.comment__footer--heart')
								.click(
										function(e) {
											e.preventDefault();
											var memberIdRequest = $('#memberIdRequest');
											if (memberIdRequest.text() === '') {
												window.location.replace($(
														memberIdRequest).attr(
														'data-link'));
												return;
											}
											let emoteCommentSize = 'comment__footer--heart-';
											let idEmoteComment = $(this).attr(
													'id').slice(
													emoteCommentSize.length);
											console.log('idEmoteComment: '
													+ idEmoteComment);
											let emoteCommentItem = '#'
													+ 'emoteComment-'
													+ idEmoteComment;
											console.log('emoteCommentItem: '
													+ emoteCommentItem);
											var isCheckEmoted = $(
													emoteCommentItem).hasClass(
													'fa-solid');
											if (!isCheckEmoted) {
												$(emoteCommentItem).addClass(
														'fa-solid text-danger');
												$(emoteCommentItem)
														.removeClass(
																'fa-regular');
											} else {
												$(emoteCommentItem).addClass(
														'fa-regular');
												$(emoteCommentItem)
														.removeClass(
																'fa-solid text-danger');
											}
											let commentItemFooterItem = '#comment__item-footer-'
													+ idEmoteComment;
											let heartCommentCountItem = '#heart__comment--count-'
												+ idEmoteComment;
											let url = $(emoteCommentItem).attr(
													'data-link');
											$
													.ajax({
														url : url,
														type : "get",
														success : function(data) {
															$('body').html(data);
															$('#area__comment')
																	.css(
																			'display',
																			'block');
														}
													})
										})
					})
</script>
<!-- Jquery for comment -->
<script type="text/javascript">
	CKEDITOR
			.replace(
					"txtCommentContent",
					{
						extraPlugins : "editorplaceholder, emoji,embed,autoembed,image2",
						editorplaceholder : "Viết bình luận ở đây...",
						height : 300,

						// Load the default contents.css file plus customizations for this sample.
						contentsCss : [
								'http://cdn.ckeditor.com/4.20.1/full-all/contents.css',
								'https://ckeditor.com/docs/ckeditor4/4.20.1/examples/assets/css/widgetstyles.css' ],
						// Setup content provider. See https://ckeditor.com/docs/ckeditor4/latest/features/media_embed
						embed_provider : '//ckeditor.iframe.ly/api/oembed?url={url}&callback={callback}',

						// Configure the Enhanced Image plugin to use classes instead of styles and to disable the
						// resizer (because image size is controlled by widget styles or the image takes maximum
						// 100% of the editor width).
						image2_alignClasses : [ 'image-align-left',
								'image-align-center', 'image-align-right' ],
						image2_disableResizer : true,
						removeButtons : 'PasteFromWord'
					});
	$(document).ready(function() {
		// thả cảm xúc bài viết
		var emotePost = $('#emotePost');
		emotePost.click(function() {
			var postIdEmotionRequest = $('#postIdEmotionRequest');
			var rootUrlInDetail = $('#rootUrlInDetail');
			var rootUrlInDetailText = rootUrlInDetail.text();
			var postIdEmotionRequestText = postIdEmotionRequest.text();
			console.log('rootUrlInDetailText: ', rootUrlInDetailText)
			console.log('emote: ', postIdEmotionRequestText);
			var memberIdRequest = $('#memberIdRequest');
			if (memberIdRequest.text() === '') {
				window.location.replace($(memberIdRequest).attr('data-link'));
				return;
			}
			var isEmoted = emotePost.hasClass('fa-regular');
			if (isEmoted) {
				emotePost.removeClass('fa-regular');
				emotePost.addClass('fa-solid text-danger');
			} else {
				emotePost.removeClass('fa-solid text-danger');
				emotePost.addClass('fa-regular');
			}
			$.ajax({
				url : rootUrlInDetailText + "/emote-blog",
				type : "post",
				data : {
					postId : postIdEmotionRequestText
				},
				success : function(data) {
					$('body').html(data);
				}
			})
		})

		$(".comment").click(function() {
			$(".area__comments").show(400);
		});
		$(".detail__post").click(function() {
			$(".area__comments").hide();
		});
		$("#btn-close-area__comments").click(function() {
			$(".area__comments").hide();
		});

		$(".comment--write").click(function() {
			$(this).hide();
			$("#__spread").hide();
			$("#cke_editor").show();
			$(".editor__action").show();
		});
		$(".action__btn-cancel").click(function() {
			$(".comment--write").show();
			$("#__spread").show();
			$("#cke_editor").hide();
			$(".editor__action").hide();
		});
	});
</script>

</body>
</html>