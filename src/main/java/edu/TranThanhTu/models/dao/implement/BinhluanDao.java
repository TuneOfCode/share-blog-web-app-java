package edu.TranThanhTu.models.dao.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.BinhluanBean;
import edu.TranThanhTu.models.dao.IBinhluanDao;
import edu.TranThanhTu.models.mapper.BinhluanMapper;

public class BinhluanDao extends CobanDao<BinhluanBean> implements IBinhluanDao {

    @Override
    public List<BinhluanBean> findByPostId(String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "SELECT bl.*, tv.tenThanhVien AS 'tenNguoiTao', tv.anhDaiDien, tv.quyen AS 'tichQuanTriVien'\r\n"
		+ "FROM BinhLuan AS bl\r\n" + "	JOIN ThanhVien AS tv ON bl.nguoiTao = tv.maThanhVien\r\n"
		+ "	JOIN BaiViet AS bv ON bl.maBaiViet = bv.maBaiViet\r\n"
		+ "WHERE bl.trangThaiBinhLuan = 1 AND bl.maBaiViet = ?";
	return select(sql, new BinhluanMapper(), maBaiViet);
    }

    @Override
    public int save(BinhluanBean bl) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_create_comment ?, ?, ?, ?";
	return insert(sql, bl.getMaBinhLuan(), bl.getNoiDung(), bl.getMaBaiViet(), bl.getNguoiTao());
    }

    @Override
    public int update(BinhluanBean bl) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_update_comment ?, ?, ?, ?";
	return update(sql, bl.getMaBinhLuan(), bl.getNoiDung(), bl.getMaBaiViet(), bl.getNguoiTao());
    }

    @Override
    public int destroy(String maBinhLuan, String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "DELETE FROM BinhLuan WHERE maBinhLuan = ? AND maBaiViet = ?";
	return execute(sql, maBinhLuan, maBaiViet);
    }

    @Override
    public int addReport(String maBinhLuan, String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "UPDATE BinhLuan SET luotBaoCao = luotBaoCao + 1 WHERE maBinhLuan = ? AND maBaiViet = ?";
	return execute(sql, maBinhLuan, maBaiViet);
    }
}
