<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="_header.jsp" />
<!-- Write My Blog Page  -->
<div class="row">
	<div class="col">
		<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
			<ol class="breadcrumb mb-0">
				<li class="breadcrumb-item fw-bold text-success "><i
					class="fa-solid fa-house-chimney me-2"></i><a id="homePage"
					href="${myContext }/home" class="fw-bold text-success name">Trang
						chủ</a></li>
				<li class="text-break breadcrumb-item active" aria-current="page">Trang
					sửa bài viết có tiêu đề<span class="fw-bold text-success name">${post.getTieuDe()}</span>
					của tác giả <span class="fw-bold text-success">${post.getTenTacGia()}</span>
				</li>
			</ol>
		</nav>
	</div>
</div>
<div class="blog container mb-2">
	<div class="row">
		<form action="${myContext }/edit-blog" method="post"
			class="mt-4 d-flex flex-wrap justify-content-between">
			<div class="form__group col-md-8">
				<div class="blog__title--write">
					<textarea id="txtBlogTitle" name="txtBlogTitle"></textarea>
				</div>
				<div class="blog__content--write">
					<textarea id="txtBlogContent" name="txtBlogContent"></textarea>
				</div>
			</div>

			<div id="area__edit-title" class="d-none">${post.getTieuDe()}</div>
			<div id="area__edit-content" class="d-none">${post.getNoiDung()}</div>

			<div
				class="form__action d-flex flex-column align-items-center justify-content-around col-md-4 px-5 mt-2">

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Ảnh nền bài
						viết</span> <input type="text" id="txtBlogBackground"
						class="form-control" name="txtBlogBackground"
						placeholder="Nhập ảnh nền bài viết ..."
						value="${post.getAnhNen() }" aria-label="txtBlogBackground"
						aria-describedby="basic-addon1">
				</div>

				<div class="input-group mb-3">
					<label class="input-group-text" for="inputGroupSelect01">#HashTag</label>
					<select class="form-select" id="txtBlogHashtag"
						name="txtBlogHashtag">
						<option selected>-- chọn hashtag --</option>
						<c:forEach var="category" items="${listCategories }">
							<c:if test="${post.getTheLoai() ==  category.getMaTheLoai()}">
								<option value="${ post.getTheLoai()}" selected>${ post.getTenTheLoai()}</option>
							</c:if>
							<option value="${ category.getMaTheLoai()}">${ category.getTenTheLoai()}</option>
						</c:forEach>
					</select>
				</div>

				<button type="submit" id="btnEditPost" name="btnEditPost"
					class="mt-5 btn btn-dark action__btn action__btn-post">
					Cập nhật</button>
			</div>
		</form>
	</div>
</div>

<!-- JS For Write Blog -->
<script>
	CKEDITOR.replace("txtBlogTitle", {
		extraPlugins : "editorplaceholder, emoji",
		editorplaceholder : "Tiêu đề",
	});
	CKEDITOR
			.replace(
					"txtBlogContent",
					{
						extraPlugins : "editorplaceholder, emoji,embed,autoembed,image2",
						editorplaceholder : "Nội dung viết ở đây",
						height : 500,

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

	$(document)
			.ready(
					function() {
						$(document).prop('title', 'Trang sửa bài viết cá nhân')
						CKEDITOR.instances['txtBlogTitle'].setData($(
								'#area__edit-title').html());
						CKEDITOR.instances['txtBlogContent'].setData($(
								'#area__edit-content').html());
						var url = $('#myContext').text() + "edit-blog";
						console.log('url: ' + url)
						$('#btnEditPost')
								.click(
										function(e) {
											// 			e.preventDefault();
											const data = {
												txtBlogTitle : CKEDITOR.instances['txtBlogTitle']
														.getData(),
												txtBlogContent : CKEDITOR.instances['txtBlogContent']
														.getData(),
												txtBlogBackground : $(
														'#txtBlogBackground')
														.val(),
												txtBlogHashtag : $(
														'#txtBlogHashtag')
														.val(),
											}
											console.log(data)
											$
													.ajax({
														url : url,
														type : "post",
														data : {
															txtBlogTitle : CKEDITOR.instances['txtBlogTitle']
																	.getData(),
															txtBlogContent : CKEDITOR.instances['txtBlogContent']
																	.getData(),
															txtBlogBackground : $(
																	'#txtBlogBackground')
																	.val(),
															txtBlogHashtag : $(
																	'#txtBlogHashtag')
																	.val(),
														},
														success : function(data) {
															console.log(data)
														}
													})
										})
					})
</script>
</body>
</html>