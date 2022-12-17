package edu.TranThanhTu.models.dao;

import java.util.List;

import edu.TranThanhTu.models.bean.TheloaiBean;

public interface ITheloaiDao extends ICobanDao<TheloaiBean> {
    List<TheloaiBean> findAll();

    TheloaiBean findById(String maTheLoai);

    int save(TheloaiBean tl);

    int update(TheloaiBean tl);

    int delete(TheloaiBean tl);
}
