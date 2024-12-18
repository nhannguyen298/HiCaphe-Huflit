import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class SuaNhanVien extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 17*fem, 0*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
            image: DecorationImage (
              fit: BoxFit.cover,
              image: AssetImage (
                'assets/page-1/images/hinhnen1-bg.png',
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                  width: double.infinity,
                  height: 143*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 114*fem,
                        top: 16*fem,
                        child: Align(
                          child: SizedBox(
                            width: 100*fem,
                            height: 100*fem,
                            child: Image.asset(
                              'assets/page-1/images/logomau.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5*fem,
                        top: 114*fem,
                        child: Align(
                          child: SizedBox(
                            width: 322*fem,
                            height: 29*fem,
                            child: Text(
                              'Thưởng thức vị ngon trọn vẹn',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Dancing Script',
                                fontSize: 13*ffem,
                                fontWeight: FontWeight.bold,
                                height: 1.2*ffem/fem,
                                letterSpacing: 1*fem,
                                color: Color(0xff993300),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 32*fem,
                            height: 32*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-Hxd.png',
                              width: 32*fem,
                              height: 32*fem,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 9*fem, 0*fem),
                  padding: EdgeInsets.fromLTRB(25*fem, 26*fem, 24*fem, 31*fem),
                  width: double.infinity,
                  decoration: BoxDecoration (
                    color: Color(0xb2f5dab1),
                    borderRadius: BorderRadius.circular(30*fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                        width: double.infinity,
                        height: 36*fem,
                        decoration: BoxDecoration (
                          color: Color(0xff007373),
                          borderRadius: BorderRadius.circular(15*fem),
                        ),
                        child: Center(
                          child: Text(
                            'Thay đổi thông tin nhân viên',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.25*ffem/fem,
                              color: Color(0xfffcf2d9),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 172*fem, 12*fem),
                        child: Text(
                          'Tải ảnh lên',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.25*ffem/fem,
                            color: Color(0xff007373),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                        width: 259*fem,
                        height: 110*fem,
                        child: Image.asset(
                          'assets/page-1/images/frame-51.png',
                          width: 259*fem,
                          height: 110*fem,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 18*fem),
                        width: 258*fem,
                        height: 22*fem,
                        child: Text(
                          'Tên nhân viên',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.25*ffem/fem,
                            color: Color(0xff007373),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 24*fem),
                        width: 258*fem,
                        height: 22*fem,
                        child: Text(
                          'Chức vụ',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.25*ffem/fem,
                            color: Color(0xff007373),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(46*fem, 0*fem, 43*fem, 0*fem),
                        width: double.infinity,
                        height: 40*fem,
                        decoration: BoxDecoration (
                          color: Color(0xff007373),
                          borderRadius: BorderRadius.circular(20*fem),
                        ),
                        child: Center(
                          child: Center(
                            child: Text(
                              'Xác nhận thay đổi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.2*ffem/fem,
                                color: Color(0xfffcf2d9),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
