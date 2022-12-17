package edu.TranThanhTu.models.bo;

import java.util.List;

import edu.TranThanhTu.models.bean.BaivietBean;
import edu.TranThanhTu.models.bean.DanhdaubaivietBean;

public interface IBaivietBo {
    List<BaivietBean> findAll();

    List<BaivietBean> findAllTrending();

    List<BaivietBean> findAllAndPaginate(String page, String limit);

    List<BaivietBean> filter(String keyword);

    List<BaivietBean> search(String keyword);

    List<BaivietBean> findByAuthor(String tacGia);

    List<BaivietBean> findAllInTrash(String tacGia);

    List<DanhdaubaivietBean> findAllBookmarks(String nguoiDanhDau);

    BaivietBean findOne(String maBaiViet);

    int getTotalPagesOfPost(int offset);

    int save(BaivietBean b);

    int update(BaivietBean b);

    int softDestroy(BaivietBean b);

    int restore(String maBaiViet, String tacGia);

    int destroy(BaivietBean b);

    int addReport(String maBaiViet);

    int addBookmark(String maBaiViet, String nguoiDanhDau);

    int removeBookmark(String maBaiViet, String nguoiDanhDau);

    int emotePost(String maBaiViet, String nguoiThaCamXuc);

    int checkEmoted(String maBaiViet, String nguoiThaCamXuc);

    int countEmotionByPostId(String maBaiViet);

    int countCommentByPostId(String maBaiViet);
}
