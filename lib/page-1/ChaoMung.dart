import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/page-1/GioiThieu1.dart';
import 'package:myapp/utils.dart';
import 'package:page_transition/page_transition.dart';

class GioiThieuPage extends StatelessWidget {
  final Widget? child;
  const GioiThieuPage({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          GioiThieu1(),
        ],
      ),
    );
  }
}

class ChaoMungPage extends StatefulWidget {
  final Widget child;
  const ChaoMungPage({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _ChaoMungPageState();
}

class _ChaoMungPageState extends State<ChaoMungPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: const GioiThieuPage(),
          type: PageTransitionType.bottomToTop,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Container(
          padding: const EdgeInsets.fromLTRB(44, 219, 43, 342),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/page-1/images/hinhnen1-bg.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 39 * fem),
                width: 176 * fem,
                height: 176 * fem,
                child: Image.asset(
                  'assets/page-1/images/logomau.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Thưởng thức vị ngon trọn vẹn',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Dancing Script',
                  fontSize: 22 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1 * ffem / fem,
                  letterSpacing: 1 * fem,
                  color: const Color(0xff993300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
