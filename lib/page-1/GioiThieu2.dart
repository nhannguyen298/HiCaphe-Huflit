import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/GioiThieu3.dart';

import 'package:page_transition/page_transition.dart';
class GioiThieu2 extends StatelessWidget {
  const GioiThieu2({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return SafeArea(child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          // gioithieu27KF (42:408)
          padding: const EdgeInsets.fromLTRB(32, 8, 29, 23),
          width: double.infinity,
          decoration: const BoxDecoration (
            color: Color(0xffffffff),
            image: DecorationImage (
              fit: BoxFit.cover,
              image: AssetImage (
                'assets/page-1/images/hinhnen2-bg.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // logomauX85 (42:413)
                margin: const EdgeInsets.fromLTRB(0, 0, 3, 33),
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/page-1/images/logomau.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // txtilgioithieu29v9 (42:412)
                margin: const EdgeInsets.fromLTRB(4, 0, 0, 47),
                child: Text(
                  'Tiện lợi',
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
                // imggioithieu21QLH (44:478)
                margin: const EdgeInsets.fromLTRB(0, 0, 3, 126),
                width: 228,
                height: 227,
                child: Image.asset(
                  'assets/page-1/images/imggioithieu2-1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // txdegioithieu2tWM (42:414)
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 14),
                constraints: const BoxConstraints (
                  maxWidth: 299,
                ),

                child: Text(
                  textAlign: TextAlign.left,
                  'Từ không gian quán, thanh toán đến đặt hàng đều đa dạng. Mang đến sự hài lòng của khách khi đắm chìm vào các cuộc họp, học nhóm, trò chuyện, giải trí',
                  style: SafeGoogleFont (
                    'Quicksand',
                    fontSize: 15, // Increased font size
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                    letterSpacing: 1,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
              Container(
                // autogroupxdcuUzM (HWRQcgUgGuyGcLEhHUXDcu)
                margin: const EdgeInsets.fromLTRB(112, 0, 114, 22),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // oval32xed (42:415)
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(6.5),
                        color: const Color(0x7fffffff),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Container(
                      // oval22eGZ (42:416)
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(6.5),
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Container(
                      // oval12fhT (42:417)
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(6.5),
                        color: const Color(0x7fffffff),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                // autogroupuwj1nGH (HWRQkLvaP8a5CKCiDXuwJ1)
                margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                width: 297,
                height: 42,
                decoration: BoxDecoration (
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0, 4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: const GioiThieu3
                      ()));
                  },
                  child: Text(
                    'Tiếp theo',
                    style: SafeGoogleFont (
                      'Quicksand',
                      fontSize: 20, // Increased font size
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                      letterSpacing: 1,
                      color: const Color(0xff993300),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}