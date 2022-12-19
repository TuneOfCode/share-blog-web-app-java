package edu.TranThanhTu.models.bo.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.BaivietBean;
import edu.TranThanhTu.models.bean.TheloaiBean;
import edu.TranThanhTu.models.bo.IQuantrivienBo;
import edu.TranThanhTu.models.dao.implement.BaivietDao;
import edu.TranThanhTu.models.dao.implement.BinhluanDao;
import edu.TranThanhTu.models.dao.implement.ThanhvienDao;
import edu.TranThanhTu.models.dao.implement.TheloaiDao;

public class QuantrivienBo implements IQuantrivienBo {
    @Override
    public List<BaivietBean> findAllPostInAdmin() {
	// TODO Auto-generated method stub
	return new BaivietDao().findAllInAdmin();
    }

    @Override
    public int createCategory(TheloaiBean tl) {
	// TODO Auto-generated method stub
	return new TheloaiDao().save(tl);
    }

    @Override
    public int updateCategory(TheloaiBean tl) {
	// TODO Auto-generated method stub
	return new TheloaiDao().update(tl);
    }

    @Override
    public int destroyCategory(String maTheLoai) {
	// TODO Auto-generated method stub
	return new TheloaiDao().delete(maTheLoai);
    }

    @Override
    public int updateStatusMember(String maThanhVien) {
	// TODO Auto-generated method stub
	return new ThanhvienDao().updateStatus(maThanhVien);
    }

    @Override
    public int updateStatusPost(String maBaiViet) {
	// TODO Auto-generated method stub
	return new BaivietDao().updateStatus(maBaiViet);
    }

    @Override
    public int updateStatusComment(String maBinhLuan) {
	// TODO Auto-generated method stub
	return new BinhluanDao().updateStatus(maBinhLuan);
    }

    @Override
    public int destroyMember(String maThanhVien) {
	// TODO Auto-generated method stub
	return new ThanhvienDao().deleteInfo(maThanhVien);
    }

    @Override
    public int destroyPost(String maBaiViet, String tacGia) {
	// TODO Auto-generated method stub
	return new BaivietDao().delete(maBaiViet, tacGia);
    }

    @Override
    public int destroyComment(String maBinhLuan, String maBaiViet) {
	// TODO Auto-generated method stub
	return new BinhluanDao().destroy(maBinhLuan, maBaiViet);
    }
}
