package edu.TranThanhTu.models.bean;

public class CamxucbaivietBean {
    private String maThanhVien;
    private String maBaiViet;
    private int timBaiViet;

    public CamxucbaivietBean() {
	super();
	// TODO Auto-generated constructor stub
    }

    public CamxucbaivietBean(String maThanhVien, String maBaiViet, int timBaiViet) {
	super();
	this.maThanhVien = maThanhVien;
	this.maBaiViet = maBaiViet;
	this.timBaiViet = timBaiViet;
    }

    public String getMaThanhVien() {
	return maThanhVien;
    }

    public void setMaThanhVien(String maThanhVien) {
	this.maThanhVien = maThanhVien;
    }

    public String getMaBaiViet() {
	return maBaiViet;
    }

    public void setMaBaiViet(String maBaiViet) {
	this.maBaiViet = maBaiViet;
    }

    public int getTimBaiViet() {
	return timBaiViet;
    }

    public void setTimBaiViet(int timBaiViet) {
	this.timBaiViet = timBaiViet;
    }
}
