package edu.TranThanhTu.models.bo;

import java.util.List;

import edu.TranThanhTu.models.bean.BinhluanBean;

public interface IBinhluanBo {
    List<BinhluanBean> findByPostId(String maBaiViet);

    int save(BinhluanBean bl);

    int update(BinhluanBean bl);

    int destroy(String maBinhLuan, String maBaiViet);

    int addReport(String maBinhLuan, String maBaiViet);

    int countEmotionByCommentId(String maBinhLuan);

    public int emoteComment(String maBinhLuan, String nguoiThaCamXuc);

    public int checkEmoted(String maBinhLuan, String nguoiThaCamXuc);
}
