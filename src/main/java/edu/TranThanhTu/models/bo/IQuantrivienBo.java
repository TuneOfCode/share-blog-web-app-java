package edu.TranThanhTu.models.bo;

import java.util.List;

import edu.TranThanhTu.models.bean.BaivietBean;
import edu.TranThanhTu.models.bean.TheloaiBean;

public interface IQuantrivienBo {
    List<BaivietBean> findAllPostInAdmin();

    int createCategory(TheloaiBean tl);

    int updateCategory(TheloaiBean tl);

    int destroyCategory(String maTheLoai);

    int updateStatusMember(String maThanhVien);

    int updateStatusPost(String maBaiViet);

    int updateStatusComment(String maBinhLuan);

    int destroyMember(String maThanhVien);

    int destroyPost(String maBaiViet, String tacGia);

    int destroyComment(String maBinhLuan, String maBaiViet);
}
