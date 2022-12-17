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
import edu.TranThanhTu.models.bean.BinhluanBean;
import edu.TranThanhTu.models.bean.DanhdaubaivietBean;
import edu.TranThanhTu.models.bean.ThanhvienBean;
import edu.TranThanhTu.models.bean.TheloaiBean;
import edu.TranThanhTu.models.bo.implement.BaivietBo;
import edu.TranThanhTu.models.bo.implement.BinhluanBo;
import edu.TranThanhTu.models.bo.implement.ThanhvienBo;
import edu.TranThanhTu.models.bo.implement.TheloaiBo;
import edu.TranThanhTu.models.dao.implement.CamxucbaivietDao;
import edu.TranThanhTu.models.dao.implement.DanhdaubaivietDao;
import edu.TranThanhTu.utils.Helpers;
import edu.TranThanhTu.utils.Pagination;

@Controller
public class BaivietController {
    @RequestMapping(value = { "/home", "/trang-chu", "/" })
    public String getHome(Model model, HttpServletRequest request, HttpServletRequest response) {
	try {
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String filter = request.getParameter("filter");
	    String search = request.getParameter("search");
	    List<TheloaiBean> listCategories = new TheloaiBo().findAll();
	    model.addAttribute("listCategories", listCategories);
	    String type = request.getParameter("type");
	    // Xử lý đăng xuất
	    if (type != null && type.equals("logout")) {
		System.out.println("===> click " + type);
		session.removeAttribute("member");
	    }

	    // lấy ra tất cả bài viết được người đang đăng nhập lưu
	    if (memberLogged != null) {
		List<DanhdaubaivietBean> listBookmarks = new BaivietBo()
			.findAllBookmarks(memberLogged.getMaThanhVien());
		model.addAttribute("listBookmarks", listBookmarks);
	    }

	    // xử lý phân trang
	    String page = request.getParameter("page");
	    String limit = request.getParameter("limit");
	    List<BaivietBean> listPosts = null;

	    if (filter != null && search == null) {
		if (filter.isEmpty()) {
		    listPosts = new BaivietBo().findAll();
		} else {
		    listPosts = new BaivietBo().filter(filter);
		}
	    } else if (filter == null && search != null) {
		if (search.isEmpty()) {
		    listPosts = new BaivietBo().findAll();
		} else {
		    listPosts = new BaivietBo().search(search);
		}
	    } else if (filter != null && search != null) {
		if (!filter.isEmpty() && search.isEmpty()) {
		    listPosts = new BaivietBo().filter(filter);
		} else if (filter.isEmpty() && !search.isEmpty()) {
		    listPosts = new BaivietBo().search(search);
		} else {
		    listPosts = new BaivietBo().findAll();
		}
	    } else {
		listPosts = new BaivietBo().findAll();
	    }

	    // lấy ra tất cả bài đăng
	    int pageRequest = page != null ? Integer.parseInt(page) : 1;
	    int offset = limit != null ? Integer.parseInt(limit) : 5;
	    int totalPages = new Pagination<BaivietBean>().getTotalPages(listPosts, offset);
	    if (listPosts.size() > 0 && totalPages == 0) {
		totalPages += 1;
	    }
	    int totalRows = listPosts.size();
//	    System.out.println("===> size: " + listPosts.size());
//	    System.out.println("===> offset: " + offset);
//	    System.out.println("===> totalPages: " + totalPages);
	    model.addAttribute("totalRows", totalRows);
	    listPosts = new Pagination<BaivietBean>().paginate(pageRequest, offset, listPosts);

	    // tính thời điểm kể từ khi xuất bản đến hiện tại
	    for (BaivietBean bv : listPosts) {
		bv.setThoiGianKeTu(new Helpers().getTimeSince(bv.getNgayXuatBan().getTime()));
	    }
	    model.addAttribute("listPosts", listPosts);

	    List<Integer> listPageNum = new ArrayList<Integer>();
	    for (int i = 1; i <= totalPages; i++)
		listPageNum.add(i);
	    model.addAttribute("listPageNum", listPageNum);

	    // lấy ra 3 bài viết nổi bật dựa vào số lượt cảm xúc
	    List<BaivietBean> threePostTrending = new BaivietBo().findAllTrending();
	    for (BaivietBean bv : threePostTrending) {
		bv.setSoLuotCamXuc(new BaivietBo().countEmotionByPostId(bv.getMaBaiViet()));
	    }
	    model.addAttribute("threePostTrending", threePostTrending);

	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return "home";
    }

    @RequestMapping(value = { "/detail/{postId}" })
    public String getDetailPost(@PathVariable("postId") String postId, Model model, HttpServletRequest request) {
	if (postId == null) {
	    return "redirect:home";
	}
	// hiển thị chi tiết 1 bài viết
	System.out.println("===> PostID In detail-blog[GET]: " + postId);

	// lấy ra số lượt cảm xúc
	BaivietBean post = new BaivietBo().findOne(postId);
	post.setSoLuotCamXuc(new BaivietBo().countEmotionByPostId(postId));

	// lấy ra số lượt bình luận
	post.setSoLuotBinhLuan(new BaivietBo().countCommentByPostId(postId));
	model.addAttribute("post", post);

	// hiển thị số lượt cảm xúc của 1 bài viết
//	int countEmotionByPostId = new CamxucbaivietDao().countEmotionByPostId(postId);
//	model.addAttribute("countEmotionByPostId", countEmotionByPostId);

	// lấy ra tất cả bình luận của postId
	List<BinhluanBean> listComments = new BinhluanBo().findByPostId(postId);

	// kiểm tra xem người dùng hiện tại đã thả cảm xúc cho bài viết hay chưa
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged != null) {
	    int isCheckEmoteByPosId = new CamxucbaivietDao().checkEmoted(postId, memberLogged.getMaThanhVien());
	    System.out.println("isCheckEmoteByPosId: " + isCheckEmoteByPosId);
	    model.addAttribute("isCheckEmoteByPosId", isCheckEmoteByPosId);
	    // tính số lượt cảm xúc của từng bình luận
	    for (BinhluanBean bl : listComments) {
		bl.setNguoiDaThaCamXuc(new BinhluanBo().checkEmoted(bl.getMaBinhLuan(), memberLogged.getMaThanhVien()));
	    }
	}

	// tính thời điểm kể từ khi xuất bản đến hiện tại
	// tính số lượt cảm xúc của từng bình luận
	for (BinhluanBean bl : listComments) {
	    bl.setThoiGianKeTu(new Helpers().getTimeSince(bl.getNgayTao().getTime()));
	    bl.setSoLuotCamXuc(new BinhluanBo().countEmotionByCommentId(bl.getMaBinhLuan()));
	}
	model.addAttribute("listComments", listComments);

	return "detail";
    }

