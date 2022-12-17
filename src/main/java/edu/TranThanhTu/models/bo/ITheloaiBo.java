package edu.TranThanhTu.models.bo;

import java.util.List;

import edu.TranThanhTu.models.bean.TheloaiBean;

public interface ITheloaiBo {
    public List<TheloaiBean> findAll();

    public int save(TheloaiBean tl);
}
