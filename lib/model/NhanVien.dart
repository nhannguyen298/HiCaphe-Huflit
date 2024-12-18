class NhanVien{
  String caLam;
  String hinhAnh;
  double luong;
  String ngaySinh;
  String sdt;
  String tenNV;
  String gioiTinh;


  NhanVien(this.caLam, this.hinhAnh, this.luong, this.ngaySinh, this.sdt,
      this.tenNV, this.gioiTinh);

  @override
  String toString() {
    return 'Nhanvien{caLam: $caLam, hinhAnh: $hinhAnh, luong: $luong, ngaySinh: $ngaySinh, sdt: $sdt, tenNV: $tenNV, gioiTinh: $gioiTinh}';
  }
}