package edu.TranThanhTu.models.dao;

import edu.TranThanhTu.models.bean.CamxucbinhluanBean;

public interface ICamxucbinhluanDao extends ICobanDao<CamxucbinhluanBean> {
    int countEmotionByCommentId(String maBinhLuan);

    int countCommentByPostId(String maBaiViet);

    int emoteComment(String maBinhLuan, String nguoiThaCamXuc);

    int checkEmoted(String maBinhLuan, String nguoiThaCamXuc);
}