    @RequestMapping(value = { "/write-blog", "/viet-bai" })
    public String setPost(Model model, HttpServletRequest request, HttpServletRequest response) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	List<TheloaiBean> listCategories = new TheloaiBo().findAll();
	model.addAttribute("listCategories", listCategories);
	if (memberLogged == null)
	    return "redirect:account";
	try {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String txtBlogTitle = request.getParameter("txtBlogTitle");
	    String txtBlogContent = request.getParameter("txtBlogContent");
	    String txtBlogBackground = request.getParameter("txtBlogBackground");
	    String txtBlogHashtag = request.getParameter("txtBlogHashtag");
	    String btnAddPost = request.getParameter("btnAddPost");

	    // viết bài
	    if (btnAddPost != null && txtBlogTitle != null && txtBlogContent != null && txtBlogBackground != null
		    && txtBlogHashtag != null) {
		int result = new BaivietBo().save(new BaivietBean("BV", txtBlogTitle, txtBlogContent, txtBlogHashtag,
			txtBlogBackground, memberLogged.getMaThanhVien()));
		if (result > 0) {
		    System.out.println("===> write blog success");
		    memberLogged.setSoBaiViet(new ThanhvienBo().findOne(memberLogged.getTenDangNhap()).getSoBaiViet());
		    return "redirect:home";
		} else {
		    System.out.println("===> write blog failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return "write-blog";
    }

    @RequestMapping(value = { "/report-blog", "/bao-cao-bai" })
    public String reportPost(HttpServletRequest request) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";
	String postId = request.getParameter("postId");
	if (postId != null) {
	    // báo cáo bài viết
	    System.out.println("===> PostID In delete-blog: " + postId);
	    int result = new BaivietBo().addReport(postId);
	    if (result > 0) {
		System.out.println("===> report blog success");
	    } else {
		System.out.println("===> report delete blog failure");
	    }
	}
	return "redirect:home";
    }

    @RequestMapping(value = { "/edit-blog", "/sua-bai" }, method = RequestMethod.GET)
    public String getEditPost(Model model, HttpServletRequest request, HttpServletRequest response) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	String postId = request.getParameter("postId");
	if (postId == null)
	    return "redirect:home";
	if (memberLogged == null)
	    return "redirect:account";
	List<TheloaiBean> listCategories = new TheloaiBo().findAll();
	model.addAttribute("listCategories", listCategories);
	BaivietBean post = new BaivietBo().findOne(postId);
	model.addAttribute("post", post);
	session.setAttribute("editPostId", (String) postId);
	System.out.println("===> PostID In edit-blog[GET]: " + postId);
	return "edit-blog";
    }

    @RequestMapping(value = { "/edit-blog", "/sua-bai" }, method = RequestMethod.POST)
    public String setEditPost(Model model, HttpServletRequest request, HttpServletRequest response) {
	try {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");

	    String txtBlogTitle = request.getParameter("txtBlogTitle");
	    String txtBlogContent = request.getParameter("txtBlogContent");
	    String txtBlogBackground = request.getParameter("txtBlogBackground");
	    String txtBlogHashtag = request.getParameter("txtBlogHashtag");
	    String btnEditPost = request.getParameter("btnEditPost");

	    // sửa bài viết
	    String postId = (String) session.getAttribute("editPostId");
	    if (btnEditPost != null && txtBlogTitle != null && txtBlogContent != null && txtBlogBackground != null
		    && txtBlogHashtag != null && postId != null) {
		System.out.println("===> PostID In edit-blog[POST]: " + postId);
		int result = new BaivietBo().update(new BaivietBean(postId, txtBlogTitle, txtBlogContent,
			txtBlogHashtag, txtBlogBackground, memberLogged.getMaThanhVien()));
		if (result > 0) {
		    System.out.println("===> edit blog success");
		    session.removeAttribute("editPostId");
		    memberLogged.setSoBaiViet(new ThanhvienBo().findOne(memberLogged.getTenDangNhap()).getSoBaiViet());
		    return "redirect:home";
		} else {
		    System.out.println("===> edit blog failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return "edit-blog";
    }

    @RequestMapping(value = { "/move-trash", "/bo-vao-thung-rac" })
    public String moveTrash(HttpServletRequest request) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";
	String postId = request.getParameter("postId");
	if (postId != null) {
	    // bỏ bài viết vào thùng rác
	    System.out.println("===> PostID In move-trash: " + postId);
	    BaivietBean b = new BaivietBean();
	    b.setMaBaiViet(postId);
	    b.setTacGia(memberLogged.getMaThanhVien());
	    System.out.println("===> Author: " + b.getTacGia());
	    int result = new BaivietBo().softDestroy(b);
	    if (result > 0) {
		System.out.println("===> soft delete blog success");
		return "redirect:manage-myblog?tab=trash";
	    } else {
		System.out.println("===> soft delete blog failure");
	    }
	}
	return "redirect:home";
    }

    @RequestMapping(value = { "/restore", "/khoi-phuc" })
    public String restorePost(HttpServletRequest request) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";
	String postId = request.getParameter("postId");
	if (postId != null) {
	    // khôi phuc bài viết từ thùng rác
	    System.out.println("===> PostID In restore-blog: " + postId);
	    System.out.println("===> Author: " + memberLogged.getMaThanhVien());
	    int result = new BaivietBo().restore(postId, memberLogged.getMaThanhVien());
	    if (result > 0) {
		System.out.println("===> restore blog success");
		return "redirect:manage-myblog?tab=trash";
	    } else {
		System.out.println("===> restore blog failure");
	    }
	}
	return "redirect:home";
    }

    @RequestMapping(value = { "/delete-blog", "/xoa-bai" })
    public String removePost(HttpServletRequest request) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";
	String postId = request.getParameter("postId");
	if (postId != null) {
	    // xoá vĩnh bài viết từ thùng rác
	    System.out.println("===> PostID In delete-blog: " + postId);
	    BaivietBean b = new BaivietBean();
	    b.setMaBaiViet(postId);
	    b.setTacGia(memberLogged.getMaThanhVien());
	    System.out.println("===> Author: " + b.getTacGia());
	    int result = new BaivietBo().destroy(b);
	    if (result > 0) {
		System.out.println("===> forever delete blog success");
		return "redirect:manage-myblog?tab=trash";
	    } else {
		System.out.println("===> forever delete blog failure");
	    }
	}
	return "redirect:home";
    }

    @RequestMapping(value = { "/add-bookmark", "/xoa-muc-da-luu" })
    public String addBookmark(Model model, HttpServletRequest request, HttpServletRequest response) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";
	String postId = request.getParameter("postId");
	if (postId != null) {
	    // khôi phuc bài viết từ thùng rác
	    System.out.println("===> PostID In add-bookmark: " + postId);
	    System.out.println("===> Author: " + memberLogged.getMaThanhVien());
	    int result = new DanhdaubaivietDao().addBookmark(postId, memberLogged.getMaThanhVien());
	    if (result > 0) {
		System.out.println("===> add bookmark success");
//		return getHome(model, request, response);
//		return "redirect:manage-myblog?tab=bookmark";
	    } else {
		System.out.println("===> add bookmark failure");
	    }
	}
	return "redirect:home";
    }

    @RequestMapping(value = { "/remove-bookmark", "/xoa-muc-da-luu" })
    public String removeBookmark(HttpServletRequest request) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";
	String postId = request.getParameter("postId");
	if (postId != null) {
	    // khôi phuc bài viết từ thùng rác
	    System.out.println("===> PostID In remove-bookmark: " + postId);
	    System.out.println("===> Author: " + memberLogged.getMaThanhVien());
	    int result = new DanhdaubaivietDao().removeBookmark(postId, memberLogged.getMaThanhVien());
	    if (result > 0) {
		System.out.println("===> remove bookmark success");
		return "redirect:manage-myblog?tab=bookmark";
	    } else {
		System.out.println("===> remove bookmark failure");
	    }
	}
	return "redirect:home";
    }

    @RequestMapping(value = { "/emote-blog", "/tha-cam-xuc-bai-viet" })
    public String emotePost(Model model, HttpServletRequest request) {
	HttpSession session = request.getSession();
	ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	if (memberLogged == null)
	    return "redirect:account";
	String postId = request.getParameter("postId");
	if (postId != null) {
	    // khôi phuc bài viết từ thùng rác
	    System.out.println("===> PostID In emote-blog: " + postId);
	    System.out.println("===> Author: " + memberLogged.getMaThanhVien());
	    int result = new CamxucbaivietDao().emotePost(postId, memberLogged.getMaThanhVien());
	    if (result > 0) {
		System.out.println("===> emote blog success");
		return getDetailPost(postId, model, request);
	    } else {
		System.out.println("===> emote blog failure");
	    }
	}
	return "redirect:home";
    }
}
