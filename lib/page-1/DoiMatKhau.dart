import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class DoiMatKhau extends StatelessWidget {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;



    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              child: Container(
                // capnhattaikhoankhachhang8tq (385:2130)
                padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 17*fem, 148*fem),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroup7jcbniV (WXgqhbbUpYQwu2GfWe7JcB)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 50*fem),
                      width: double.infinity,
                      height: 180*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // logomauuYD (385:2132)
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
                            // caukhauhieubvq (385:2133)
                            left: 5*fem,
                            top: 114*fem,
                            child: Align(
                              child: SizedBox(
                                width: 322*fem,
                                height: 29*fem,
                                child: Text(
                                  'Thưởng thức vị ngon trọn vẹn',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Dancing Script',
                                    fontSize: 24*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2*ffem/fem,
                                    letterSpacing: 1*fem,
                                    color: Color(0xff993300),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // vectorfvh (385:2134)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 32*fem,
                                height: 32*fem,
                                child: Image.asset(
                                  'assets/page-1/images/vector.png',
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
                      // bieumaudangnhapB8M (385:2135)
                      margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 9*fem, 0*fem),
                      padding: EdgeInsets.fromLTRB(25*fem, 26*fem, 24*fem, 23*fem),
                      width: double.infinity,
                      decoration: BoxDecoration (
                        color: Color(0xb2f5dab1),
                        borderRadius: BorderRadius.circular(30*fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // group32end (385:2136)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                            width: double.infinity,
                            height: 36*fem,
                            decoration: BoxDecoration (
                              color: Color(0xff007373),
                              borderRadius: BorderRadius.circular(15*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Đổi mật khẩu',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Quicksand',
                                  fontSize: 12*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.25*ffem/fem,
                                  color: Color(0xfffcf2d9),
                                ),
                              ),
                            ),
                          ),

                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: SizedBox(height: 30,
                                child: TextFormField(
                                  obscureText: !_passwordVisible,
                                  style: const TextStyle(fontSize: 14),
                                  decoration:  InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xff007373),
                                        ),
                                        onPressed: () {
                                            _passwordVisible = !_passwordVisible;
                                        },
                                      ),
                                      suffixIconColor: Color(0xff007373),
                                      hintStyle: TextStyle(color: Color(0xff007373)),
                                      hintText: "Nhập lại mật khẩu cũ ",
                                      fillColor: Colors.white),
                                ),)
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: SizedBox(height: 30,
                                child: TextFormField(
                                  obscureText: !_passwordVisible,
                                  style: const TextStyle(fontSize: 14),
                                  decoration:  InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xff007373),
                                        ),
                                        onPressed: () {
                                          _passwordVisible = !_passwordVisible;
                                        },
                                      ),
                                      hintStyle: TextStyle(color: Color(0xff007373)),
                                      hintText: "Nhập mật khẩu mới",
                                      fillColor: Colors.white),
                                ),)
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              child: SizedBox(height: 30,
                                child: TextFormField(
                                  obscureText: !_passwordVisible,
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0xff007373),
                                        ),
                                        onPressed: () {
                                          _passwordVisible = !_passwordVisible;
                                        },
                                      ),
                                      hintStyle: TextStyle(color: Color(0xff007373)),
                                      hintText: "Nhập lại mật khẩu mới",
                                      fillColor: Colors.white),
                                ),)
                          ),

                          Container(
                            // btndangnhapqnZ (385:2156)
                            margin: EdgeInsets.fromLTRB(44*fem, 0*fem, 45*fem, 0*fem),
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
                                  style: SafeGoogleFont (
                                    'Quicksand',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2000000477*ffem/fem,
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
        ),
      ),
    );
  }
}