package edu.TranThanhTu.models.bo.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.BinhluanBean;
import edu.TranThanhTu.models.bo.IBinhluanBo;
import edu.TranThanhTu.models.dao.implement.BinhluanDao;
import edu.TranThanhTu.models.dao.implement.CamxucbinhluanDao;

public class BinhluanBo implements IBinhluanBo {
    @Override
    public List<BinhluanBean> findAll() {
	// TODO Auto-generated method stub
	return new BinhluanDao().findAll();
    }

    @Override
    public List<BinhluanBean> findByPostId(String maBaiViet) {
	// TODO Auto-generated method stub
	return new BinhluanDao().findByPostId(maBaiViet);
    }

    @Override
    public int save(BinhluanBean bl) {
	// TODO Auto-generated method stub
	return new BinhluanDao().save(bl);
    }

    @Override
    public int update(BinhluanBean bl) {
	// TODO Auto-generated method stub
	return new BinhluanDao().update(bl);
    }

    @Override
    public int destroy(String maBinhLuan, String maBaiViet) {
	// TODO Auto-generated method stub
	return new BinhluanDao().destroy(maBinhLuan, maBaiViet);
    }

    @Override
    public int addReport(String maBinhLuan, String maBaiViet) {
	// TODO Auto-generated method stub
	return new BinhluanDao().addReport(maBinhLuan, maBaiViet);
    }

    @Override
    public int countEmotionByCommentId(String maBinhLuan) {
	// TODO Auto-generated method stub
	return new CamxucbinhluanDao().countEmotionByCommentId(maBinhLuan);
    }

    @Override
    public int emoteComment(String maBinhLuan, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	return new CamxucbinhluanDao().emoteComment(maBinhLuan, nguoiThaCamXuc);
    }

    @Override
    public int checkEmoted(String maBinhLuan, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	return new CamxucbinhluanDao().checkEmoted(maBinhLuan, nguoiThaCamXuc);
    }

}
