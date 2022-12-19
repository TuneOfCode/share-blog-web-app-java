package edu.TranThanhTu.models.dao.implement;

import java.util.List;

import edu.TranThanhTu.models.bean.ThanhvienBean;
import edu.TranThanhTu.models.dao.IThanhvienDao;
import edu.TranThanhTu.models.mapper.ThanhvienMapper;

public class ThanhvienDao extends CobanDao<ThanhvienBean> implements IThanhvienDao {

    @Override
    public ThanhvienBean findOne(String tenDangNhap) {
	// TODO Auto-generated method stub
	String sql = "SELECT * FROM ThanhVien AS tv WHERE tv.tenDangNhap = ?";
	List<ThanhvienBean> listMember = select(sql, new ThanhvienMapper(), tenDangNhap);
	return listMember.isEmpty() ? null : listMember.get(0);
    }

    @Override
    public ThanhvienBean findByMemberId(String maThanhVien) {
	// TODO Auto-generated method stub
	String sql = "SELECT * FROM ThanhVien AS tv WHERE tv.maThanhVien = ?";
	List<ThanhvienBean> listMember = select(sql, new ThanhvienMapper(), maThanhVien);
	return listMember.isEmpty() ? null : listMember.get(0);
    }

    @Override
    public ThanhvienBean isLogin(String tenDangNhap, String matKhau) {
	// TODO Auto-generated method stub
	String sql = "SELECT * FROM ThanhVien AS tv WHERE tv.tenDangNhap = ? AND tv.matKhau = ? AND tv.trangThai = 1";
	System.out.println("username: " + tenDangNhap);
	System.out.println("password: " + matKhau);
	List<ThanhvienBean> listMember = select(sql, new ThanhvienMapper(), tenDangNhap, matKhau);
	if (listMember != null && listMember.size() > 0) {
	    return listMember.get(0);
	}
	return null;
    }

    @Override
    public List<ThanhvienBean> findAll() {
	// TODO Auto-generated method stub
	String sql = "SELECT * FROM ThanhVien";
	return select(sql, new ThanhvienMapper());
    }

    @Override
    public int updateInfo(ThanhvienBean tv) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_update_member ?, ?, ?, ?, ?, ?, ?, ?";

	return update(sql, tv.getTenThanhVien(), tv.getTenDangNhap(), tv.getEmail(), tv.getSoDienThoai(),
		tv.getDiaChi(), tv.getAnhDaiDien(), tv.getCongViec(), tv.getMaThanhVien());
    }

    @Override
    public int deleteInfo(String maThanhVien) {
	// TODO Auto-generated method stub
	String sql = "DELETE FROM [dbo].[ThanhVien]\r\n" + "      WHERE [maThanhVien] = ?";
	return execute(sql, maThanhVien);
    }

    @Override
    public int insertInfo(ThanhvienBean tv) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_register_member ?, ?, ?, ?, ?, ?, ?, ?";

	return insert(sql, tv.getMaThanhVien(), tv.getTenThanhVien(), tv.getTenDangNhap(), tv.getMatKhau(),
		tv.getEmail(), tv.getSoDienThoai(), tv.getDiaChi(), tv.getCongViec());
    }

    @Override
    public int changePassword(String matKhauCu, String matKhauMoi, String maThanhVien) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_change_password ?, ?, ?";
	return update(sql, matKhauCu, matKhauMoi, maThanhVien);
    }

    @Override
    public int updateStatus(String maThanhVien) {
	// TODO Auto-generated method stub
	String sql = "EXEC proc_toggle_status_member ?";
	return update(sql, maThanhVien);
    }

}
