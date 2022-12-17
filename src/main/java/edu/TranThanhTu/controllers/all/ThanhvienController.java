package edu.TranThanhTu.controllers.all;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.TranThanhTu.models.bean.BaivietBean;
import edu.TranThanhTu.models.bean.DanhdaubaivietBean;
import edu.TranThanhTu.models.bean.ThanhvienBean;
import edu.TranThanhTu.models.bo.implement.BaivietBo;
import edu.TranThanhTu.models.bo.implement.ThanhvienBo;
import edu.TranThanhTu.utils.Helpers;

@Controller
public class ThanhvienController {
    @RequestMapping(value = { "/account", "/tai-khoan" })
    public String getFormAccount(Model model, HttpServletRequest request, HttpServletRequest response) {
	try {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    String txtFullname = request.getParameter("txtFullname");
	    String txtUsername = request.getParameter("txtUsername");
	    String txtPass = request.getParameter("txtPass");
	    String txtEmail = request.getParameter("txtEmail");
	    String txtPhone = request.getParameter("txtPhone");
	    String txtAddress = request.getParameter("txtAddress");
	    String txtJob = request.getParameter("txtJob");
	    String btnSignUp = request.getParameter("btnSignUp");
	    String btnSignIn = request.getParameter("btnSignIn");
	    String isCorrect = "-1";
	    String listProvinces[] = { "An Giang", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bà Rịa-Vũng Tàu",
		    "Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk",
		    "Đắc Nông", "Địện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hải Dương", "Hà Nam",
		    "Hà Tây", "Hà Tĩnh", "Hậu Giang", "Hoà Bình", "Hưng Yên", "Khánh Hoà", "Kiên Giang", "Kon Tum",
		    "Lai Châu", "Lâm Đông", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình",
		    "Ninh Thuận", "Phú Thọ", "Phú Yên", "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh",
		    "Quảng Trị", "Sóc Trăng", "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hoá",
		    "Thừa Thiên-Huế", "Tiền Giang", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái",
		    "Cần Thơ", "Đà Nẵng", "Hải Phòng", "Hà Nội", "TP.Hồ Chí Minh" };
	    String listJobs[] = { "giáo viên", "học sinh", "lập trình viên", "bác sĩ", "nghệ sĩ", "công nhân",
		    "công chức - viên chức", "chưa có" };
	    ThanhvienBean tv = null;

	    if (memberLogged != null) {
		return "redirect:home";
	    }
	    System.out.println("===== <AUTH> =====");

	    // Xử lý đăng ký
	    if (btnSignUp != null && txtFullname != null && txtAddress != null && txtPhone != null && txtEmail != null
		    && txtUsername != null && txtPass != null && txtJob != null) {
		tv = new ThanhvienBean("TV", txtFullname, txtUsername, txtPass, txtEmail, txtPhone, txtAddress, null,
			txtJob);
		String decodePass = txtPass;
		int result = new ThanhvienBo().register(tv);
		if (result > 0) {
		    isCorrect = "1";
		    tv = null;
		} else {
		    isCorrect = "0";
		    tv.setMatKhau(decodePass);
		}
		model.addAttribute("tv", (ThanhvienBean) tv);
	    }

	    // Xử lý đăng nhập
	    if (btnSignIn != null && txtUsername != null && txtPass != null) {
		String decodePass = txtPass;
		tv = new ThanhvienBo().login(txtUsername, txtPass);
		if (tv != null) {
		    session.setAttribute("member", (ThanhvienBean) tv);
		    isCorrect = "1";
		    return "redirect:home";
		} else {
		    isCorrect = "0";
		    model.addAttribute("usernameLogin", txtUsername);
		    model.addAttribute("passLogin", decodePass);
		}
	    }

	    model.addAttribute("isCorrect", isCorrect);
	    model.addAttribute("listProvinces", listProvinces);
	    model.addAttribute("listJobs", listJobs);
	    System.out.println("===== <AUTH /> =====");
	    return "account";

	} catch (

	Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return "account";
    }

    @RequestMapping(value = { "/profile/{memberId}", "/ho-so/{memberId}" }, method = RequestMethod.GET)
    public String getAProfile(@PathVariable("memberId") String memberId, Model model, HttpServletRequest request,
	    HttpServletRequest response) {
	System.out.println("===> memberId in profile: " + memberId);
	if (memberId == null || memberId.isEmpty() || memberId.isBlank())
	    return "redirect:home";
	String listProvinces[] = { "An Giang", "Bắc Giang", "Bắc Kạn", "Bạc Liêu", "Bắc Ninh", "Bà Rịa-Vũng Tàu",
		"Bến Tre", "Bình Định", "Bình Dương", "Bình Phước", "Bình Thuận", "Cà Mau", "Cao Bằng", "Đắk Lắk",
		"Đắc Nông", "Địện Biên", "Đồng Nai", "Đồng Tháp", "Gia Lai", "Hà Giang", "Hải Dương", "Hà Nam",
		"Hà Tây", "Hà Tĩnh", "Hậu Giang", "Hoà Bình", "Hưng Yên", "Khánh Hoà", "Kiên Giang", "Kon Tum",
		"Lai Châu", "Lâm Đông", "Lạng Sơn", "Lào Cai", "Long An", "Nam Định", "Nghệ An", "Ninh Bình",
		"Ninh Thuận", "Phú Thọ", "Phú Yên", "Quảng Bình", "Quảng Nam", "Quảng Ngãi", "Quảng Ninh", "Quảng Trị",
		"Sóc Trăng", "Sơn La", "Tây Ninh", "Thái Bình", "Thái Nguyên", "Thanh Hoá", "Thừa Thiên-Huế",
		"Tiền Giang", "Trà Vinh", "Tuyên Quang", "Vĩnh Long", "Vĩnh Phúc", "Yên Bái", "Cần Thơ", "Đà Nẵng",
		"Hải Phòng", "Hà Nội", "TP.Hồ Chí Minh" };
	String listJobs[] = { "giáo viên", "học sinh", "lập trình viên", "bác sĩ", "nghệ sĩ", "công nhân",
		"công chức - viên chức", "chưa có" };
	model.addAttribute("listProvinces", listProvinces);
	model.addAttribute("listJobs", listJobs);
	ThanhvienBean tvProfile = new ThanhvienBo().findByMemberId(memberId);
	model.addAttribute("tvProfile", tvProfile);
	return "profile";
    }

    @RequestMapping(value = { "/profile/{memberId}", "/ho-so/{memberId}" }, method = RequestMethod.POST)
    public String getProfile(@PathVariable("memberId") String memberId, Model model, HttpServletRequest request,
	    HttpServletRequest response) {
	try {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    if (memberLogged == null || memberId == null)
		return "redirect:account";

	    String txtFullname = request.getParameter("txtFullname");
	    String txtUsername = request.getParameter("txtUsername");
	    String txtEmail = request.getParameter("txtEmail");
	    String txtPhone = request.getParameter("txtPhone");
	    String txtAddress = request.getParameter("txtAddress");
	    String txtJob = request.getParameter("txtJob");
	    String txtAvatarUrl = request.getParameter("txtAvatarUrl");
	    String btnUpdateProfile = request.getParameter("btnUpdateProfile");

	    if (memberLogged.getMaThanhVien().equals(memberId) && btnUpdateProfile != null && txtFullname != null
		    && txtAddress != null && txtPhone != null && txtEmail != null && txtUsername != null
		    && txtJob != null && txtAvatarUrl != null) {
		ThanhvienBean tv = new ThanhvienBean(memberLogged.getMaThanhVien(), txtFullname, txtUsername, null,
			txtEmail, txtPhone, txtAddress, txtAvatarUrl, txtJob);
		int result = new ThanhvienBo().update(tv);
		if (result > 0) {
		    System.out.println("===> update member success");
		    memberLogged.setTenThanhVien(txtFullname);
		    memberLogged.setTenDangNhap(txtUsername);
		    memberLogged.setEmail(txtEmail);
		    memberLogged.setSoDienThoai(txtPhone);
		    memberLogged.setDiaChi(txtAddress);
		    memberLogged.setCongViec(txtJob);
		    memberLogged.setAnhDaiDien(txtAvatarUrl);
		    return getAProfile(memberId, model, request, response);
		} else {
		    System.out.println("===> update member failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

    @RequestMapping(value = { "/manage-myblog", "/quan-ly-bai-viet-ca-nhan" })
    public String manageMyblog(Model model, HttpServletRequest request, HttpServletRequest response) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";

	// Thùng rác
	List<BaivietBean> listPostsOfTrash = new BaivietBo().findAllInTrash(memberLogged.getMaThanhVien());
	model.addAttribute("listPostsOfTrash", listPostsOfTrash);

	// Bài viết đã được đánh dấu
	List<DanhdaubaivietBean> listBookmarks = new BaivietBo().findAllBookmarks(memberLogged.getMaThanhVien());
	model.addAttribute("listBookmarks", listBookmarks);
	// Nhận khoảng thời gian lưu
	List<String> timeSaveSinces = new ArrayList<String>();
	for (DanhdaubaivietBean dd : listBookmarks) {
	    timeSaveSinces.add(new Helpers().getTimeSince(dd.getThoiGianLuu().getTime()));
	}
	model.addAttribute("timeSaveSinces", timeSaveSinces);

	// Bài viết đã xuất bản
	List<BaivietBean> listPostsOfAuthor = new BaivietBo().findByAuthor(memberLogged.getMaThanhVien());
	model.addAttribute("listPostsOfAuthor", listPostsOfAuthor);
	return "manage-myblog";
    }
}