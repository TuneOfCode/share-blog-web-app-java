package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;

import edu.TranThanhTu.models.bean.CamxucbaivietBean;

public class CamxucbaivietMapper implements IRowMapper<CamxucbaivietBean> {

    @Override
    public CamxucbaivietBean mapRow(ResultSet rs) {
	// TODO Auto-generated method stub
	try {
	    CamxucbaivietBean c = new CamxucbaivietBean();
	    c.setMaBaiViet(rs.getString("maBaiViet"));
	    c.setMaThanhVien(rs.getString("maThanhVien"));
	    c.setTimBaiViet(rs.getInt("soLuotCamXuc"));
	    return c;
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

}
