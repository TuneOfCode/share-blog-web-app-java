package edu.TranThanhTu.models.dao;

import java.util.List;

import edu.TranThanhTu.models.bean.ThanhvienBean;

public interface IThanhvienDao extends ICobanDao<ThanhvienBean> {

    List<ThanhvienBean> findAll();

    ThanhvienBean findOne(String tenDangNhap);

    ThanhvienBean findByMemberId(String maThanhVien);

    ThanhvienBean isLogin(String tenDangNhap, String matKhau);

    int insertInfo(ThanhvienBean tv);

    int updateInfo(ThanhvienBean tv);

    int deleteInfo(ThanhvienBean tv);
}
