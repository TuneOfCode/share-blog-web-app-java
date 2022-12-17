package edu.TranThanhTu.models.bo.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.TheloaiBean;
import edu.TranThanhTu.models.bo.ITheloaiBo;
import edu.TranThanhTu.models.dao.implement.TheloaiDao;

public class TheloaiBo implements ITheloaiBo {

    @Override
    public List<TheloaiBean> findAll() {
	// TODO Auto-generated method stub
	return new TheloaiDao().findAll();
    }

    @Override
    public int save(TheloaiBean tl) {
	// TODO Auto-generated method stub
	return 0;
    }

}
