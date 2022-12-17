package edu.TranThanhTu.models.bo;

import java.util.List;

import edu.TranThanhTu.models.bean.ThanhvienBean;

public interface IThanhvienBo {
    List<ThanhvienBean> findAll();

    ThanhvienBean findOne(String tenDangNhap);

    ThanhvienBean findByMemberId(String maThanhVien);

    ThanhvienBean login(String tenDangNhap, String matKhau);

    int register(ThanhvienBean tv);

    int update(ThanhvienBean tv);

    void destroy(String maThanhVien);

    List<ThanhvienBean> findAllPaginate();

}
