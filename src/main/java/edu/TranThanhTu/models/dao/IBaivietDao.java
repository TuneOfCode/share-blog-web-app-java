package edu.TranThanhTu.models.dao;

import java.util.List;

import edu.TranThanhTu.models.bean.BaivietBean;

public interface IBaivietDao extends ICobanDao<BaivietBean> {
    List<BaivietBean> findAll();

    List<BaivietBean> findAllInAdmin();

    BaivietBean findOne(String maBaiViet);

    List<BaivietBean> findByAuthor(String tacGia);

    List<BaivietBean> findAllInTrash(String tacGia);

    List<BaivietBean> findAllTrending();

    int save(BaivietBean b);

    int update(BaivietBean b);

    int softDelete(String maBaiViet, String tacGia);

    int restore(String maBaiViet, String tacGia);

    int delete(String maBaiViet, String tacGia);

    int addReport(String maBaiViet);

    int updateStatus(String maBaiViet);
}
