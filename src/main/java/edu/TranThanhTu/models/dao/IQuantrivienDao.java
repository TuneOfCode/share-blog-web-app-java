package edu.TranThanhTu.models.dao;

import edu.TranThanhTu.models.bean.QuantrivienBean;

public interface IQuantrivienDao extends ICobanDao<QuantrivienBean> {
    int save(QuantrivienBean q);

    int manageAccountMember();

    int managePost();
}
