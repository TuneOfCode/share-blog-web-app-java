package edu.TranThanhTu.models.bean;

public class CamxucbinhluanBean {
    private String maThanhVien;
    private String maBinhLuan;
    private String maBaiViet;
    private int timBinhLuan;
    private int soLuotBinhLuan;

    public CamxucbinhluanBean() {
	super();
	// TODO Auto-generated constructor stub
    }

    public CamxucbinhluanBean(String maThanhVien, String maBinhLuan, int timBinhLuan) {
	super();
	this.maThanhVien = maThanhVien;
	this.maBinhLuan = maBinhLuan;
	this.timBinhLuan = timBinhLuan;
    }

    public String getMaThanhVien() {
	return maThanhVien;
    }

    public void setMaThanhVien(String maThanhVien) {
	this.maThanhVien = maThanhVien;
    }

    public String getMaBinhLuan() {
	return maBinhLuan;
    }

    public void setMaBinhLuan(String maBinhLuan) {
	this.maBinhLuan = maBinhLuan;
    }

    public String getMaBaiViet() {
	return maBaiViet;
    }

    public void setMaBaiViet(String maBaiViet) {
	this.maBaiViet = maBaiViet;
    }

    public int getTimBinhLuan() {
	return timBinhLuan;
    }

    public void setTimBinhLuan(int timBinhLuan) {
	this.timBinhLuan = timBinhLuan;
    }

    public int getSoLuotBinhLuan() {
	return soLuotBinhLuan;
    }

    public void setSoLuotBinhLuan(int soLuotBinhLuan) {
	this.soLuotBinhLuan = soLuotBinhLuan;
    }
}
