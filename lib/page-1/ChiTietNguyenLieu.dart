import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/DanhMucNguyenLieu.dart';

import 'package:myapp/utils.dart';

class ChiTietNguyenLieu extends StatefulWidget {
  final String nguyenlieuId;
  const ChiTietNguyenLieu({super.key, required this.nguyenlieuId});

  @override
  State<ChiTietNguyenLieu> createState() => _ChiTietNguyenLieuState();
}

class _ChiTietNguyenLieuState extends State<ChiTietNguyenLieu> {
  late String tenNL;
  late String ngayNhap;
  late String soLuongCon;
  late String donGia;
  late String moTa;
  late String imageURLdetialsNL;

  @override
  void initState() {
    super.initState();
    fetchThongTinNguyenLieu(widget.nguyenlieuId);
  }

  Future<void> fetchThongTinNguyenLieu(String productId) async {
    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('RawMaterials')
        .doc(productId)
        .get();

    if (docSnapshot.exists) {
      final thongTinSanPham = docSnapshot.data() as Map<String, dynamic>;
      setState(() {
        tenNL = thongTinSanPham['tenNL'];
        imageURLdetialsNL = thongTinSanPham['hinhAnh'];
        ngayNhap = thongTinSanPham['ngayNhap'];
        donGia = thongTinSanPham['donGia'].toString();
        moTa = thongTinSanPham['moTa'];
        soLuongCon = thongTinSanPham['slTonKho'];
      });
    } else {
      print('Không tìm thấy sản phẩm');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Color(0xfff5dab1),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(16 * fem, 16 * fem, 22 * fem, 71 * fem),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xfff5dab1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 34 * fem),
                  width: 45 * fem,
                  height: 45 * fem,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuanLyNguyenLieu()));
                    },
                    child: Image.asset(
                      'assets/page-1/images/vector-y13.png',
                      width: 45 * fem,
                      height: 45 * fem,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 34 * fem),
                  width: double.infinity,
                  height: 115 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 34 * fem, 0 * fem),
                        width: 75 * fem,
                        height: 110 * fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20 * fem),
                          child: Image.network(
                            imageURLdetialsNL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 20 * fem),
                              child: Text(
                                'Nguyên liệu',
                                style: SafeGoogleFont(
                                  'Quicksand',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25 * ffem / fem,
                                  color: const Color(0xff007373),
                                ),
                              ),
                            ),
                            Text(
                              tenNL,
                              style: SafeGoogleFont(
                                'Quicksand',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.25 * ffem / fem,
                                color: const Color(0xff993300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 20 * fem),
                  child: Text(
                    'Ngày nhập gần nhất:',
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: const Color(0xff007373),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 36 * fem),
                  child: Text(
                    ngayNhap,
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: const Color(0xff993300),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(2 * fem, 0 * fem, 56 * fem, 36 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 23 * fem, 0 * fem),
                        child: Text(
                          'Số lượng còn:',
                          style: SafeGoogleFont(
                            'Quicksand',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            color: const Color(0xff007373),
                          ),
                        ),
                      ),
                      Text(
                        soLuongCon,
                        style: SafeGoogleFont(
                          'Quicksand',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.25 * ffem / fem,
                          color: const Color(0xff993300),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 36 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 27 * fem, 0 * fem),
                        child: Text(
                          'Đơn giá mua:',
                          style: SafeGoogleFont(
                            'Quicksand',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            color: const Color(0xff007373),
                          ),
                        ),
                      ),
                      Text(
                        donGia.toString(),
                        style: SafeGoogleFont(
                          'Quicksand',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.25 * ffem / fem,
                          color: const Color(0xff993300),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 20 * fem),
                  child: Text(
                    'Mô tả:',
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: const Color(0xff007373),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 319 * fem,
                  ),
                  child: Text(
                    moTa,
                    style: SafeGoogleFont(
                      'Quicksand',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.25 * ffem / fem,
                      color: const Color(0xff993300),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
