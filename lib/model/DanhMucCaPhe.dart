class CaPhe {
  double donGia;
  String donviTinh;
  String hinhAnh;
  String idCate;
  String kichThuoc;
  String motaCaphe;
  String tenCaphe;


  CaPhe(this.donGia, this.donviTinh, this.hinhAnh, this.idCate, this.kichThuoc,
      this.motaCaphe, this.tenCaphe);


  @override
  String toString() {
    return 'Caphe{donGia: $donGia, donviTinh: $donviTinh, hinhAnh: $hinhAnh, idCaphe: $idCate, kichThuoc: $kichThuoc, motaCaphe: $motaCaphe, tenCaphe: $tenCaphe}';
  }


}
