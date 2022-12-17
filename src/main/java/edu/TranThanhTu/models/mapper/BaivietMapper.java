package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import edu.TranThanhTu.models.bean.BaivietBean;

public class BaivietMapper implements IRowMapper<BaivietBean> {

    @Override
    public BaivietBean mapRow(ResultSet rs) {
	// TODO Auto-generated method stub
	try {
	    BaivietBean b = new BaivietBean();
	    b.setMaBaiViet(rs.getString("maBaiViet"));
	    b.setTieuDe(rs.getString("tieuDe"));
	    b.setNoiDung(rs.getString("noiDung"));
	    b.setTheLoai(rs.getString("theLoai"));
	    b.setAnhNen(rs.getString("anhNen"));
	    b.setNgayXuatBan(rs.getTimestamp("ngayXuatBan"));
	    b.setTacGia(rs.getString("tacGia"));
	    b.setLuotBaoCao(rs.getInt("luotBaoCao"));
	    b.setTrangThaiBaiViet(rs.getInt("trangThaiBaiViet"));
	    b.setAnhDaiDien(rs.getString("anhDaiDien"));
	    b.setTenTacGia(rs.getString("tenTacGia"));
	    b.setTenTheLoai(rs.getString("tenTheLoai"));
	    b.setTichQuanTriVien(rs.getInt("tichQuanTriVien"));
	    return b;
	} catch (SQLException e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }
}
