package edu.TranThanhTu.models.dao.implement;

import java.util.ArrayList;
import java.util.List;

import edu.TranThanhTu.models.bean.BaivietBean;
import edu.TranThanhTu.models.dao.IBaivietDao;
import edu.TranThanhTu.models.mapper.BaivietMapper;

public class BaivietDao extends CobanDao<BaivietBean> implements IBaivietDao {
    @Override
    public List<BaivietBean> findAll() {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.*, tv.anhDaiDien, tv.tenThanhVien AS 'tenTacGia', tl.tenTheLoai, tv.quyen AS 'tichQuanTriVien'\r\n"
		+ "FROM BaiViet AS bv \r\n" + "	JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN TheLoai AS tl ON tl.maTheLoai = bv.theLoai\r\n" + "WHERE bv.trangThaiBaiViet = 1\r\n"
		+ "ORDER BY bv.ngayXuatBan DESC";
	return select(sql, new BaivietMapper());
    }

    @Override
    public List<BaivietBean> findAllInAdmin() {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.*, tv.anhDaiDien, tv.tenThanhVien AS 'tenTacGia', tl.tenTheLoai, tv.quyen AS 'tichQuanTriVien'\r\n"
		+ "FROM BaiViet AS bv \r\n" + "	JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN TheLoai AS tl ON tl.maTheLoai = bv.theLoai\r\n" + "ORDER BY bv.ngayXuatBan DESC";
	return select(sql, new BaivietMapper());
    }

    @Override
    public BaivietBean findOne(String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.*, tv.anhDaiDien, tv.tenThanhVien AS 'tenTacGia', tl.tenTheLoai, tv.quyen AS 'tichQuanTriVien'\r\n"
		+ "FROM BaiViet AS bv \r\n" + "	JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN TheLoai AS tl ON tl.maTheLoai = bv.theLoai\r\n"
		+ "WHERE bv.trangThaiBaiViet = 1 AND bv.maBaiViet = ?";
	List<BaivietBean> listPosts = select(sql, new BaivietMapper(), maBaiViet);
	BaivietBean bv = null;
	if (listPosts != null && listPosts.size() > 0) {
	    bv = listPosts.get(0);
	}
	return bv;
    }

    @Override
    public List<BaivietBean> findByAuthor(String tacGia) {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.*, tv.anhDaiDien, tv.tenThanhVien AS 'tenTacGia', tl.tenTheLoai, tv.quyen AS 'tichQuanTriVien'\r\n"
		+ "FROM BaiViet AS bv \r\n" + "	JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN TheLoai AS tl ON tl.maTheLoai = bv.theLoai\r\n"
		+ "WHERE bv.trangThaiBaiViet = 1 AND bv.tacGia = ?";
	return select(sql, new BaivietMapper(), tacGia);
    }

    @Override
    public List<BaivietBean> findAllInTrash(String tacGia) {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.*, tv.anhDaiDien, tv.tenThanhVien AS 'tenTacGia', tl.tenTheLoai, tv.quyen AS 'tichQuanTriVien'\r\n"
		+ "FROM BaiViet AS bv \r\n" + "	JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN TheLoai AS tl ON tl.maTheLoai = bv.theLoai\r\n"
		+ "WHERE bv.trangThaiBaiViet = 0 AND bv.tacGia = ? ORDER BY bv.ngayXuatBan DESC";
	return select(sql, new BaivietMapper(), tacGia);
    }

    @Override
    public int save(BaivietBean b) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_create_post ?, ?, ?, ?, ?, ?";
	return insert(sql, b.getMaBaiViet(), b.getTieuDe(), b.getNoiDung(), b.getTheLoai(), b.getAnhNen(),
		b.getTacGia());
    }

    @Override
    public int update(BaivietBean b) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_edit_post ?, ?, ?, ?, ?, ?";
	return insert(sql, b.getTieuDe(), b.getNoiDung(), b.getTheLoai(), b.getAnhNen(), b.getTacGia(),
		b.getMaBaiViet());
    }

    @Override
    public int softDelete(String maBaiViet, String tacGia) {
	// TODO Auto-generated method stub
	String sql = "UPDATE BaiViet SET trangThaiBaiViet = 0 WHERE maBaiViet = ? AND tacGia = ?";
	return execute(sql, maBaiViet, tacGia);
    }

    @Override
    public int restore(String maBaiViet, String tacGia) {
	// TODO Auto-generated method stub
	String sql = "UPDATE BaiViet SET trangThaiBaiViet = 1 WHERE maBaiViet = ? AND tacGia = ?";
	return execute(sql, maBaiViet, tacGia);
    }

    @Override
    public int delete(String maBaiViet, String tacGia) {
	// TODO Auto-generated method stub
	String sql = "DELETE FROM BaiViet WHERE maBaiViet = ? AND tacGia = ?";
	return execute(sql, maBaiViet, tacGia);
    }

    @Override
    public int addReport(String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "UPDATE BaiViet SET luotBaoCao = luotBaoCao + 1 WHERE maBaiViet = ?";
	return execute(sql, maBaiViet);
    }

    @Override
    public List<BaivietBean> findAllTrending() {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.*, tv.anhDaiDien, tv.tenThanhVien AS 'tenTacGia', tl.tenTheLoai, tv.quyen AS 'tichQuanTriVien', SUM(tvbv.timBaiViet) AS 'soLuotCamXuc'\r\n"
		+ "FROM BaiViet AS bv \r\n" + "JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN TheLoai AS tl ON tl.maTheLoai = bv.theLoai\r\n"
		+ "	JOIN ThanhVien_BaiViet AS tvbv ON tvbv.maBaiViet = bv.maBaiViet\r\n"
		+ "	--JOIN ThanhVien_BinhLuan AS tvbl ON tvbl.maThanhVien = bv.tacGia\r\n"
		+ "WHERE bv.trangThaiBaiViet = 1\r\n" + "GROUP BY bv.maBaiViet, bv.tieuDe, bv.noiDung, bv.theLoai, \r\n"
		+ "	bv.anhNen, bv.ngayXuatBan, bv.tacGia, bv.luotBaoCao, bv.trangThaiBaiViet,\r\n"
		+ "	tv.anhDaiDien, tv.tenThanhVien, tl.tenTheLoai, tv.quyen\r\n"
		+ "HAVING SUM(tvbv.timBaiViet) > 0\r\n" + "ORDER BY soLuotCamXuc DESC";
	List<BaivietBean> listAllTrending = select(sql, new BaivietMapper());
	List<BaivietBean> threePostTrending = new ArrayList<BaivietBean>();
	for (int i = 0; i < 3; i++) {
	    threePostTrending.add(listAllTrending.get(i));
	}
	return threePostTrending;
    }

    @Override
    public int updateStatus(String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_toggle_status_post ?";
	return update(sql, maBaiViet);
    }
}
