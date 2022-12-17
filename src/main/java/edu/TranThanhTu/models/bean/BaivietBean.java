package edu.TranThanhTu.models.bean;

import java.sql.Timestamp;

public class BaivietBean {
    private String maBaiViet;
    private String tieuDe;
    private String noiDung;
    private String theLoai;
    private String tenTheLoai;
    private String anhNen;
    private Timestamp ngayXuatBan;
    private String anhDaiDien;
    private String tacGia;
    private String tenTacGia;
    private int luotBaoCao;
    private int trangThaiBaiViet;
    private int soLuotCamXuc;
    private int soLuotBinhLuan;
    private String thoiGianKeTu;
    private int tichQuanTriVien;

    public BaivietBean(String maBaiViet, String tieuDe, String noiDung, String theLoai, String anhNen, String tacGia) {
	super();
	this.maBaiViet = maBaiViet;
	this.tieuDe = tieuDe;
	this.noiDung = noiDung;
	this.theLoai = theLoai;
	this.anhNen = anhNen;
	this.tacGia = tacGia;
    }

    public BaivietBean() {
	// TODO Auto-generated constructor stub
    }

    public String getMaBaiViet() {
	return maBaiViet;
    }

    public void setMaBaiViet(String maBaiViet) {
	this.maBaiViet = maBaiViet;
    }

    public String getTieuDe() {
	return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
	this.tieuDe = tieuDe;
    }

    public String getNoiDung() {
	return noiDung;
    }

    public void setNoiDung(String noiDung) {
	this.noiDung = noiDung;
    }

    public String getTheLoai() {
	return theLoai;
    }

    public void setTheLoai(String theLoai) {
	this.theLoai = theLoai;
    }

    public String getTenTheLoai() {
	return tenTheLoai;
    }

    public void setTenTheLoai(String tenTheLoai) {
	this.tenTheLoai = tenTheLoai;
    }

    public String getAnhDaiDien() {
	return anhDaiDien;
    }

    public void setAnhDaiDien(String anhDaiDien) {
	this.anhDaiDien = anhDaiDien;
    }

    public String getTenTacGia() {
	return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
	this.tenTacGia = tenTacGia;
    }

    public String getAnhNen() {
	return anhNen;
    }

    public void setAnhNen(String anhNen) {
	this.anhNen = anhNen;
    }

    public Timestamp getNgayXuatBan() {
	return ngayXuatBan;
    }

    public void setNgayXuatBan(Timestamp timestamp) {
	this.ngayXuatBan = timestamp;
    }

    public String getTacGia() {
	return tacGia;
    }

    public void setTacGia(String tacGia) {
	this.tacGia = tacGia;
    }

    public int getLuotBaoCao() {
	return luotBaoCao;
    }

    public void setLuotBaoCao(int luotBaoCao) {
	this.luotBaoCao = luotBaoCao;
    }

    public int getTrangThaiBaiViet() {
	return trangThaiBaiViet;
    }

    public void setTrangThaiBaiViet(int trangThaiBaoCao) {
	this.trangThaiBaiViet = trangThaiBaoCao;
    }

    public int getSoLuotCamXuc() {
	return soLuotCamXuc;
    }

    public void setSoLuotCamXuc(int soLuotCamXuc) {
	this.soLuotCamXuc = soLuotCamXuc;
    }

    public int getSoLuotBinhLuan() {
	return soLuotBinhLuan;
    }

    public void setSoLuotBinhLuan(int soLuotBinhLuan) {
	this.soLuotBinhLuan = soLuotBinhLuan;
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
}
