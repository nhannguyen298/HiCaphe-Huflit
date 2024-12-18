import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class ThongTinPhanMem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(14 * fem, 16 * fem, 0 * fem, 0 * fem),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 8 * fem),
                width: 310 * fem,
                height: 149 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 114 * fem,
                      top: 16 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 100 * fem,
                          height: 100 * fem,
                          child: Image.asset(
                            'assets/page-1/images/logomau.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16 * fem,
                      top: 114 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 355 * fem,
                          height: 35 * fem,
                          child: Text(
                            'Thông tin ứng dụng',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.25 * ffem / fem,
                              letterSpacing: 1 * fem,
                              color: Color(0xff993300),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0 * fem,
                      top: 20 * fem,
                      child: Align(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 0 * fem, 0 * fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              'assets/page-1/images/vector.png',
                              width: 32 * fem,
                              height: 32 * fem,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 535 * fem,
                height: 784.04 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Container(
                        width: 535 * fem,
                        height: 784.04 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 6 * fem,
                              top: 421.4970703125 * fem,
                              child: Container(
                                width: 316 * fem,
                                height: 19 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 196 * fem, 0 * fem),
                                      child: Text(
                                        'Phiên bản',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '1.1.0',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        letterSpacing: 1 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 729.9113769531 * fem,
                              child: Container(
                                width: 330 * fem,
                                height: 19 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 195 * fem, 0 * fem),
                                      child: Text(
                                        'Phiên bản',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '1.1.0',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        letterSpacing: 1 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 6 * fem,
                              top: 516.5915527344 * fem,
                              child: Container(
                                width: 316 * fem,
                                height: 19 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 94 * fem, 0 * fem),
                                      child: Text(
                                        'Kích thước tải xuống',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '23MB',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        letterSpacing: 1 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 761.6098632812 * fem,
                              child: Container(
                                width: 330 * fem,
                                height: 22.43 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 95 * fem, 3.43 * fem),
                                      child: Text(
                                        'Kích thước tải xuống',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 3.43 * fem, 0 * fem, 0 * fem),
                                      child: Text(
                                        '23MB',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 185 * fem,
                                  height: 25 * fem,
                                  child: Text(
                                    'Về ứng dụng này',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0 * fem,
                              top: 384.6586914062 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 350 * fem,
                                  height: 25 * fem,
                                  child: Text(
                                    'Thông tin phần mềm ứng dụng',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0 * fem,
                              top: 623.6796875 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 350 * fem,
                                  height: 55 * fem,
                                  child: Text(
                                    'Khả năng tương thích với\nthiết bị đang hoạt động',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 30.8386230469 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 303 * fem,
                                  height: 55 * fem,
                                  child: Text(
                                    'Thanh toán tại cửa hàng, tích lũy và thưởng thức các quà thưởng.',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 78.8142089844 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 301 * fem,
                                  height: 80 * fem,
                                  child: Text(
                                    'Tiện lợi thanh toán bằng ứng dụng HI CÀ PHÊ để tích lũy điểm để nhận các quà thưởng với các chi tiêu của bạn tại cửa hàng.',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 159.3444824219 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 297 * fem,
                                  height: 98 * fem,
                                  child: Text(
                                    '* Thanh toán tiện lợi\nKhông cần mang theo ví, giờ đây bạn có thể thanh toán và tích lũy quà thưởng thông qua ứng dụng điện thoại.',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 256.15234375 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 301 * fem,
                                  height: 60 * fem,
                                  child: Text(
                                    '* Quà thưởng\nKiểm tra điểm thưởng cũng như quà thưởng trong tài khoản.',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 320.4055175781 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 298 * fem,
                                  height: 57 * fem,
                                  child: Text(
                                    '* Thông báo\nKhám phá những thông báo mới nhất từ HI CÀ PHÊ.',
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.25 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9 * fem,
                              top: 681.9357910156 * fem,
                              child: Container(
                                width: 412 * fem,
                                height: 40 * fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 179 * fem,
                                          height: 40 * fem,
                                          child: Text(
                                            'Khả năng\ntương thích',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.25 * ffem / fem,
                                              letterSpacing: 1 * fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 138 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 267 * fem,
                                          height: 40 * fem,
                                          child: Text(
                                            'Tương thích với thiết\nbị của bạn',
                                            style: TextStyle(
                                              fontFamily: 'Quicksand',
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.25 * ffem / fem,
                                              letterSpacing: 1 * fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 6 * fem,
                              top: 453.1950683594 * fem,
                              child: Container(
                                width: 317 * fem,
                                height: 19 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 98 * fem, 0 * fem),
                                      child: Text(
                                        'Cập nhập vào',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '15/09/2023',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        letterSpacing: 1 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 6 * fem,
                              top: 579.9880371094 * fem,
                              child: Container(
                                width: 317 * fem,
                                height: 19 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 80 * fem, 0 * fem),
                                      child: Text(
                                        'Ngày phát hành',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '15/09/2023',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        letterSpacing: 1 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 6 * fem,
                              top: 484.8930664062 * fem,
                              child: Container(
                                width: 320 * fem,
                                height: 19 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 68, 0 * fem),
                                      child: Text(
                                        'Tải xuống',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Trên 50.000 lượt tải',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        letterSpacing: 1 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 6 * fem,
                              top: 548.2895507812 * fem,
                              child: Container(
                                width: 316 * fem,
                                height: 19 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 30 * fem, 0 * fem),
                                      child: Text(
                                        'Nhà cung cấp',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'HI CÀ PHÊ company',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        letterSpacing: 1 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 51 * fem,
                              top: 615.1127929688 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 220 * fem,
                                  height: 1 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50 * fem,
                              top: 379.5180664062 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 220 * fem,
                                  height: 1 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}