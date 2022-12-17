package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import edu.TranThanhTu.models.bean.ThanhvienBean;

public class ThanhvienMapper implements IRowMapper<ThanhvienBean> {

    @Override
    public ThanhvienBean mapRow(ResultSet rs) {
	// TODO Auto-generated method stub
	try {
	    ThanhvienBean tv = new ThanhvienBean();
	    tv.setMaThanhVien(rs.getString("maThanhVien"));
	    tv.setTenThanhVien(rs.getString("tenThanhVien"));
	    tv.setTenDangNhap(rs.getString("tenDangNhap"));
	    tv.setMatKhau(rs.getString("matKhau"));
	    tv.setEmail(rs.getString("email"));
	    tv.setSoDienThoai(rs.getString("soDienThoai"));
	    tv.setDiaChi(rs.getString("diaChi"));
	    tv.setAnhDaiDien(rs.getString("anhDaiDien"));
	    tv.setCongViec(rs.getString("congViec"));
	    tv.setSoBaiViet(rs.getInt("soBaiViet"));
	    tv.setTrangThai(rs.getInt("trangThai"));
	    tv.setQuyen(rs.getInt("quyen"));
	    return tv;
	} catch (SQLException e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

}
