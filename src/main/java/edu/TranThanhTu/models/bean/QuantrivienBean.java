package edu.TranThanhTu.models.bean;

public class QuantrivienBean {
    private String tenDangNhap;
    private String matKhau;
    private int quyen;

    public QuantrivienBean(String tenDangNhap, String matKhau) {
	super();
	this.tenDangNhap = tenDangNhap;
	this.matKhau = matKhau;
    }

    public String getTenDangNhap() {
	return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
	this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
	return matKhau;
    }

    public void setMatKhau(String matKhau) {
	this.matKhau = matKhau;
    }

    public int getQuyen() {
	return quyen;
    }

    public void setQuyen(int quyen) {
	this.quyen = quyen;
    }
}
