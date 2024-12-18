import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:myapp/page-1/DanhMucDonHang.dart';
import 'package:myapp/page-1/DanhSachNhanVien.dart';
import 'package:myapp/page-1/GuiThongBao.dart';
import 'package:myapp/page-1/TaiKhoanQuanLy.dart';
import 'package:myapp/page-1/DanhMucNguyenLieu.dart';
import 'package:myapp/page-1/ThongTinUngDung.dart';
import 'package:myapp/utils.dart';
import '../model/User.dart';
import 'DangNhap.dart';
import 'ThongKeDanhThu.dart';
import 'danhmucsanpham.dart';
import 'LienHe.dart';


class TrangChuNew extends StatefulWidget {
  const TrangChuNew({Key? key});

  @override
  State<TrangChuNew> createState() => _TrangChuNewState();
}

class _TrangChuNewState extends State<TrangChuNew> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

  Future<Users?> getUserDataByUid(String uid) async {
    try {
      QuerySnapshot userQuery = await usersCollection.where('uid', isEqualTo: uid).get();

      if (userQuery.docs.isNotEmpty) {
        // Chỉ lấy dữ liệu của user đầu tiên vì uid nên là duy nhất
        return Users.fromFirestore(userQuery.docs.first);
      } else {
        print('User document does not exist for uid: $uid');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
  Users? users;
  void fetchData() async {
    String? currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    users = await getUserDataByUid(currentUserUid!);

    // Now you can use the userData
    if (users != null) {
      print('User data: $users');
      setState(() {});
    } else {
      print('User data not found.');
    }
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<bool?> _showExitConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Xác nhận thoát ứng dụng'),
          content: const Text('Bạn có chắc chắn muốn thoát ứng dụng không?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Không'),
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Người dùng không đồng ý thoát
              },
            ),
            TextButton(
              child: const Text('Có'),
              onPressed: () {
                Navigator.of(context).pop(true); // Người dùng đồng ý thoát
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return
      WillPopScope(
        onWillPop: () async {
          final shouldExit = await _showExitConfirmationDialog(context);
          if (shouldExit == true) {
            SystemNavigator.pop();
          }
          return false; // Ngăn chặn xử lý "Back" mặc định khác
        },
        child:
        AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent, // Đặt màu trong suốt cho thanh trạng thái
            ),
            child:

            Scaffold(
              key:_scaffoldKey,
              endDrawer:
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  child: Container(
                    width: 220,
                    child: Drawer(
                      backgroundColor: Color(0xffFEF7E5),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          SizedBox(
                            height: 260,
                            child: DrawerHeader(
                              decoration: BoxDecoration(
                                color: Color(0xffE47905),
                              ),
                              child:
                              Column(
                                mainAxisSize: MainAxisSize.max,

                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: users?.hinhanh != null && users!.hinhanh.isNotEmpty
                                          ? Image.network(
                                        users!.hinhanh,
                                        fit: BoxFit.cover,
                                      )
                                          : Image.asset(
                                        "assets/page-1/images/image-16.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Text(
                                      '${users?.displayName}',
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xffFEF7E5)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                    child: Text(
                                      '${users?.email}',
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xffFEF7E5)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Image.asset("assets/page-1/images/octicon_person-16.png", color: Color(0xffE47905),),
                            title: Text('Tài Khoản', style: TextStyle(color: Color(0xffE47905)),),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> TaiKhoanQuanLy(users: users)));
                            },
                          ),
                          ListTile(
                            leading: Image.asset("assets/page-1/images/ph_phone-fill.png", color: Color(0xffE47905),),
                            title: Text('Liên hệ', style: TextStyle(color: Color(0xffE47905)),),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LienHe()));
                            },
                          ),
                          ListTile(
                            leading: Image.asset("assets/page-1/images/memory_alpha-i.png", color: Color(0xffE47905),),
                            title: Text('Thông tin phần mềm', style: TextStyle(color: Color(0xffE47905)),),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ThongTinPhanMem()));
                            },
                          ),
                          ListTile(
                            leading: Image.asset("assets/page-1/images/ri_logout-box-r-line.png", color: Color(0xffE47905),),
                            title: Text('Đăng xuất', style: TextStyle(color: Color(0xffE47905)),),
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const DangNhap()));
                              Fluttertoast.showToast(msg: 'Đăng xuất thành công!');
                            },
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              body: SizedBox(
                width: double.infinity,
                height: 900,
                child: Container(
                  // trangchuyUm (301:64)
                  padding: EdgeInsets.fromLTRB(19*fem, 32*fem, 14*fem,0*fem),
                  width: double.infinity,
                  decoration: BoxDecoration (
                    color: Color(0xffFEF7E5),
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
                        // autogroupsic9FhB (SiudYCxoSZP1BzW9DoSic9)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                        width: double.infinity,
                        height: 148*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // group42Baq (301:66)
                              left: 290*fem,
                              top: 1*fem,
                              child: Align(
                                  child: Container(
                                    // frameCcH (301:109)
                                    child: IconButton(
                                      onPressed: ()=>_scaffoldKey.currentState?.openEndDrawer()
                                      ,
                                      padding: EdgeInsets.zero,
                                      icon: Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                        width: 26.25*fem,
                                        height: 20.63*fem,
                                        child: Image.asset(
                                            'assets/page-1/images/frame.png',
                                            width: 26.25*fem,
                                            height: 20.63*fem,
                                            color: Color(0xffE47905)
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),
                            Positioned(
                              // logomau5gD (301:70)
                              left: 111*fem,
                              top: 0*fem,
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
                              // caukhauhieubPf (301:71)
                              left: 0*fem,
                              top: 98*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 322*fem,
                                  height: 29*fem,
                                  child: Text(
                                    'Thưởng thức vị ngon trọn vẹn',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Dancing Script',
                                      fontSize: 22*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2*ffem/fem,
                                      letterSpacing: 1*fem,
                                      color: Color(0xffE47905),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupoqwfH1b (Siudf7vwzeSfSFxiqxoqwf)
                        margin: EdgeInsets.fromLTRB(25 * fem, 0 * fem, 30 * fem, 65 * fem),
                        width: double.infinity,
                        height: 135 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // group60QM7 (301:73)
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 76 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(14 * fem, 13 * fem, 14 * fem, 15 * fem),
                              width: 98 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFFD9220)),
                                color: Color(0xCCFEF7E5),
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DanhMucSanPham()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // coffeecuptXB (301:76)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                      width: 64 * fem,
                                      height: 64 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/coffee-cup.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      // qunlsnphmR1K (301:75)
                                      constraints: BoxConstraints(
                                        maxWidth: 70 * fem,
                                      ),
                                      child: Text(
                                        'Quản lý\nSản phẩm',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Quicksand',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25*ffem/fem,
                                          color: Color(0xffE47905),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // group617uj (301:77)
                              padding: EdgeInsets.fromLTRB(8.5 * fem, 13 * fem, 8.5 * fem, 15 * fem),
                              width: 98 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFFD9220)),
                                color: Color(0xCCFEF7E5),
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QuanLyNguyenLieu()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // coffeebagRfX (301:80)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                      width: 64 * fem,
                                      height: 64 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/coffee-bag.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      // qunlnguynliu9bX (301:79)
                                      constraints: BoxConstraints(
                                        maxWidth: 81 * fem,
                                      ),
                                      child: Text(
                                        'Quản lý\nNguyên liệu',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Quicksand',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25*ffem/fem,
                                          color: Color(0xffE47905),
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
                      Container(
                        // group753gu (301:81)
                        margin: EdgeInsets.fromLTRB(27 * fem, 0 * fem, 28 * fem, 65 * fem),
                        width: double.infinity,
                        height: 135 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // group60AmX (301:82)
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 76 * fem, 0 * fem),
                              padding: EdgeInsets.fromLTRB(15 * fem, 16 * fem, 15 * fem, 15 * fem),
                              width: 98 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFFD9220)),
                                color: Color(0xCCFEF7E5),
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DanhSachNhanVien()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // staffFHB (301:85)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                      width: 64 * fem,
                                      height: 64 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/staff.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      // qunlnhnvinn2D (301:84)
                                      constraints: BoxConstraints(
                                        maxWidth: 68 * fem,
                                      ),
                                      child: Text(
                                        'Quản lý\nNhân viên',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Quicksand',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25*ffem/fem,
                                          color: Color(0xffE47905),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // group65HUm (301:86)
                              padding: EdgeInsets.fromLTRB(14 * fem, 13 * fem, 13 * fem, 15 * fem),
                              width: 98 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFFD9220)),
                                color: Color(0xCCFEF7E5),
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThongKeDoanhThu()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // piechartPnh (301:89)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 5 * fem, 8 * fem),
                                      width: 64 * fem,
                                      height: 64 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/pie-chart.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      // thngkdoanhthu7ih (301:88)
                                      constraints: BoxConstraints(
                                        maxWidth: 71 * fem,
                                      ),
                                      child: Text(
                                        'Thống kê\nDoanh thu',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Quicksand',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.25*ffem/fem,
                                          color: Color(0xffE47905),
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
                      Container(
                        // autogrouplxjhEoK (SiudrXmbsWjBipTvKWLXJh)
                        margin: EdgeInsets.fromLTRB(25 * fem, 0 * fem, 30 * fem, 0 * fem),
                        width: double.infinity,
                        height: 135 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // group93ZKo (301:91)
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 76 * fem, 0 * fem),
                              width: 98 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: Container(
                                // group91tss (301:92)
                                padding: EdgeInsets.fromLTRB(15.18 * fem, 19 * fem, 14.82 * fem, 6 * fem),
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFFD9220)),
                                  color: Color(0xCCFEF7E5),
                                  borderRadius: BorderRadius.circular(10 * fem),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DanhMucDonHang()));
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // checkCtZ (301:95)
                                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.36 * fem, 11 * fem),
                                        width: 64 * fem,
                                        height: 64 * fem,
                                        child: Image.asset(
                                          'assets/page-1/images/check.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        // qunlnhng8nD (301:94)
                                        constraints: BoxConstraints(
                                          maxWidth: 68 * fem,
                                        ),
                                        child: Text(
                                          'Quản lý \nĐơn hàng',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Quicksand',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.25*ffem/fem,
                                            color: Color(0xffE47905),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // group95RmK (301:96)
                              width: 98 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: Container(
                                // group93yXw (301:97)
                                padding: EdgeInsets.fromLTRB(15.18 * fem, 19 * fem, 14.82 * fem, 6 * fem),
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFFD9220)),
                                  color: Color(0xCCFEF7E5),
                                  borderRadius: BorderRadius.circular(10 * fem),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => GuiThongBao()));
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // checkCtZ (301:95)
                                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.36 * fem, 11 * fem),
                                        width: 64 * fem,
                                        height: 64 * fem,
                                        child: Image.asset(
                                          'assets/page-1/images/Loudspeaker.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        // qunlnhng8nD (301:94)
                                        constraints: BoxConstraints(
                                          maxWidth: 68 * fem,
                                        ),
                                        child: Text(
                                          'Thông Báo',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Quicksand',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.25*ffem/fem,
                                            color: Color(0xffE47905),
                                          ),
                                        ),
                                      ),
                                    ],
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
            )
        ),
      );
  }
}