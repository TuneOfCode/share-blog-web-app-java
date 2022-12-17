package edu.TranThanhTu.models.bean;

import java.sql.Timestamp;

public class BinhluanBean {
    private String maBinhLuan;
    private String noiDung;
    private Timestamp ngayTao;
    private int luotBaoCao;
    private int trangThaiBinhLuan;
    private String maBaiViet;
    private String nguoiTao;
    private String tenNguoiTao;
    private String anhDaiDien;
    private int soLuotCamXuc;
    private String thoiGianKeTu;
    private int tichQuanTriVien;
    private int nguoiDaThaCamXuc;

    public BinhluanBean(String maBinhLuan, String noiDung, String maBaiViet, String nguoiTao, String tenNguoiTao,
	    String anhDaiDien) {
	super();
	this.maBinhLuan = maBinhLuan;
	this.noiDung = noiDung;
	this.maBaiViet = maBaiViet;
	this.nguoiTao = nguoiTao;
	this.tenNguoiTao = tenNguoiTao;
	this.anhDaiDien = anhDaiDien;
    }

    public BinhluanBean() {
	// TODO Auto-generated constructor stub
    }

    public String getMaBinhLuan() {
	return maBinhLuan;
    }

    public void setMaBinhLuan(String maBinhLuan) {
	this.maBinhLuan = maBinhLuan;
    }

    public String getNoiDung() {
	return noiDung;
    }

    public void setNoiDung(String noiDung) {
	this.noiDung = noiDung;
    }

    public Timestamp getNgayTao() {
	return ngayTao;
    }

    public void setNgayTao(Timestamp timestamp) {
	this.ngayTao = timestamp;
    }

    public int getLuotBaoCao() {
	return luotBaoCao;
    }

    public void setLuotBaoCao(int luotBaoCao) {
	this.luotBaoCao = luotBaoCao;
    }

    public int getTrangThaiBinhLuan() {
	return trangThaiBinhLuan;
    }

    public void setTrangThaiBinhLuan(int trangThaiBinhLuan) {
	this.trangThaiBinhLuan = trangThaiBinhLuan;
    }

    public String getMaBaiViet() {
	return maBaiViet;
    }

    public void setMaBaiViet(String maBaiViet) {
	this.maBaiViet = maBaiViet;
    }

    public String getNguoiTao() {
	return nguoiTao;
    }

    public void setNguoiTao(String nguoiTao) {
	this.nguoiTao = nguoiTao;
    }

    public String getTenNguoiTao() {
	return tenNguoiTao;
    }

    public void setTenNguoiTao(String tenNguoiTao) {
	this.tenNguoiTao = tenNguoiTao;
    }

    public String getAnhDaiDien() {
	return anhDaiDien;
    }

    public void setAnhDaiDien(String anhDaiDien) {
	this.anhDaiDien = anhDaiDien;
    }

    public int getSoLuotCamXuc() {
	return soLuotCamXuc;
    }

    public void setSoLuotCamXuc(int soLuotCamXuc) {
	this.soLuotCamXuc = soLuotCamXuc;
    }

    public String getThoiGianKeTu() {
	return thoiGianKeTu;
    }

    public void setThoiGianKeTu(String thoiGianKeTu) {
	this.thoiGianKeTu = thoiGianKeTu;
    }

    public int getTichQuanTriVien() {
	return tichQuanTriVien;
    }

    public void setTichQuanTriVien(int tichQuanTriVien) {
	this.tichQuanTriVien = tichQuanTriVien;
    }

    public int getNguoiDaThaCamXuc() {
	return nguoiDaThaCamXuc;
    }

    public void setNguoiDaThaCamXuc(int nguoiDaThaCamXuc) {
	this.nguoiDaThaCamXuc = nguoiDaThaCamXuc;
    }
}
