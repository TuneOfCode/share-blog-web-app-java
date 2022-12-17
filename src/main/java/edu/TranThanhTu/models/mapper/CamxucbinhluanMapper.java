package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;

import edu.TranThanhTu.models.bean.CamxucbinhluanBean;

public class CamxucbinhluanMapper implements IRowMapper<CamxucbinhluanBean> {

    @Override
    public CamxucbinhluanBean mapRow(ResultSet rs) {
	// TODO Auto-generated method stub
	try {
	    CamxucbinhluanBean c = new CamxucbinhluanBean();
	    c.setMaThanhVien(rs.getString("maThanhVien"));
	    c.setMaBinhLuan(rs.getString("maBinhLuan"));
	    c.setTimBinhLuan(rs.getInt("soLuotCamXuc"));
	    c.setSoLuotBinhLuan(rs.getInt("soLuotBinhLuan"));
	    return c;
	} catch (Exception e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

}
