package edu.TranThanhTu.models.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import edu.TranThanhTu.models.bean.TheloaiBean;

public class TheloaiMapper implements IRowMapper<TheloaiBean> {

    @Override
    public TheloaiBean mapRow(ResultSet rs) {
	// TODO Auto-generated method stub
	try {
	    TheloaiBean tl = new TheloaiBean();
	    tl.setMaTheLoai(rs.getString("maTheLoai"));
	    tl.setTenTheLoai(rs.getString("tenTheLoai"));

	    return tl;
	} catch (SQLException e) {
	    // TODO: handle exception
	    e.printStackTrace();
	}
	return null;
    }

}
