package edu.TranThanhTu.models.dao;

import java.util.List;

import edu.TranThanhTu.models.bean.TheloaiBean;

public interface ITheloaiDao extends ICobanDao<TheloaiBean> {
    List<TheloaiBean> findAll();

    int save(TheloaiBean tl);

    int update(TheloaiBean tl);

    int delete(String maTheLoai);
}
