package edu.TranThanhTu.models.dao;

import edu.TranThanhTu.models.bean.CamxucbaivietBean;

public interface ICamxucbaivietDao extends ICobanDao<CamxucbaivietBean> {
    int countEmotionByPostId(String maBaiViet);

    int emotePost(String maBaiViet, String nguoiThaCamXuc);

    int checkEmoted(String maBaiViet, String nguoiThaCamXuc);
}
