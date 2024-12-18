class NguyenLieu {
  double donGia;
  String donVitinh;
  String hinhAnh;
  String  moTa;
  String ngayNhap;
  String slTonKho;
  String tenNL;


  NguyenLieu({ required this.donGia,required this.donVitinh,required this.hinhAnh,required this.moTa,
    required this.ngayNhap,required this.slTonKho,required this.tenNL});

  @override
  String toString() {
    return 'NguyenLieu{donGia: $donGia, donVitinh: $donVitinh, hinhAnh: $hinhAnh, moTa: $moTa, ngayNhap: $ngayNhap, slTonKho: $slTonKho, tenNL: $tenNL}';
  }
}
