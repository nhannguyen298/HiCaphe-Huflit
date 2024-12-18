import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/TrangChuNew.dart';

class ThongBao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff9efd8), Color(0xfff5dab1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 16 * fem, 35 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TrangChuNew()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8 * fem),
                        decoration: BoxDecoration(
                          color: Color(0xff993300),
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24 * fem,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/page-1/images/logomau.png',
                            width: 100 * fem,
                            height: 100 * fem,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10 * fem),
                          Text(
                            'Thông báo',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.25 * ffem / fem,
                              letterSpacing: 1 * fem,
                              color: Color(0xff993300),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    buildNotificationCard(fem, ffem, 'Chúc mừng bạn đã nhận được mã giảm giá 5%!'),
                    buildNotificationCard(fem, ffem, 'Mã giảm giá 10% cho lần mua hàng tiếp theo!'),
                    buildNotificationCard(fem, ffem, 'Đăng ký thành công nhận ngay ưu đãi 20%!'),
                    buildNotificationCard(fem, ffem, 'Miễn phí vận chuyển cho đơn hàng trên 500k!'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationCard(double fem, double ffem, String text) {
    return Container(
      margin: EdgeInsets.fromLTRB(4 * fem, 0, 4 * fem, 20 * fem),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff993300)),
        color: Color(0xfffdf8ec),
        borderRadius: BorderRadius.circular(20 * fem),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10 * fem),
            width: 90 * fem,
            height: 70 * fem,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12 * fem),
              child: Image.asset(
                'assets/page-1/images/anhmagiamgia.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10 * fem),
              child: Text(
                text,
                style: SafeGoogleFont(
                  'Quicksand',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.25 * ffem / fem,
                  letterSpacing: 0.5 * fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
