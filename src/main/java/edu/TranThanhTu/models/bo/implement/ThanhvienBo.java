package edu.TranThanhTu.models.bo.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.ThanhvienBean;
import edu.TranThanhTu.models.bo.IThanhvienBo;
import edu.TranThanhTu.models.dao.implement.ThanhvienDao;
import edu.TranThanhTu.utils.Helpers;

public class ThanhvienBo implements IThanhvienBo {

    @Override
    public List<ThanhvienBean> findAll() {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public ThanhvienBean findOne(String tenDangNhap) {
	// TODO Auto-generated method stub
	return new ThanhvienDao().findOne(tenDangNhap);
    }

    @Override
    public ThanhvienBean findByMemberId(String maThanhVien) {
	// TODO Auto-generated method stub
	return new ThanhvienDao().findByMemberId(maThanhVien);
    }

    @Override
    public ThanhvienBean login(String tenDangNhap, String matKhau) {
	// TODO Auto-generated method stub
	return new ThanhvienDao().isLogin(tenDangNhap, new Helpers().getMD5(matKhau));
    }

    @Override
    public int register(ThanhvienBean tv) {
	// TODO Auto-generated method stub
	tv.setMaThanhVien(new Helpers().createUUID(tv.getMaThanhVien()));
	tv.setMatKhau(new Helpers().getMD5(tv.getMatKhau()));
	return new ThanhvienDao().insertInfo(tv);
    }

    @Override
    public int update(ThanhvienBean tv) {
	// TODO Auto-generated method stub
	return new ThanhvienDao().updateInfo(tv);
    }

    @Override
    public void destroy(String maThanhVien) {
	// TODO Auto-generated method stub

    }

    @Override
    public List<ThanhvienBean> findAllPaginate() {
	// TODO Auto-generated method stub
	return null;
    }
}
