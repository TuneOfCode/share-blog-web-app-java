package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;

import edu.TranThanhTu.models.bean.DanhdaubaivietBean;
import edu.TranThanhTu.utils.Helpers;

public class DanhdaubaivietMapper implements IRowMapper<DanhdaubaivietBean> {

    @Override
    public DanhdaubaivietBean mapRow(ResultSet rs) {
	// TODO Auto-generated method stub
	try {
	    DanhdaubaivietBean d = new DanhdaubaivietBean();
	    d.setMaBaiViet(rs.getString("maBaiViet"));
	    d.setTieuDe(rs.getString("tieuDe"));
	    d.setMaThanhVien(rs.getString("maThanhVien"));
	    d.setMaTacGia(rs.getString("maTacGia"));
	    d.setTenTacGia(rs.getString("tenTacGia"));
	    d.setLuuBaiViet(rs.getInt("luuBaiViet"));
	    d.setThoiGianLuu(rs.getTimestamp("thoiGianLuu"));
	    d.setThoiGianKeTu(new Helpers().getTimeSince(rs.getTimestamp("thoiGianLuu").getTime()));
	    return d;
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

}
