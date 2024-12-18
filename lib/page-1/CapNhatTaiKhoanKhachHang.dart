import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-1/QuanLyKH.dart';
import 'package:myapp/utils.dart';

class CapNhatTaiKhoanKhachHang extends StatefulWidget {
  const CapNhatTaiKhoanKhachHang(
      {super.key,
      required this.diaChi,
      required this.displayName,
      required this.email,
      required this.hinhanh,
      required this.sdt,
      required this.id,
      required this.uid});

  final String diaChi, displayName, email, hinhanh, sdt, id, uid;

  @override
  State<CapNhatTaiKhoanKhachHang> createState() =>
      _CapNhatTaiKhoanKhachHangState();
}

class _CapNhatTaiKhoanKhachHangState extends State<CapNhatTaiKhoanKhachHang> {
  final TextEditingController diaChi = TextEditingController();
  final TextEditingController displayName = TextEditingController();
  final TextEditingController sdt = TextEditingController();
  final TextEditingController email = TextEditingController();
  String hinhanh = "";
  final ImagePicker pickersupdateKH = ImagePicker();
  XFile? imagesupdateKH;

  UploadImage() async {
    final storageRef = FirebaseStorage.instance.ref().child("khachHang");
    try {
      final imageRef = storageRef.child(imagesupdateKH!.name);
      await imageRef.putFile(File(imagesupdateKH!.path));
      return hinhanh = await imageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
      return '';
    }
  }

  Future<void> uploadImage(XFile newImages) async {
    setState(() {
      imagesupdateKH = newImages;
    });
    hinhanh = await UploadImage();
  }

  @override
  void initState() {
    diaChi.text = widget.diaChi;
    displayName.text = widget.displayName;
    sdt.text = widget.sdt;
    email.text = widget.email;
    hinhanh = widget.hinhanh;
    super.initState();
  }

  Future<void> updateUserInfo() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('uid', isEqualTo: widget.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        Map<String, dynamic> dataToUpdate = {
          'hinhAnh': hinhanh,
          'displayName': displayName.text,
          'sdt': sdt.text,
          'email': email.text,
          'diaChi': diaChi.text,
        };

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(documentId)
            .update(dataToUpdate);

        Fluttertoast.showToast(msg: 'Cập nhật thông tin thành công!');
      } else {
        Fluttertoast.showToast(
          msg: 'Không tìm thấy người dùng để cập nhật',
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Cập nhật thông tin thất bại',
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 380;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            width: double.infinity,
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(26 * fem, 16 * fem, 17 * fem, 127 * fem),
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
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 16 * fem),
                    width: double.infinity,
                    height: 143 * fem,
                    child: Stack(
                      children: [
                        Positioned(
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
                          left: 5 * fem,
                          top: 112 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 322 * fem,
                              height: 60 * fem,
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
                        Positioned(
                          left: 0 * fem,
                          top: 30 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 32 * fem,
                              height: 32 * fem,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuanLyKH()));
                                },
                                child: Image.asset(
                                  'assets/page-1/images/vector.png',
                                  width: 32 * fem,
                                  height: 32 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        10 * fem, 0 * fem, 9 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        25 * fem, 26 * fem, 24 * fem, 23 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xb2f5dab1),
                      borderRadius: BorderRadius.circular(30 * fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 12 * fem),
                          width: double.infinity,
                          height: 36 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff007373),
                            borderRadius: BorderRadius.circular(15 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Cập nhật tài khoản',
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
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 170 * fem, 12 * fem),
                          child: Text(
                            'Tải ảnh lên',
                            softWrap: false,
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
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 25 * fem),
                          width: 259 * fem,
                          height: 110 * fem,
                          child: GestureDetector(
                            onTap: () async {
                              final newImages = await pickersupdateKH.pickImage(
                                  source: ImageSource.gallery);
                              if (newImages == null) {
                                return;
                              }
                              uploadImage(newImages);
                            },
                            child: imagesupdateKH != null
                                ? Image.file(
                                    File(imagesupdateKH!.path),
                                    width: 259 * fem,
                                    height: 110 * fem,
                                  )
                                : widget.hinhanh != null &&
                                        widget.hinhanh.isNotEmpty
                                    ? Image.network(
                                        widget.hinhanh,
                                        width: 259 * fem,
                                        height: 110 * fem,
                                      )
                                    : Image.asset(
                                        'assets/page-1/images/image-16.png', // Replace with your default image path
                                        width: 200 * fem,
                                        height: 110 * fem,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              controller: displayName,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xff007373)),
                                hintText: "Họ và tên",
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              controller: sdt,
                              style: const TextStyle(fontSize: 12),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xff007373)),
                                hintText: "Số điện thoại",
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              controller: email,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xff007373)),
                                hintText: "Email",
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: SizedBox(
                            height: 70,
                            child: TextFormField(
                              controller: diaChi,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Color(0xff007373)),
                                hintText: "Địa chỉ",
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updateUserInfo();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuanLyKH()));
                          },
                          child: Container(
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
                                  'Xác nhận thay đổi',
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
