package edu.TranThanhTu.models.dao.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.DanhdaubaivietBean;
import edu.TranThanhTu.models.dao.IDanhdaubaivietDao;
import edu.TranThanhTu.models.mapper.DanhdaubaivietMapper;

public class DanhdaubaivietDao extends CobanDao<DanhdaubaivietBean> implements IDanhdaubaivietDao {

    @Override
    public List<DanhdaubaivietBean> findAllBookmarks(String nguoiDanhDau) {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.maBaiViet, bv.tieuDe, tvbv.maThanhVien, tv.maThanhVien AS 'maTacGia',\r\n"
		+ "tv.tenThanhVien AS 'tenTacGia', tvbv.luuBaiViet, tvbv.thoiGianLuu\r\n" + "FROM BaiViet AS bv \r\n"
		+ "	JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN TheLoai AS tl ON tl.maTheLoai = bv.theLoai\r\n"
		+ "	JOIN ThanhVien_BaiViet AS tvbv ON tvbv.maBaiViet = bv.maBaiViet\r\n"
		+ "WHERE tvbv.luuBaiViet = 1 AND bv.trangThaiBaiViet = 1 AND tvbv.maThanhVien = ?\r\n"
		+ "ORDER BY tvbv.thoiGianLuu DESC";
	return select(sql, new DanhdaubaivietMapper(), nguoiDanhDau);
    }

    @Override
    public int addBookmark(String maBaiViet, String nguoiDanhDau) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_bookmark_post ?, ?";
	return insert(sql, maBaiViet, nguoiDanhDau);
    }

    @Override
    public int removeBookmark(String maBaiViet, String nguoiDanhDau) {
	// TODO Auto-generated method stub
	String sql = "UPDATE ThanhVien_BaiViet SET luuBaiViet = 0, thoiGianLuu = NULL\r\n"
		+ "WHERE maBaiViet = ? AND maThanhVien = ?";
	return execute(sql, maBaiViet, nguoiDanhDau);
    }
}
