<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="_header.jsp" />
<c:choose>
	<c:when test="${isError == 0}">
		<c:set var="msg" value="Thay đổi mật khẩu thành công!" scope="page" />
		<c:set var="notify" value="Thông báo" scope="page" />
		<c:set var="text" value="text-success" scope="page" />
		<c:set var="alert" value="alert-success" scope="page" />
		<c:set var="icon" value="fa-bell" scope="page" />
		<c:set var="showNotify" value="d-block" scope="page" />
	</c:when>
	<c:when test="${isError == 1}">
		<c:set var="msg"
			value="Mật khẩu hiện tại không chính xác hoặc mật khẩu mới nhập lại không trùng khớp với mật khẩu mới"
			scope="page" />
		<c:set var="notify" value="Lỗi" scope="page" />
		<c:set var="text" value="text-danger" scope="page" />
		<c:set var="alert" value="alert-danger" scope="page" />
		<c:set var="icon" value="fa-triangle-exclamation" scope="page" />
		<c:set var="showNotify" value="d-block" scope="page" />
	</c:when>
	<c:otherwise>
		<c:set var="msg" value="" scope="page" />
		<c:set var="notify" value="" scope="page" />
		<c:set var="text" value="" scope="page" />
		<c:set var="alert" value="" scope="page" />
		<c:set var="icon" value="" scope="page" />
		<c:set var="showNotify" value="d-none" scope="page" />
	</c:otherwise>
</c:choose>
<div class="container mt-5">
	<form action="${myContext}/change-password" method="post">
		<div
			class="${showNotify } alert ${alert } ${text } text-center alert-dismissible fade show fs-6"
			role="alert">
			<i class="fa-solid ${icon }"></i> <strong>${notify }</strong>
			${msg}
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<c:choose>
			<c:when test="${isError == 1}">
				<div class="mb-3">
					<label class="form-label">Mật khẩu hiện tại</label> <input
						type="password" id="oldPassword" name="oldPassword"
						class="form-control" required="required"
						placeholder="Nhập lại mật khẩu hiện tại..." value="${oldPassword}">
				</div>
				<div class="mb-3">
					<label class="form-label">Mật khẩu mới</label> <input
						type="password" id="newPassword" name="newPassword"
						class="form-control" required="required"
						placeholder="Nhập mật khẩu mới..." value="${newPassword}">
				</div>
				<div class="mb-3">
					<label class="form-label">Nhập lại mật khẩu mới</label> <input
						type="password" id="reNewPassword" name="reNewPassword"
						class="form-control" required="required"
						placeholder="Nhập lại mật khẩu mới..." value="${reNewPassword}">
				</div>
			</c:when>
			<c:otherwise>
				<div class="mb-3">
					<label class="form-label">Mật khẩu hiện tại</label> <input
						type="password" id="oldPassword" name="oldPassword"
						class="form-control" required="required"
						placeholder="Nhập lại mật khẩu hiện tại...">
				</div>
				<div class="mb-3">
					<label class="form-label">Mật khẩu mới</label> <input
						type="password" id="newPassword" name="newPassword"
						class="form-control" required="required"
						placeholder="Nhập mật khẩu mới...">
				</div>
				<div class="mb-3">
					<label class="form-label">Nhập lại mật khẩu mới</label> <input
						type="password" id="reNewPassword" name="reNewPassword"
						class="form-control" required="required"
						placeholder="Nhập lại mật khẩu mới...">
				</div>
			</c:otherwise>
		</c:choose>
		<button type="submit" name="btnChangePassword"
			value="Thay đổi mật khẩu" class="btn btn-success d-block m-auto">Thay
			đổi mật khẩu</button>
	</form>
</div>
<!--/row-->
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout(function(){
			$('.alert').addClass("d-none");
		}, 5000)
	})
</script>
</body>
</html>