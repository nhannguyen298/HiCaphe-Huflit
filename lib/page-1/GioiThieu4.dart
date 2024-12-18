import 'package:flutter/material.dart';
import 'package:myapp/page-1/DangNhap.dart';
import 'package:myapp/utils.dart';

class GioiThieu4 extends StatelessWidget {
  const GioiThieu4({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return SafeArea(child: SizedBox(
      width: double.infinity,
      child: TextButton(
        // gioithieu4HNy (39:406)
        onPressed: () {},
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(17.5, 8, 26.5, 23),
          width: double.infinity,
          decoration: const BoxDecoration (
            color: Color(0xffffffff),
            image: DecorationImage (
              fit: BoxFit.cover,
              image: AssetImage (
                'assets/page-1/images/hinhnen1-1-bg.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // logomauAr5 (44:514)
                margin: const EdgeInsets.fromLTRB(9, 0, 0, 33),
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/page-1/images/logomau.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(                // txtilgioithieu42tH (44:515)
                margin: const EdgeInsets.fromLTRB(18, 0, 0, 47),

                child: Text(
                  'Đa dạng',
                  style: SafeGoogleFont (
                    'Quicksand',
                    fontSize: 24, // Increased font size
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    letterSpacing: 1,
                    color: const Color(0xff993300),
                  ),
                ),
              ),
              Container(
                // imggioithieu4oXf (44:524)
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 60),
                width: 213,
                height: 227,
                child: Image.asset(
                  'assets/page-1/images/imggioithieu4.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // txdegioithieu4t3K (44:525)
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 26),
                constraints: const BoxConstraints (
                  maxWidth: 297,
                ),
                child: Text(
                  'Với phần mềm kiểm soát bán hàng và đặt hàng trực tuyến đa tiện lợi giúp cho khách hàng, quản lí và nhân viên đều có thể dễ sử dụng',
                  style: SafeGoogleFont (
                    'Quicksand',
                    fontSize: 16, // Increased font size
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                    letterSpacing: 1,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // frame33iY9 (39:410)
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 41),
                width: double.infinity,
                height: 48,
                child: Center(
                  // caukhauhieuAuw (39:409)
                  child: SizedBox(
                    child: Container(
                      constraints: const BoxConstraints (
                        maxWidth: 316,
                      ),
                      child: Text(
                        'Hãy cùng Hi cà phê\nThưởng thức vị ngon trọn vẹn nhé!',
                        style: SafeGoogleFont (
                          'Dancing Script',
                          fontSize: 16, // Increased font size
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                          letterSpacing: 1,
                          color: const Color(0xff993300),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              GestureDetector(
                  child: Container(

                    // autogroupc5umoCD (HWRPsTDhzkfyg4dsA5c5Um)
                    margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                    width: 297,
                    height: 42,
                    decoration: BoxDecoration (
                      color: const Color(0xff993300),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Bắt đầu',
                        style: SafeGoogleFont (
                          'Quicksand',
                          fontSize: 20, // Increased font size
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                          letterSpacing: 1,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  const DangNhap()));
                  }
              )
            ],
          ),
        ),
      ),
    ));
  }
}