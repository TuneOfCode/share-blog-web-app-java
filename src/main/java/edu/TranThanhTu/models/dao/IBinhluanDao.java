package edu.TranThanhTu.models.dao;

import java.util.List;

import edu.TranThanhTu.models.bean.BinhluanBean;

public interface IBinhluanDao extends ICobanDao<BinhluanBean> {

    List<BinhluanBean> findByPostId(String maBaiViet);

    int save(BinhluanBean bl);

    int update(BinhluanBean bl);

    int destroy(String maBinhLuan, String maBaiViet);

    int addReport(String maBinhLuan, String maBaiViet);
}
