import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/DanhSachNhanVien.dart';
import 'CapNhatNhanVien.dart';

class ChiTietNhanVien extends StatefulWidget {
  final String NhanVienID;
  const ChiTietNhanVien({super.key, required this.NhanVienID});

  @override
  State<ChiTietNhanVien> createState() => _ChiTietNhanVienState();
}

class _ChiTietNhanVienState extends State<ChiTietNhanVien> {
  late String hinhAnhNV;
  late String tenNV;
  late String ngaysinh;
  late String sodienthoai;
  late String Luong;
  late String calam;
  late String gioitinh;
  @override
  void initState() {
    super.initState();
    fetchThongTinNhanVien(widget.NhanVienID);
  }

  Future<void> fetchThongTinNhanVien(String productId) async {
    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('Staff')
        .doc(productId)
        .get();

    if (docSnapshot.exists) {
      final thongTinSanPham = docSnapshot.data() as Map<String, dynamic>;
      setState(() {
        tenNV = thongTinSanPham['tenNV'] ?? '';
        hinhAnhNV = thongTinSanPham['hinhAnh'] ?? '';
        ngaysinh = thongTinSanPham['ngaySinh'] ?? '';
        sodienthoai = thongTinSanPham['sdt'] ?? '';
        Luong = thongTinSanPham['luong'].toString();
        calam = thongTinSanPham['caLam'] ?? '';
        gioitinh = thongTinSanPham['gioiTinh'] ?? '';
      });
    } else {
      print('Không tìm thấy sản phẩm $productId');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.93;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff5dab1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 15 * fem, 291 * fem, 35 * fem),
              width: 32 * fem,
              height: 32 * fem,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DanhSachNhanVien()));
                },
                child: Image.asset(
                  'assets/page-1/images/vector-y13.png',
                  width: 32 * fem,
                  height: 32 * fem,
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(102 * fem, 0 * fem, 97 * fem, 34 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100 * fem),
              ),
              child: Center(
                child: SizedBox(
                  width: 123 * fem,
                  height: 123 * fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100 * fem),
                    child: hinhAnhNV != null && hinhAnhNV.isNotEmpty
                        ? Image.network(
                            hinhAnhNV,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/page-1/images/image-16.png', // Replace with your default image path
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 63 * fem),
              child: Text(
                tenNV,
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Quicksand',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.25 * ffem / fem,
                  color: Color(0xff993300),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(6 * fem, 0 * fem, 2 * fem, 41.38 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 68 * fem, 0 * fem),
                    child: Text(
                      'Giới tính:',
                      style: SafeGoogleFont(
                        'Quicksand',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    gioitinh,
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(6 * fem, 0 * fem, 2 * fem, 41.38 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 54 * fem, 0 * fem),
                    child: Text(
                      'Ngày sinh:',
                      style: SafeGoogleFont(
                        'Quicksand',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    ngaysinh,
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(6 * fem, 0 * fem, 1 * fem, 41.38 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 15 * fem, 0 * fem),
                    child: Text(
                      'Số điện thoại:',
                      style: SafeGoogleFont(
                        'Quicksand',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    sodienthoai,
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(7 * fem, 0 * fem, 1 * fem, 35.23 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 98 * fem, 0 * fem),
                    child: Text(
                      'Lương:',
                      style: SafeGoogleFont(
                        'Quicksand',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    Luong.toString(),
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 40 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 6.15 * fem, 95 * fem, 0 * fem),
                    child: Text(
                      'Ca làm:',
                      style: SafeGoogleFont(
                        'Quicksand',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    calam,
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(34 * fem, 0 * fem, 30 * fem, 0 * fem),
              width: double.infinity,
              height: 40 * fem,
              decoration: BoxDecoration(
                color: Color(0xff007373),
                borderRadius: BorderRadius.circular(90 * fem),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => SuaNhanVien(
                          calam: calam,
                          hinhAnh: hinhAnhNV,
                          luong: Luong.toString(),
                          ngaySinh: ngaysinh,
                          sodienthoai: sodienthoai,
                          tenNV: tenNV,
                          gioiTinh: gioitinh,
                          id: widget.NhanVienID,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Thay đổi thông tin nhân viên',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: Color(0xfffcf2d9),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
