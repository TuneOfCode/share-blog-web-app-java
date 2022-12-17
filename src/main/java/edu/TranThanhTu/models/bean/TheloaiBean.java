package edu.TranThanhTu.models.bean;

public class TheloaiBean {
    private String maTheLoai;
    private String tenTheLoai;

    public TheloaiBean() {
	super();
	// TODO Auto-generated constructor stub
    }

    public TheloaiBean(String maTheLoai, String tenTheLoai) {
	super();
	this.maTheLoai = maTheLoai;
	this.tenTheLoai = tenTheLoai;
    }

    public String getMaTheLoai() {
	return maTheLoai;
    }

    public void setMaTheLoai(String maTheLoai) {
	this.maTheLoai = maTheLoai;
    }

    public String getTenTheLoai() {
	return tenTheLoai;
    }

    public void setTenTheLoai(String tenTheLoai) {
	this.tenTheLoai = tenTheLoai;
    }
}
