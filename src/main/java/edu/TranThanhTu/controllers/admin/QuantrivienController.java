package edu.TranThanhTu.controllers.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.TranThanhTu.models.bean.BaivietBean;
import edu.TranThanhTu.models.bean.BinhluanBean;
import edu.TranThanhTu.models.bean.ThanhvienBean;
import edu.TranThanhTu.models.bean.TheloaiBean;
import edu.TranThanhTu.models.bo.implement.BinhluanBo;
import edu.TranThanhTu.models.bo.implement.QuantrivienBo;
import edu.TranThanhTu.models.bo.implement.ThanhvienBo;
import edu.TranThanhTu.models.bo.implement.TheloaiBo;

@Controller
public class QuantrivienController {
    @RequestMapping(value = { "/admin", "/quan-tri-vien" })
    public String getAdmin(Model model, HttpServletRequest request, HttpServletRequest response) {
	try {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String tabAdmin = request.getParameter("tab_admin");
	    HttpSession session = request.getSession();
	    ThanhvienBean memberLogged = (ThanhvienBean) session.getAttribute("member");
	    if (memberLogged == null)
		return "redirect:account";
	    if (memberLogged != null && memberLogged.getQuyen() == 0)
		return "redirect:home";
	    String txtCategoryId = request.getParameter("txtCategoryId");
	    String txtCategoryName = request.getParameter("txtCategoryName");
	    String btnAddCategory = request.getParameter("btnAddCategory");
	    String btnEditCategory = request.getParameter("btnEditCategory");
	    String btnDestroyCategory = request.getParameter("btnDestroyCategory");

	    if (btnAddCategory != null && txtCategoryId != null && txtCategoryName != null) {
		int result = new QuantrivienBo().createCategory(new TheloaiBean(txtCategoryId, txtCategoryName));
		if (result > 0) {
		    System.out.println("===> create new category success");
		} else {
		    System.out.println("===> create new category failure");
		}
	    }

	    if (btnEditCategory != null && txtCategoryId != null && txtCategoryName != null) {
		int result = new QuantrivienBo().updateCategory(new TheloaiBean(txtCategoryId, txtCategoryName));
		if (result > 0) {
		    System.out.println("===> update category success");
		} else {
		    System.out.println("===> update category failure");
		}
	    }

	    if (btnDestroyCategory != null) {
		int result = new QuantrivienBo().destroyCategory(btnDestroyCategory);
		if (result > 0) {
		    System.out.println("===> destroy category success");
		} else {
		    System.out.println("===> destroy category failure");
		}
	    }
	    List<TheloaiBean> listCategories = new TheloaiBo().findAll();
	    if (tabAdmin == null) {
		model.addAttribute("listCategories", listCategories);
		return "admin";
	    }
	    if (tabAdmin != null) {
		System.out.println("===> tab_admin: " + tabAdmin);
		if (tabAdmin.equals("member")) {
		    String memberIdUpdate = request.getParameter("memberIdUpdate");
		    String memberIdDestroy = request.getParameter("memberIdDestroy");
		    if (memberIdUpdate != null) {
			int result = new QuantrivienBo().updateStatusMember(memberIdUpdate);
			if (result > 0) {
			    System.out.println("===> update status of member success");
			} else {
			    System.out.println("===> update status of member failure");
			}
		    }
		    if (memberIdDestroy != null) {
			int result = new QuantrivienBo().destroyMember(memberIdDestroy);
			if (result > 0) {
			    System.out.println("===> destroy member success");
			} else {
			    System.out.println("===> destroy member failure");
			}
		    }
		    List<ThanhvienBean> listMembers = new ThanhvienBo().findAll();
		    model.addAttribute("listMembers", listMembers);
		    return "admin";
		}
		if (tabAdmin.equals("post")) {
		    String postIdUpdate = request.getParameter("postIdUpdate");
		    String postIdDestroy = request.getParameter("postIdDestroy");
		    String authorId = request.getParameter("authorId");
		    if (postIdUpdate != null) {
			int result = new QuantrivienBo().updateStatusPost(postIdUpdate);
			if (result > 0) {
			    System.out.println("===> update status of post success");
			} else {
			    System.out.println("===> update status of post failure");
			}
		    }
		    if (postIdDestroy != null && authorId != null) {
			int result = new QuantrivienBo().destroyPost(postIdDestroy, authorId);
			if (result > 0) {
			    System.out.println("===> destroy post success");
			} else {
			    System.out.println("===> destroy post failure");
			}
		    }
		    List<BaivietBean> listPosts = new QuantrivienBo().findAllPostInAdmin();
		    model.addAttribute("listPosts", listPosts);
		    return "admin";
		}
		if (tabAdmin.equals("comment")) {
		    String commentIdUpdate = request.getParameter("commentIdUpdate");
		    String commentIdDestroy = request.getParameter("commentIdDestroy");
		    String postId = request.getParameter("postId");
		    if (commentIdUpdate != null) {
			int result = new QuantrivienBo().updateStatusComment(commentIdUpdate);
			if (result > 0) {
			    System.out.println("===> update status of comment success");
			} else {
			    System.out.println("===> update status of comment failure");
			}
		    }
		    if (commentIdDestroy != null && postId != null) {
			int result = new QuantrivienBo().destroyComment(commentIdDestroy, postId);
			if (result > 0) {
			    System.out.println("===> destroy comment success");
			} else {
			    System.out.println("===> destroy comment failure");
			}
		    }
		    List<BinhluanBean> listComments = new BinhluanBo().findAll();
		    model.addAttribute("listComments", listComments);
		    return "admin";
		}
		model.addAttribute("listCategories", listCategories);
		return "admin";
	    }
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return "admin";
    }
}
