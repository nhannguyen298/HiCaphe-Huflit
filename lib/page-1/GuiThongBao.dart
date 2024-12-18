import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class GuiThongBao extends StatefulWidget {
  @override
  _GuiThongBaoState createState() => _GuiThongBaoState();
}

class _GuiThongBaoState extends State<GuiThongBao> {
  String selectedValue = "Nhân Viên";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        child: Container(
          // guithongbaoHxu (385:1166)
          padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 17 * fem, 79 * fem),
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
                // autogroupwl2uegy (DCWGLf3Diz6TPiNnVTWL2u)
                margin:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                width: double.infinity,
                height: 143 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // logomauvuP (385:1168)
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
                      // caukhauhieuMjo (385:1169)
                      left: 5 * fem,
                      top: 114 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 322 * fem,
                          height: 29 * fem,
                          child: Text(
                            'Thưởng thức vị ngon trọn vẹn',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Dancing Script',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2 * ffem / fem,
                              letterSpacing: 1 * fem,
                              color: Color(0xff993300),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // vectoreZX (5:500)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 11 * fem, 0 * fem),
                      width: 30 * fem,
                      height: 30 * fem,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/page-1/images/vector.png',
                          width: 45 * fem,
                          height: 45 * fem,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // bieumaudangnhapv49 (385:1171)
                margin:
                EdgeInsets.fromLTRB(10 * fem, 0 * fem, 9 * fem, 0 * fem),
                padding:
                EdgeInsets.fromLTRB(25 * fem, 26 * fem, 24 * fem, 25 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xb2f5dab1),
                  borderRadius: BorderRadius.circular(30 * fem),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // group32jXP (385:1172)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 30 * fem),
                      width: double.infinity,
                      height: 36 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xff007373),
                        borderRadius: BorderRadius.circular(15 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Gửi thông báo',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Quicksand',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            color: Color(0xfffcf2d9),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            maxLines: 1,
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                                isDense: true,
                                hintStyle: TextStyle(color: Color(0xff007373)),
                                hintText: "Tiêu đề thông báo",
                                fillColor: Colors.white),
                          ),
                        )),
                    Container(
                      // group96qcM (385:1180)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 1 * fem, 30 * fem),
                      width: 258 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // textnhpmtkhuWiV (385:1181)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 14 * fem),
                            child: Text(
                              'Nội dung:',
                              style: SafeGoogleFont(
                                'Quicksand',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.25 * ffem / fem,
                                color: Color(0xff007373),
                              ),
                            ),
                          ),
                          Container(
                            // autogrouprtyxv1X (DCWGiUkC5DHJqt3GN1rtyX)
                            padding: EdgeInsets.fromLTRB(
                                11 * fem, 11 * fem, 11 * fem, 11 * fem),
                            width: double.infinity,
                            height: 183 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff007373)),
                              borderRadius: BorderRadius.circular(10 * fem),
                            ),
                            child: TextFormField(
                              maxLines: null,
                              // Cho phép nhập nhiều dòng văn bản
                              style: SafeGoogleFont(
                                'Quicksand',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.25 * ffem / fem,
                                color: Color(0xff777777),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Nhập nội dung vào đây ...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: DropdownButtonFormField<String>(
                        value: selectedValue, // Giá trị ban đầu
                        items: ["Nhân Viên", "Khách hàng", "Khác"]
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue =
                            newValue!; // Cập nhật giá trị khi thay đổi
                          });
                        },
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Color(0xff007373)),
                          hintText: "Đối tưởng gửi",
                          fillColor: Colors.white,

                        ),
                      ),
                    ),
                    Container(
                      // btndangnhapXBf (385:1178)
                      margin: EdgeInsets.fromLTRB(
                          44 * fem, 0 * fem, 45 * fem, 0 * fem),
                      width: double.infinity,
                      height: 40 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xff007373),
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: Center(
                        child: Center(
                          child: Text(
                            'Xác nhận gửi',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Quicksand',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2000000477 * ffem / fem,
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
    );
  }
}
