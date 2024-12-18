import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/model/Admin.dart';
import 'package:myapp/page-1/QuanLyKH.dart';
import 'package:myapp/page-1/LichSuMuaHang.dart';
import 'package:myapp/page-1/thongtinungdung.dart';
import 'package:myapp/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'DangNhap.dart';
import 'TaiKhoanKH.dart';
import 'Thongbao.dart';
import 'LienHe.dart';

class TrangChuKH extends StatefulWidget {
  @override
  TrangChuKHState createState() => TrangChuKHState();
}

class TrangChuKHState extends State<TrangChuKH> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('Users');

  Future<Admin?> getUserDataByUid(String uid) async {
    try {
      QuerySnapshot userQuery =
      await usersCollection.where('uid', isEqualTo: uid).get();

      if (userQuery.docs.isNotEmpty) {
        return Admin.fromFirestore(userQuery.docs.first);
      } else {
        print('User document does not exist for uid: $uid');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  Admin? khachhang;

  void fetchData() async {
    String? currentUserUid = FirebaseAuth.instance.currentUser?.uid;
    khachhang = await getUserDataByUid(currentUserUid!);

    if (khachhang != null) {
      print('User data: $khachhang');
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
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Có'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    final myImages = [
      Image.asset('assets/page-1/images/banner1.png', width: 800, scale: 0.85),
      Image.asset('assets/page-1/images/banner2.png', width: 800, scale: 0.85),
      Image.asset('assets/page-1/images/banner3.png', width: 800, scale: 0.85)
    ];

    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await _showExitConfirmationDialog(context);
        if (shouldExit == true) {
          SystemNavigator.pop();
        }
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
          child: Container(
            width: 220,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 240,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xff993300),
                      ),
                      child: Column(
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
                              child: khachhang?.hinhanh != null &&
                                  khachhang!.hinhanh.isNotEmpty
                                  ? Image.network(
                                khachhang!.hinhanh,
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
                              '${khachhang?.displayName}',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              '${khachhang?.email}',
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                        "assets/page-1/images/octicon_person-16.png"),
                    title: Text('Tài Khoản'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaiKhoanKH(
                                  khachhang: khachhang, id: khachhang!.id)));
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/page-1/images/lsdonhang.png"),
                    title: Text('Lịch sử đơn hàng'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DanhMucDonHangKH()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/page-1/images/ph_phone-fill.png"),
                    title: Text('Liên hệ'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LienHe()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset("assets/page-1/images/memory_alpha-i.png"),
                    title: Text('Thông tin phần mềm'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThongTinPhanMem()));
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                        "assets/page-1/images/ri_logout-box-r-line.png"),
                    title: Text('Đăng xuất'),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DangNhap()));
                      Fluttertoast.showToast(msg: 'Đăng xuất thành công!');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            height: 800 * fem,
            decoration: BoxDecoration(
              color: Color(0xfff5dab1),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0 * fem,
                  top: 0 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        19 * fem, 32 * fem, 14 * fem, 0 * fem),
                    width: 360 * fem,
                    height: 736 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              250 * fem, 0 * fem, 0 * fem, 15 * fem),
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1.88 * fem, 0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ThongBao()));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0.1 * fem, 1 * fem),
                                  width: 30 * fem,
                                  height: 30 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vectorthongbao.png',
                                    width: 30 * fem,
                                    height: 30 * fem,
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  onPressed: () =>
                                      _scaffoldKey.currentState?.openEndDrawer(),
                                  padding: EdgeInsets.zero,
                                  icon: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                    width: 26.25 * fem,
                                    height: 20.63 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/frame.png',
                                      width: 26.25 * fem,
                                      height: 20.63 * fem,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        CarouselSlider(
                            items: myImages,
                            options: CarouselOptions(
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              autoPlayCurve: Curves.fastOutSlowIn,
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 20 * fem, 6 * fem, 22 * fem),
                          padding: EdgeInsets.fromLTRB(26 * fem, 17 * fem,
                              31.4 * fem, 23 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff993300),
                            borderRadius: BorderRadius.circular(20 * fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f834d1e),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 2 * fem,
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 32 * fem, 11 * fem),
                                width: 150 * fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                      child: Text(
                                        'Sản phẩm bán chạy',
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.25,
                                          color: Color(0xfffcf2d9),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 47 * fem),
                                      child: Text(
                                        'Sữa lắc Hi',
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.25,
                                          color: Color(0xfffcf2d9),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => QuanLyKH()),
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 68.83 * fem, 0 * fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0 * fem,
                                                  0 * fem, 7.5 * fem, 0 * fem),
                                              child: Text(
                                                'Xem thêm',
                                                style: SafeGoogleFont(
                                                  'Quicksand',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.25,
                                                  color: Color(0xfffcf2d9),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                                              width: 11.33 * fem,
                                              height: 9.33 * fem,
                                              child: Image.asset(
                                                'assets/page-1/images/akar-icons-arrow-right.png',
                                                width: 11.33 * fem,
                                                height: 9.33 * fem,
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
                                width: 81.6 * fem,
                                height: 122 * fem,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10 * fem),
                                  child: Image.asset(
                                    'assets/page-1/images/image-22.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 155 * fem, 18 * fem),
                          child: Text(
                            'Điều đặc biệt tại quán',
                            style: SafeGoogleFont(
                              'Quicksand',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              color: Color(0xff993300),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 6 * fem, 0 * fem),
                          width: 321 * fem,
                          height: 162 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20 * fem),
                            child: Image.asset(
                              'assets/page-1/images/KhongGian.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 27 * fem,
                  top: 34 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 80 * fem,
                      height: 24 * fem,
                      child: Text(
                        'Hi ní!',
                        style: SafeGoogleFont(
                          'Quicksand',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Color(0xff007373),
                        ),
                      ),
                    ),
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
