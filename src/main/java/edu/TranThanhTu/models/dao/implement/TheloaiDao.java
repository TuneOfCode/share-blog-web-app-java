package edu.TranThanhTu.models.dao.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.TheloaiBean;
import edu.TranThanhTu.models.dao.ITheloaiDao;
import edu.TranThanhTu.models.mapper.TheloaiMapper;

public class TheloaiDao extends CobanDao<TheloaiBean> implements ITheloaiDao {

    @Override
    public List<TheloaiBean> findAll() {
	// TODO Auto-generated method stub
	String sql = "SELECT * FROM TheLoai";
	return select(sql, new TheloaiMapper());
    }

    @Override
    public TheloaiBean findById(String maTheLoai) {
	// TODO Auto-generated method stub
	return null;
    }

    @Override
    public int save(TheloaiBean tl) {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int update(TheloaiBean tl) {
	// TODO Auto-generated method stub
	return 0;
    }

    @Override
    public int delete(TheloaiBean tl) {
	// TODO Auto-generated method stub
	return 0;
    }

}
