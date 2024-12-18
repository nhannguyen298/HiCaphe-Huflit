import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/model/User.dart';
import 'package:myapp/page-1/CapNhatTaiKhoanQuanLy.dart';
import 'package:myapp/utils.dart';

class TaiKhoanQuanLy extends StatelessWidget {

  TaiKhoanQuanLy({super.key, required this.users});
  Users? users;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.94;
    return Scaffold(
      body:  Container(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 21*fem, 85*fem),
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
              margin: EdgeInsets.fromLTRB(0*fem, 30*fem, 280*fem, 0*fem),
              width: 45*fem,
              height: 45*fem,
              child: TextButton(
                onPressed:(){
                  Navigator.pop(context);
                } ,
                child: Image.asset(
                  'assets/page-1/images/vector.png',
                  width: 45*fem,
                  height: 45*fem,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(102*fem, 0*fem, 97*fem, 34*fem),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100*fem),
              ),
              child: Center(
                child: SizedBox(
                  width: 123*fem,
                  height: 123*fem,
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100*fem),
                    child: users?.hinhanh != null && users!.hinhanh.isNotEmpty
                        ? Image.network(
                      users!.hinhanh,
                      fit: BoxFit.cover,
                    )
                        : Image.asset(
                      'assets/page-1/images/image-16.png', // Replace with your default image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 0*fem, 31*fem),
              child: Text(
               users!.displayName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  height: 1.25*ffem/fem,
                  color: Color(0xff993300),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 1*fem, 42*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 152*fem, 0*fem),
                    child: Text(
                      'Giới tính',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.25*ffem/fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    users!.gioitinh,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.25*ffem/fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 1 *fem, 41.83*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 66*fem, 0*fem),
                    child: Text(
                      'Ngày sinh:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.25*ffem/fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    users!.ngaysinh,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.25*ffem/fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 1*fem, 41.38*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                    child: Text(
                      'Số điện thoại:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.25*ffem/fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    users!.sdt,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.25*ffem/fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(7*fem, 0*fem, 1*fem, 35.23*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 118*fem, 0*fem),
                    child: Text(
                      'Lương:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.25*ffem/fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Text(
                    users!.luong,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.25*ffem/fem,
                      color: Color(0xff993300),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 0*fem, 30*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 6.15*fem, 178*fem, 0*fem),
                    child: Text(
                      'Ca làm:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.25*ffem/fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 6.15*fem),
                    child: Text(
                      users!.calam,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.25*ffem/fem,
                        color: Color(0xff993300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  CapNhatTaiKhoanQuanLy(
                  hinhanh: users!.hinhanh,
                  displayName: users!.displayName,
                  sdt: users!.sdt,
                  calam: users!.calam,
                  luong: users!.luong,
                  ngaysinh: users!.ngaysinh,
                  gioitinh: users!.gioitinh,
                  uid: users!.uid,
                  email: users!.email,
                ),));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(34*fem, 0*fem, 30*fem, 0*fem),
                width: double.infinity,
                height: 36*fem,
                decoration: BoxDecoration (
                  color: Color(0xff007373),
                  borderRadius: BorderRadius.circular(15*fem),
                ),
                child: Center(
                  child: Text(
                    'Thay đổi thông tin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.25*ffem/fem,
                      color: Color(0xfffcf2d9),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
