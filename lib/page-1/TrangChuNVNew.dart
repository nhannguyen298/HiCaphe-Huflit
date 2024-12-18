  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:fluttertoast/fluttertoast.dart';
  import 'dart:ui';
  import 'package:myapp/page-1/DanhMucDonHang.dart';
  import 'package:myapp/page-1/DanhMucSanPham.dart';
  import 'package:myapp/page-1/TaiKhoanNhanVien.dart';
  import 'package:myapp/page-1/DanhMucNguyenLieu.dart';
  import 'package:myapp/page-1/ThongTinUngDung.dart';
  import 'package:myapp/utils.dart';
  import '../model/User.dart';
  import 'DangNhap.dart';
  import 'Thongbao.dart';
  import 'LienHe.dart';

  class TrangChuNVNew extends StatefulWidget{
    @override
    TrangChuNVNewState createState() => TrangChuNVNewState();

  }

  class TrangChuNVNewState extends State<TrangChuNVNew> {
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
    Users? usersNV;
    void fetchData() async {
      String? currentUserUid = FirebaseAuth.instance.currentUser?.uid;
      usersNV = await getUserDataByUid(currentUserUid!);

      // Now you can use the userData
      if (usersNV != null) {
        print('User data: $usersNV');
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
                                    child: usersNV?.hinhanh != null && usersNV!.hinhanh.isNotEmpty
                                        ? Image.network(
                                      usersNV!.hinhanh,
                                      fit: BoxFit.cover,
                                    )
                                        : Image.asset(
                                      "assets/page-1/images/ellipse-3-bg.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text(
                                    '${usersNV?.displayName}',
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
                                    '${usersNV?.email}',
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> TaiKhoanNhanVien(usersNV: usersNV)));
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
            body: Container(
              width: double.infinity,
              child: Container(
                // trangchunvQH7 (301:101)
                padding: EdgeInsets.fromLTRB(19*fem, 32*fem, 14*fem, 0*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: Color(0xfffcf2d9),
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
                      // autogrouprpkjHLu (SiuegB4tBzdf6yAYNjrpKj)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 45*fem),
                      width: double.infinity,
                      height: 132*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // group421Gu (301:103)
                            left: 260*fem,
                            top: 20*fem,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                              width: 75*fem,
                              height: 31*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ThongBao()));
                                    },
                                    child: Container(
                                      // vectorthongbaoVFn (180:63)
                                      margin: EdgeInsets.fromLTRB(2*fem, 2*fem, 0*fem, 1*fem),
                                      width: 23*fem,
                                      height: 60*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/clarity-notification-solid-badged.png',
                                        width: 30*fem,
                                        height: 30*fem,
                                        color: Color(0xffE47905),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // frameCcH (301:109)
                                    child: IconButton(
                                      onPressed: ()=>_scaffoldKey.currentState?.openEndDrawer()

                                      ,
                                      padding: EdgeInsets.zero,
                                      icon: Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                        width: 26*fem,
                                        height: 26*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/frame.png',
                                          width: 26*fem,
                                          height: 23*fem,
                                          color: Color(0xffE47905),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // logomauv2V (301:112)
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
                            // caukhauhieuRjw (301:113)
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
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  DanhMucSanPham()));
                      },
                      child: Container(
                        // group897Ms (301:114)
                        margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 31*fem, 50*fem),
                        padding: EdgeInsets.fromLTRB(66*fem, 13*fem, 66*fem, 23*fem),
                        width: double.infinity,
                        decoration: BoxDecoration (
                          border: Border.all(color: Color(0xFFFD9220)),
                          color: Color(0xCCFEF7E5),
                          borderRadius: BorderRadius.circular(10*fem),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Container(
                              // coffeecupQ65 (301:117)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                              width: 64*fem,
                              height: 64*fem,
                              child: Image.asset(
                                'assets/page-1/images/coffee-cup.png',
                                fit: BoxFit.cover,
                              ),
                            ),

                            Text(
                              // qunlsnphm8Gy (301:116)
                              'Quản lý sản phẩm',
                              textAlign: TextAlign.center,
                              overflow:TextOverflow.clip,
                              softWrap:false,
                              style: SafeGoogleFont (
                                'Quicksand',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.25*ffem/fem,
                                color: Color(0xffE47905),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  QuanLyNguyenLieu()));
                      },
                      child: Container(
                        // group90rCy (301:118)
                        margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 30*fem, 50*fem),
                        padding: EdgeInsets.fromLTRB(64*fem, 13*fem, 62*fem, 10*fem),
                        width: double.infinity,
                        decoration: BoxDecoration (
                          border: Border.all(color: Color(0xffE47905)),
                          color: Color(0xCCFEF7E5),
                          borderRadius: BorderRadius.circular(10*fem),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // coffeebagXa1 (301:121)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 17*fem),
                              width: 64*fem,
                              height: 64*fem,
                              child: Image.asset(
                                'assets/page-1/images/coffee-bag.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              // qunlnguynliuFW1 (301:120)
                              'Quản lý nguyên liệu',
                              textAlign: TextAlign.center,
                              softWrap:false,
                              style: SafeGoogleFont (
                                'Quicksand',
                                fontSize: 15*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.25*ffem/fem,
                                color: Color(0xffE47905),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  DanhMucDonHang()));
                      },
                      child: Container(
                        // group92Ass (301:122)
                        margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 31*fem, 0*fem),
                        width: double.infinity,
                        height: 140*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(10*fem),
                        ),
                        child: Container(
                          // group917HK (301:123)
                          padding: EdgeInsets.fromLTRB(67*fem, 21*fem, 67*fem, 0*fem),
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            border: Border.all(color: Color(0xffE47905)),
                            color: Color(0xCCFEF7E5),
                            borderRadius: BorderRadius.circular(10*fem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // check1tV (301:126)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                width: 64*fem,
                                height: 64*fem,
                                child: Image.asset(
                                  'assets/page-1/images/check.png',

                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                // qunlnhngY7j (301:125)
                                'Quản lý đơn hàng',
                                textAlign: TextAlign.center,
                                softWrap:false,
                                style: SafeGoogleFont (
                                  'Quicksand',
                                  fontSize: 15*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25*ffem/fem,
                                  color: Color(0xffE47905),
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
            ),

          ),
        );
    }
  }
