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
    public int save(TheloaiBean tl) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_create_category ?, ?";
	return insert(sql, tl.getMaTheLoai(), tl.getTenTheLoai());
    }

    @Override
    public int update(TheloaiBean tl) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_update_category ?, ?";
	return update(sql, tl.getTenTheLoai(), tl.getMaTheLoai());
    }

    @Override
    public int delete(String maTheLoai) {
	// TODO Auto-generated method stub
	String sql = "DELETE FROM TheLoai WHERE maTheLoai = ?";
	return execute(sql, maTheLoai);
    }

}
