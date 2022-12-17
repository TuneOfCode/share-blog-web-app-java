package edu.TranThanhTu.models.dao.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.CamxucbinhluanBean;
import edu.TranThanhTu.models.dao.ICamxucbinhluanDao;
import edu.TranThanhTu.models.mapper.CamxucbinhluanMapper;

public class CamxucbinhluanDao extends CobanDao<CamxucbinhluanBean> implements ICamxucbinhluanDao {
    @Override
    public int countEmotionByCommentId(String maBinhLuan) {
	// TODO Auto-generated method stub
	String sql = "SELECT bl.nguoiTao AS 'maThanhVien', bl.maBinhLuan, SUM(tvbl.timBinhLuan) AS 'soLuotCamXuc', 0 AS 'soLuotBinhLuan'\r\n"
		+ "FROM BinhLuan AS bl\r\n" + "	JOIN ThanhVien_BinhLuan AS tvbl ON tvbl.maBinhLuan = bl.maBinhLuan\r\n"
		+ "WHERE bl.trangThaiBinhLuan = 1 AND bl.maBinhLuan = ?\r\n" + "GROUP BY bl.nguoiTao, bl.maBinhLuan";
	List<CamxucbinhluanBean> listEmotions = select(sql, new CamxucbinhluanMapper(), maBinhLuan);
	int countEmotion = 0;
	if (listEmotions != null && listEmotions.size() > 0) {
	    countEmotion = listEmotions.get(0).getTimBinhLuan();
	}
	return countEmotion;
    }

    @Override
    public int countCommentByPostId(String maBaiViet) {
	// TODO Auto-generated method stub
	String sql = "SELECT bl.nguoiTao AS 'maThanhVien', bl.maBinhLuan, 0 AS 'soLuotCamXuc', COUNT(bl.maBinhLuan) AS 'soLuotBinhLuan'\r\n"
		+ "FROM BaiViet AS bv\r\n" + "	JOIN BinhLuan AS bl ON bl.maBaiViet = bv.maBaiViet\r\n"
		+ "WHERE bl.trangThaiBinhLuan = 1 AND bv.maBaiViet = ?\r\n" + "GROUP BY bl.nguoiTao, bl.maBinhLuan";
	List<CamxucbinhluanBean> listComments = select(sql, new CamxucbinhluanMapper(), maBaiViet);
	int countComment = 0;
	for (CamxucbinhluanBean c : listComments) {
	    countComment += c.getSoLuotBinhLuan();
	}
	return countComment;
    }

    @Override
    public int emoteComment(String maBinhLuan, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_emote_comment ?, ?";
	return insert(sql, maBinhLuan, nguoiThaCamXuc);
    }

    @Override
    public int checkEmoted(String maBinhLuan, String nguoiThaCamXuc) {
	// TODO Auto-generated method stub
	String sql = "SELECT maBinhLuan, maThanhVien, timBinhLuan AS 'soLuotCamXuc', 0 AS 'soLuotBinhLuan' FROM ThanhVien_BinhLuan\r\n"
		+ "WHERE maBinhLuan = ? AND maThanhVien = ?";
	List<CamxucbinhluanBean> listEmotions = select(sql, new CamxucbinhluanMapper(), maBinhLuan, nguoiThaCamXuc);
	int countEmotion = 0;
	if (listEmotions != null && listEmotions.size() > 0) {
	    countEmotion = listEmotions.get(0).getTimBinhLuan();
	}
	return countEmotion;
    }
}
