package edu.TranThanhTu.models.bean;

import java.sql.Timestamp;

public class DanhdaubaivietBean {
    private String maBaiViet;
    private String tieuDe;
    private String maThanhVien;
    private String maTacGia;
    private String tenTacGia;
    private int luuBaiViet;
    private Timestamp thoiGianLuu;
    private String thoiGianKeTu;

    public DanhdaubaivietBean() {
	super();
	// TODO Auto-generated constructor stub
    }

    public DanhdaubaivietBean(String maThanhVien, String maBaiViet, int luuBaiViet, Timestamp thoiGianLuu) {
	super();
	this.maThanhVien = maThanhVien;
	this.maBaiViet = maBaiViet;
	this.luuBaiViet = luuBaiViet;
	this.thoiGianLuu = thoiGianLuu;
    }

    public String getMaThanhVien() {
	return maThanhVien;
    }

    public void setMaThanhVien(String maThanhVien) {
	this.maThanhVien = maThanhVien;
    }

    public String getMaTacGia() {
	return maTacGia;
    }

    public void setMaTacGia(String maTacGia) {
	this.maTacGia = maTacGia;
    }

    public String getTieuDe() {
	return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
	this.tieuDe = tieuDe;
    }

    public String getTenTacGia() {
	return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
	this.tenTacGia = tenTacGia;
    }

    public String getMaBaiViet() {
	return maBaiViet;
    }

    public void setMaBaiViet(String maBaiViet) {
	this.maBaiViet = maBaiViet;
    }

    public int getLuuBaiViet() {
	return luuBaiViet;
    }

    public void setLuuBaiViet(int luuBaiViet) {
	this.luuBaiViet = luuBaiViet;
    }

    public Timestamp getThoiGianLuu() {
	return thoiGianLuu;
    }

    public void setThoiGianLuu(Timestamp thoiGianLuu) {
	this.thoiGianLuu = thoiGianLuu;
    }

    public String getThoiGianKeTu() {
	return thoiGianKeTu;
    }

    public void setThoiGianKeTu(String thoiGianKeTu) {
	this.thoiGianKeTu = thoiGianKeTu;
    }
}
