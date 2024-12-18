import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page-1/DanhMucNguyenLieu.dart';
import 'package:myapp/model/QuanLyNguyenLieu.dart';
import 'package:myapp/utils.dart';

class SuaNguyenLieu extends StatefulWidget {
  const SuaNguyenLieu(
      {super.key,
      required this.donGia,
      required this.donViTinh,
      required this.moTa,
      required this.ngayNhap,
      required this.slTonKho,
      required this.tenNL,
      required this.hinhAnh,
      required this.id});
  final String donGia, donViTinh, moTa, ngayNhap, slTonKho, tenNL, hinhAnh, id;

  @override
  State<SuaNguyenLieu> createState() => _SuaNguyenLieuState();
}

class _SuaNguyenLieuState extends State<SuaNguyenLieu> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDateupdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        ngayNhap.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  final TextEditingController donGia = TextEditingController();
  final TextEditingController donViTinh = TextEditingController();
  final TextEditingController moTa = TextEditingController();
  final TextEditingController ngayNhap = TextEditingController();
  final TextEditingController slTonKho = TextEditingController();
  final TextEditingController tenNL = TextEditingController();
  String imageURLNL = "";
  Future updateNguyenLieu(NguyenLieu nguyenLieu, String id) async {
    Map<String, dynamic> dulieuNL = {
      'donGia': nguyenLieu.donGia,
      'donViTinh': nguyenLieu.donVitinh,
      'hinhAnh': imageURLNL,
      'moTa': nguyenLieu.moTa,
      'ngayNhap': nguyenLieu.ngayNhap,
      'slTonKho': nguyenLieu.slTonKho,
      'tenNL': nguyenLieu.tenNL
    };
    // Kiểm tra nếu có ảnh URL, thì thêm nó vào dữ liệu cập nhật
    try {
      await FirebaseFirestore.instance
          .collection('RawMaterials')
          .doc(id)
          .update(dulieuNL);
      Fluttertoast.showToast(msg: 'Cập nhật thành công!');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Thêm thất bại', backgroundColor: Colors.red);
    }
  }

  final ImagePicker pickersupdateNL = ImagePicker();
  XFile? imagesupdateNL;
  Future<void> uploadImage(XFile newImages) async {
    setState(() {
      imagesupdateNL = newImages;
    });
    imageURLNL = await UploadImage();
  }

  // hàm đưa đưa dữ liệu lên Storage
  UploadImage() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("nguyenLieu"); // Ham lien ket vao storage
    try {
      final imageRef = storageRef.child(imagesupdateNL!.name);
      await imageRef.putFile(File(imagesupdateNL!.path));
      return imageURLNL = await imageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
      return '';
    }
  }

  // hàm hiện thông tin sản phầm lên giao diện chỉnh sửa
  @override
  void initState() {
    donGia.text = widget.donGia.toString();
    donViTinh.text = widget.donViTinh;
    moTa.text = widget.moTa;
    ngayNhap.text = widget.ngayNhap;
    slTonKho.text = widget.slTonKho;
    tenNL.text = widget.tenNL;
    imageURLNL = widget.hinhAnh;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
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
            // capnhatnguyenlieuPP7 (5:264)
            padding: EdgeInsets.fromLTRB(16 * fem, 16 * fem, 19 * fem, 0 * fem),
            width: double.infinity,
            height: 852,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/page-1/images/hinhnen1-bg.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupwxx5fLd (NueqzfwCZvEHy68GJkwXx5)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                  width: double.infinity,
                  height: 170 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // logomauaiV (5:266)
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
                        // caukhauhieuhHK (5:293)
                        left: 3 * fem,
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
                        // vectorac1 (5:294)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 20 * fem, 291 * fem, 53 * fem),
                        child: Align(
                          child: SizedBox(
                            width: 32 * fem,
                            height: 32 * fem,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const QuanLyNguyenLieu()));
                              },
                              child: Image.asset(
                                'assets/page-1/images/vector-uG5.png',
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
                  // bieumaudangnhapJ2D (5:267)
                  margin:
                      EdgeInsets.fromLTRB(10 * fem, 0 * fem, 7 * fem, 0 * fem),
                  padding: EdgeInsets.fromLTRB(
                      25 * fem, 26 * fem, 24 * fem, 28 * fem),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xb2f5dab1),
                    borderRadius: BorderRadius.circular(30 * fem),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // group32aEd (5:268)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 12 * fem),
                        width: double.infinity,
                        height: 36 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff007373),
                          borderRadius: BorderRadius.circular(15 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Thay đổi thông tin nguyên liệu',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Quicksand',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25 * ffem / fem,
                              color: const Color(0xfffcf2d9),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // txspxpdCu (5:273)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 12 * fem),
                        child: Text(
                          'Tải ảnh lên',
                          style: SafeGoogleFont(
                            'Quicksand',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            color: const Color(0xff007373),
                          ),
                        ),
                      ),
                      Container(
                        // frame53ugD (5:289)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 34 * fem),
                        width: 259 * fem,
                        height: 110 * fem,
                        child: TextButton(
                          onPressed: () async {
                            final newImages = await pickersupdateNL.pickImage(
                                source: ImageSource.gallery);
                            if (newImages == null) {
                              return;
                            }
                            uploadImage(newImages);
                          },
                          child: imagesupdateNL != null
                              ? Image.file(
                                  File(imagesupdateNL!.path),
                                  width: 259 * fem,
                                  height: 110 * fem,
                                )
                              : Image.network(
                                  widget.hinhAnh,
                                  width: 259 * fem,
                                  height: 110 * fem,
                                ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              controller: donGia,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xff007373)),
                                  hintText: "Đơn giá",
                                  fillColor: Colors.white),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              controller: donViTinh,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xff007373)),
                                  hintText: "Đơn vị tính",
                                  fillColor: Colors.white),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              maxLines: 2,
                              controller: moTa,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintStyle:
                                      TextStyle(color: Color(0xff007373)),
                                  hintText: "Mô tả",
                                  fillColor: Colors.white),
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: ngayNhap,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(fontSize: 12),
                            onTap: (){
                              _selectDateupdate(context);
                            },
                            decoration: InputDecoration(
                              hintText: "Ngày nhập",
                              hintStyle: TextStyle(color: Color(0xff007373)),
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () {
                                  // Mở datetime picker ở đây
                                  _selectDateupdate(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              controller: slTonKho,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xff007373)),
                                  hintText: "Số lượng tồn kho",
                                  fillColor: Colors.white),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: SizedBox(
                            height: 30,
                            child: TextFormField(
                              controller: tenNL,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xff007373)),
                                  hintText: "Tên nguyên liệu",
                                  fillColor: Colors.white),
                            ),
                          )),
                      Container(
                        // btndangnhapVgM (5:271)
                        margin: EdgeInsets.fromLTRB(
                            44 * fem, 0 * fem, 45 * fem, 0 * fem),
                        width: double.infinity,
                        height: 40 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff007373),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Center(
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const QuanLyNguyenLieu()));
                                double Gia = double.parse(donGia.text);
                                final UpdateNL = NguyenLieu(
                                    donGia: Gia,
                                    donVitinh: donViTinh.text,
                                    hinhAnh: imageURLNL,
                                    moTa: moTa.text,
                                    ngayNhap: ngayNhap.text,
                                    slTonKho: slTonKho.text,
                                    tenNL: tenNL.text);
                                updateNguyenLieu(UpdateNL, widget.id);
                              },
                              child: Text('Xác nhận thay đổi',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Quicksand',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2000000477 * ffem / fem,
                                    color: const Color(0xfffcf2d9),
                                  )),
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
    );
  }
}
