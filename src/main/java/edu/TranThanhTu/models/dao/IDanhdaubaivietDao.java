package edu.TranThanhTu.models.dao;

import java.util.List;

import edu.TranThanhTu.models.bean.DanhdaubaivietBean;

public interface IDanhdaubaivietDao {
    List<DanhdaubaivietBean> findAllBookmarks(String nguoiDanhDau);

    int addBookmark(String maBaiViet, String nguoiDanhDau);

    int removeBookmark(String maBaiViet, String nguoiDanhDau);
}
