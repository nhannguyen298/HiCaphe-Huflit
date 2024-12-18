import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/GioiThieu4.dart';
import 'package:page_transition/page_transition.dart';

class GioiThieu3 extends StatelessWidget {
  const GioiThieu3({super.key});

  @override
  Widget build(BuildContext context) {
    // double baseWidth = 360;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          // gioithieu3XtD (39:831)
          padding: const EdgeInsets.fromLTRB(32, 8, 29, 23),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/page-1/images/hinhnen2-bg.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // logomauxCq (39:853)
                margin: const EdgeInsets.fromLTRB(0, 0, 3, 33),
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/page-1/images/logomau.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // txtilgioithieu3dpm (42:454)
                margin: const EdgeInsets.fromLTRB(4, 0, 0, 47),
                child: Text(
                  'Liên tục',
                  style: SafeGoogleFont(
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
                // imggioithieu3E3s (44:489)
                margin: const EdgeInsets.fromLTRB(0, 0, 2, 146),
                width: 227,
                height: 227,
                child: Image.asset(
                  'assets/page-1/images/imggioithieu3.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                // txdegioithieu3J3j (44:481)
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 34),
                constraints: const BoxConstraints(
                  maxWidth: 299,
                ),
                child: Text(
                  'Tại Hi cà phê, cánh cửa luôn luôn mở để chào đón khách hàng đến trải nghiệm dịch vụ',
                  style: SafeGoogleFont(
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
                // autogroupmw4h6VP (HWRQA2aRU56pkDkHsMmW4H)
                margin: const EdgeInsets.fromLTRB(112, 0, 114, 22),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // oval33mbX (44:482)
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.5),
                        color: const Color(0x7fffffff),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Container(
                      // oval23FFo (44:483)
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.5),
                        color: const Color(0x7fffffff),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Container(
                      // oval13gM7 (44:484)
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.5),
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // autogroupfrh3C4Z (HWRQH7Cxb5PrBK6XLcFRh3)
                margin: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                width: 297,
                height: 42,
                decoration: BoxDecoration(
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
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const GioiThieu4()));
                  },
                  child: Text(
                    'Tiếp theo',
                    style: SafeGoogleFont(
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
