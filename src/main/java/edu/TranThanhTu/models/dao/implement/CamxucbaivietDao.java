package edu.TranThanhTu.models.dao.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.CamxucbaivietBean;
import edu.TranThanhTu.models.dao.ICamxucbaivietDao;
import edu.TranThanhTu.models.mapper.CamxucbaivietMapper;

public class CamxucbaivietDao extends CobanDao<CamxucbaivietBean> implements ICamxucbaivietDao {

    @Override
    public int countEmotionByPostId(String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "SELECT bv.maBaiViet, tv.maThanhVien, SUM(tvbv.timBaiViet) AS 'soLuotCamXuc'\r\n"
		+ "FROM BaiViet AS bv\r\n" + "	JOIN ThanhVien AS tv ON tv.maThanhVien = bv.tacGia\r\n"
		+ "	JOIN ThanhVien_BaiViet AS tvbv ON tvbv.maBaiViet = bv.maBaiViet\r\n"
		+ "WHERE bv.trangThaiBaiViet = 1 AND bv.maBaiViet = ? \r\n" + "GROUP BY bv.maBaiViet, tv.maThanhVien";
	List<CamxucbaivietBean> listEmotions = select(sql, new CamxucbaivietMapper(), maBaiViet);
	int countEmotion = 0;
	if (listEmotions != null && listEmotions.size() > 0) {
	    countEmotion = listEmotions.get(0).getTimBaiViet();
	}
	return countEmotion;
    }

    @Override
    public int emotePost(String maBaiViet, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_emote_post ?, ?";
	return insert(sql, maBaiViet, nguoiThaCamXuc);
    }

    @Override
    public int checkEmoted(String maBaiViet, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	String sql = "SELECT maBaiViet, maThanhVien, timBaiViet AS 'soLuotCamXuc' FROM ThanhVien_BaiViet\r\n"
		+ "WHERE maBaiViet = ? AND maThanhVien = ?";
	List<CamxucbaivietBean> listEmotions = select(sql, new CamxucbaivietMapper(), maBaiViet, nguoiThaCamXuc);
	int countEmotion = 0;
	if (listEmotions != null && listEmotions.size() > 0) {
	    countEmotion = listEmotions.get(0).getTimBaiViet();
	}
	return countEmotion;
    }
}
