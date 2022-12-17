package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import edu.TranThanhTu.models.bean.BinhluanBean;

public class BinhluanMapper implements IRowMapper<BinhluanBean> {

    @Override
    public BinhluanBean mapRow(ResultSet rs) {
	// TODO Auto-generated method stub
	try {
	    BinhluanBean bl = new BinhluanBean();
	    bl.setMaBinhLuan(rs.getString("maBinhLuan"));
	    bl.setNoiDung(rs.getString("noiDung"));
	    bl.setNgayTao(rs.getTimestamp("ngayTao"));
	    bl.setLuotBaoCao(rs.getInt("luotBaoCao"));
	    bl.setTrangThaiBinhLuan(rs.getInt("trangThaiBinhLuan"));
	    bl.setMaBaiViet(rs.getString("maBaiViet"));
	    bl.setNguoiTao(rs.getString("nguoiTao"));
	    bl.setTenNguoiTao(rs.getString("tenNguoiTao"));
	    bl.setAnhDaiDien(rs.getString("anhDaiDien"));
	    bl.setTichQuanTriVien(rs.getInt("tichQuanTriVien"));
	    return bl;
	} catch (SQLException e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

}
