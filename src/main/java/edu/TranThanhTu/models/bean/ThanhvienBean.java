package edu.TranThanhTu.models.bean;

public class ThanhvienBean {
    private String maThanhVien;
    private String tenThanhVien;
    private String tenDangNhap;
    private String matKhau;
    private String email;
    private String soDienThoai;
    private String diaChi;
    private String anhDaiDien;
    private String congViec;
    private int soBaiViet;
    private int trangThai;
    private int quyen;

    public ThanhvienBean(String maThanhVien, String tenThanhVien, String tenDangNhap, String matKhau, String email,
	    String soDienThoai, String diaChi, String anhDaiDien, String congViec) {
	super();
	this.maThanhVien = maThanhVien;
	this.tenThanhVien = tenThanhVien;
	this.tenDangNhap = tenDangNhap;
	this.matKhau = matKhau;
	this.email = email;
	this.soDienThoai = soDienThoai;
	this.diaChi = diaChi;
	this.anhDaiDien = anhDaiDien;
	this.congViec = congViec;
    }

    public ThanhvienBean() {
	// TODO Auto-generated constructor stub
    }

    public String getMaThanhVien() {
	return maThanhVien;
    }

    public void setMaThanhVien(String maThanhVien) {
	this.maThanhVien = maThanhVien;
    }

    public String getTenThanhVien() {
	return tenThanhVien;
    }

    public void setTenThanhVien(String tenThanhVien) {
	this.tenThanhVien = tenThanhVien;
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

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getSoDienThoai() {
	return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
	this.soDienThoai = soDienThoai;
    }

    public String getDiaChi() {
	return diaChi;
    }

    public void setDiaChi(String diaChi) {
	this.diaChi = diaChi;
    }

    public String getAnhDaiDien() {
	return anhDaiDien;
    }

    public void setAnhDaiDien(String anhDaiDien) {
	this.anhDaiDien = anhDaiDien;
    }

    public String getCongViec() {
	return congViec;
    }

    public void setCongViec(String congViec) {
	this.congViec = congViec;
    }

    public int getSoBaiViet() {
	return soBaiViet;
    }

    public void setSoBaiViet(int soBaiViet) {
	this.soBaiViet = soBaiViet;
    }

    public int getTrangThai() {
	return trangThai;
    }

    public void setTrangThai(int trangThai) {
	this.trangThai = trangThai;
    }

    public int getQuyen() {
	return quyen;
    }

    public void setQuyen(int quyen) {
	this.quyen = quyen;
    }
}
