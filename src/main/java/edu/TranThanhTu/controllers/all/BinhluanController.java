package edu.TranThanhTu.controllers.all;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.TranThanhTu.models.bean.BinhluanBean;
import edu.TranThanhTu.models.bean.ThanhvienBean;
import edu.TranThanhTu.models.bo.implement.BinhluanBo;
import edu.TranThanhTu.utils.Helpers;

@Controller
public class BinhluanController {

    @RequestMapping(value = { "/add-comment", "/them-binh-luan" })
    public String addComment(Model model, HttpServletRequest request, HttpServletResponse response) {
	try {
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    if (memberLogged == null)
		return "redirect:home";
	    String txtCommentContent = request.getParameter("txtCommentContent");
	    String postId = request.getParameter("postId");
	    String btnAddComment = request.getParameter("btnAddComment");
	    if (btnAddComment != null && txtCommentContent != null && postId != null) {
		System.out.println("PostId In add-comment: " + postId);
		int result = new BinhluanBo().save(new BinhluanBean(new Helpers().createUUID("BL"), txtCommentContent,
			postId, memberLogged.getMaThanhVien(), memberLogged.getTenThanhVien(),
			memberLogged.getAnhDaiDien()));
		if (result > 0) {
		    System.out.println("===> add comment success");
		    return new BaivietController().getDetailPost(postId, model, request);
		} else {
		    System.out.println("===> add comment failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

    @RequestMapping(value = { "/edit-comment", "/cap-nhat-binh-luan" })
    public String editComment(Model model, HttpServletRequest request, HttpServletResponse response) {
	try {
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    if (memberLogged == null)
		return "redirect:home";
	    String txtCommentContent = request.getParameter("txtCommentContent");
	    String postId = request.getParameter("postId");
	    String btnEditCommentId = request.getParameter("btnEditCommentId");
	    if (btnEditCommentId != null && txtCommentContent != null && postId != null) {
		System.out.println("CommentId In edit-comment: " + btnEditCommentId);
		System.out.println("PostId In edit-comment: " + postId);
		int result = new BinhluanBo().update(new BinhluanBean(btnEditCommentId, txtCommentContent, postId,
			memberLogged.getMaThanhVien(), memberLogged.getTenThanhVien(), memberLogged.getAnhDaiDien()));
		if (result > 0) {
		    System.out.println("===> edit comment success");
		    return new BaivietController().getDetailPost(postId, model, request);
		} else {
		    System.out.println("===> edit comment failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

    @RequestMapping(value = { "/destroy-comment", "/huy-binh-luan" })
    public String destroyComment(Model model, HttpServletRequest request, HttpServletResponse response) {
	try {
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    if (memberLogged == null)
		return "redirect:home";
	    String commentId = request.getParameter("commentId");
	    String postId = request.getParameter("postId");
	    if (commentId != null) {
		System.out.println("CommentId In destroy-comment: " + commentId);
		System.out.println("PostId In destroy-comment: " + postId);
		int result = new BinhluanBo().destroy(commentId, postId);
		if (result > 0) {
		    System.out.println("===> edit comment success");
		    return new BaivietController().getDetailPost(postId, model, request);
		} else {
		    System.out.println("===> edit comment failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

    @RequestMapping(value = { "/report-comment", "/bao-cao-binh-luan" })
    public String reportComment(Model model, HttpServletRequest request, HttpServletResponse response) {
	try {
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    if (memberLogged == null)
		return "redirect:home";
	    String commentId = request.getParameter("commentId");
	    String postId = request.getParameter("postId");
	    if (commentId != null) {
		System.out.println("CommentId In report-comment: " + commentId);
		System.out.println("PostId In report-comment: " + postId);
		int result = new BinhluanBo().addReport(commentId, postId);
		if (result > 0) {
		    System.out.println("===> report comment success");
		    return new BaivietController().getDetailPost(postId, model, request);
		} else {
		    System.out.println("===> report comment failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

    @RequestMapping(value = { "/emote-comment", "/tha-hoac-huy-cam-xuc-binh-luan" })
    public String emoteComment(Model model, HttpServletRequest request, HttpServletResponse response) {
	try {
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    if (memberLogged == null)
		return "redirect:home";
	    String commentId = request.getParameter("commentId");
	    String postId = request.getParameter("postId");
	    if (commentId != null) {
		System.out.println("CommentId In emote-comment: " + commentId);
		System.out.println("PostId In emote-comment: " + postId);
		int result = new BinhluanBo().emoteComment(commentId, memberLogged.getMaThanhVien());
		if (result > 0) {
		    System.out.println("===> emote comment success");
		    return new BaivietController().getDetailPost(postId, model, request);
		} else {
		    System.out.println("===> emote comment failure");
		}
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }
}
