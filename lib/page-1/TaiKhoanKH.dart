import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/model/Admin.dart';
import 'package:myapp/page-1/CapNhatTaiKhoanKhachHang.dart';
import 'package:myapp/page-1/QuanLyKH.dart';
import 'package:myapp/utils.dart';

class TaiKhoanKH extends StatelessWidget {
  Admin? khachhang;
  String id;
  TaiKhoanKH({super.key, required this.khachhang, required this.id});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 22*fem, 85*fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/page-1/images/hinhnen1-bg.png',
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 290*fem, 20*fem),
                    width: 32*fem,
                    height: 32*fem,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuanLyKH()));
                      },
                      child: Image.asset(
                        'assets/page-1/images/vector.png',
                        width: 32*fem,
                        height: 32*fem,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100*fem),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 123*fem,
                        height: 123*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100*fem),
                          child: khachhang?.hinhanh != null && khachhang!.hinhanh.isNotEmpty
                              ? Image.network(
                            khachhang!.hinhanh,
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
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 30*fem),
                    child: Text(
                      khachhang!.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        height: 1.25*ffem/fem,
                        color: Color(0xff993300),
                      ),
                    ),
                  ),
                  buildInfoCard(fem, ffem, 'Số điện thoại:', khachhang!.sdt, context),
                  buildInfoCard(fem, ffem, 'Email:', khachhang!.email, context),
                  buildInfoCard(fem, ffem, 'Địa chỉ:', khachhang!.diachi, context),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CapNhatTaiKhoanKhachHang(
                            diaChi: khachhang!.diachi,
                            displayName: khachhang!.displayName,
                            email: khachhang!.email,
                            hinhanh: khachhang!.hinhanh,
                            sdt: khachhang!.sdt,
                            id: id,
                            uid: khachhang!.uid,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(34*fem, 20*fem, 29*fem, 0*fem),
                      width: double.infinity,
                      height: 50*fem,
                      decoration: BoxDecoration(
                        color: Color(0xff993300),
                        borderRadius: BorderRadius.circular(15*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Thay đổi thông tin',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            height: 1.25*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(double fem, double ffem, String title, String content, BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 7*fem, 20*fem),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff007373)),
        color: Color(0xfffdf8ec),
        borderRadius: BorderRadius.circular(15*fem),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      padding: EdgeInsets.all(12*fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,  // tăng kích thước chữ
              fontWeight: FontWeight.w800,  // đậm hơn
              height: 1.25*ffem/fem,
              color: Color(0xff007373),
            ),
          ),
          SizedBox(height: 8*fem),  // khoảng cách giữa tiêu đề và nội dung
          Text(
            content,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,  // tăng kích thước chữ
              fontWeight: FontWeight.w600,  // đậm hơn
              height: 1.25*ffem/fem,
              color: Color(0xff993300),
            ),
          ),
        ],
      ),
    );
  }
}
