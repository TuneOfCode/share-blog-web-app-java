package edu.TranThanhTu.models.bo.implement;

import java.util.ArrayList;
import java.util.List;

import edu.TranThanhTu.models.bean.BaivietBean;
import edu.TranThanhTu.models.bean.DanhdaubaivietBean;
import edu.TranThanhTu.models.bo.IBaivietBo;
import edu.TranThanhTu.models.dao.implement.BaivietDao;
import edu.TranThanhTu.models.dao.implement.CamxucbaivietDao;
import edu.TranThanhTu.models.dao.implement.CamxucbinhluanDao;
import edu.TranThanhTu.models.dao.implement.DanhdaubaivietDao;
import edu.TranThanhTu.utils.Helpers;
import edu.TranThanhTu.utils.Pagination;

public class BaivietBo implements IBaivietBo {
    @Override
    public List<BaivietBean> findAll() {
	// TODO Auto-generated method stub
	List<BaivietBean> listPosts = new BaivietDao().findAll();
	for (BaivietBean b : listPosts) {
	    int soLuotCamXuc = new CamxucbaivietDao().countEmotionByPostId(b.getMaBaiViet());
	    b.setSoLuotCamXuc(soLuotCamXuc);
	}
	return listPosts;
    }

    @Override
    public List<BaivietBean> findAllTrending() {
	// TODO Auto-generated method stub
	return new BaivietDao().findAllTrending();
    }

    @Override
    public List<BaivietBean> findAllAndPaginate(String page, String limit) {
	// TODO Auto-generated method stub
	int pageRequest = 1;
	int limitRequest = 5;
	if (page != null && limit != null) {
	    pageRequest = Integer.parseInt(page);
	    limitRequest = Integer.parseInt(limit);
	}
	List<BaivietBean> listPostsAndPagination = new Pagination<BaivietBean>().paginate(pageRequest, limitRequest,
		this.findAll());
	return listPostsAndPagination;
    }

    @Override
    public int getTotalPagesOfPost(int offset) {
	// TODO Auto-generated method stub
	return new Pagination<BaivietBean>().getTotalPages(this.findAll(), offset);
    }

    @Override
    public int save(BaivietBean b) {
	// TODO Auto-generated method stub
	b.setMaBaiViet(new Helpers().createUUID(b.getMaBaiViet()));
	return new BaivietDao().save(b);
    }

    @Override
    public int update(BaivietBean b) {
	// TODO Auto-generated method stub
	return new BaivietDao().update(b);
    }

    @Override
    public int destroy(BaivietBean b) {
	// TODO Auto-generated method stub
	return new BaivietDao().delete(b.getMaBaiViet(), b.getTacGia());
    }

    @Override
    public int softDestroy(BaivietBean b) {
	// TODO Auto-generated method stub
	return new BaivietDao().softDelete(b.getMaBaiViet(), b.getTacGia());
    }

    @Override
    public int restore(String maBaiViet, String tacGia) {
	// TODO Auto-generated method stub
	return new BaivietDao().restore(maBaiViet, tacGia);
    }

    @Override
    public BaivietBean findOne(String maBaiViet) {
	// TODO Auto-generated method stub
	return new BaivietDao().findOne(maBaiViet);
    }

    @Override
    public int addReport(String maBaiViet) {
	// TODO Auto-generated method stub
	return new BaivietDao().addReport(maBaiViet);
    }

    @Override
    public List<BaivietBean> filter(String keyword) {
	// TODO Auto-generated method stub
//	List<BaivietBean> listPosts = findAllAndPaginate(page, limit);
	List<BaivietBean> listPosts = findAll();
	List<BaivietBean> listPostsFiltered = new ArrayList<BaivietBean>();
	for (BaivietBean b : listPosts) {
	    if (b.getTheLoai().equals(keyword)) {
		listPostsFiltered.add(b);
	    }
	}
	return listPostsFiltered;
    }

    @Override
    public List<BaivietBean> search(String keyword) {
	// TODO Auto-generated method stub
	List<BaivietBean> listPosts = findAll();
	List<BaivietBean> listPostsSearched = new ArrayList<BaivietBean>();
	String keywordFormated = keyword.toLowerCase().trim();
	for (BaivietBean b : listPosts) {
	    if (b.getTieuDe().toLowerCase().contains(keywordFormated)
		    || b.getNoiDung().toLowerCase().contains(keywordFormated)) {
		listPostsSearched.add(b);
	    }
	}
	return listPostsSearched;
    }

    @Override
    public List<BaivietBean> findByAuthor(String tacGia) {
	// TODO Auto-generated method stub
	return new BaivietDao().findByAuthor(tacGia);
    }

    @Override
    public List<BaivietBean> findAllInTrash(String tacGia) {
	// TODO Auto-generated method stub
	return new BaivietDao().findAllInTrash(tacGia);
    }

    @Override
    public List<DanhdaubaivietBean> findAllBookmarks(String nguoiDanhDau) {
	// TODO Auto-generated method stub
	return new DanhdaubaivietDao().findAllBookmarks(nguoiDanhDau);
    }

    @Override
    public int addBookmark(String maBaiViet, String nguoiDanhDau) {
	// TODO Auto-generated method stub
	return new DanhdaubaivietDao().addBookmark(maBaiViet, nguoiDanhDau);
    }

    @Override
    public int removeBookmark(String maBaiViet, String nguoiDanhDau) {
	// TODO Auto-generated method stub
	return new DanhdaubaivietDao().removeBookmark(maBaiViet, nguoiDanhDau);
    }

    @Override
    public int emotePost(String maBaiViet, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	return new CamxucbaivietDao().emotePost(maBaiViet, nguoiThaCamXuc);
    }

    @Override
    public int checkEmoted(String maBaiViet, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	return new CamxucbaivietDao().checkEmoted(maBaiViet, nguoiThaCamXuc);
    }

    @Override
    public int countEmotionByPostId(String maBaiViet) {
	// TODO Auto-generated method stub
	return new CamxucbaivietDao().countEmotionByPostId(maBaiViet);
    }

    @Override
    public int countCommentByPostId(String maBaiViet) {
	// TODO Auto-generated method stub
	return new CamxucbinhluanDao().countCommentByPostId(maBaiViet);
    }
}
