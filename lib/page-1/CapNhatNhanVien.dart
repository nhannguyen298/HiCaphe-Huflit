import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/model/NhanVien.dart';
import 'package:myapp/page-1/DanhSachNhanVien.dart';
import 'package:myapp/utils.dart';

class SuaNhanVien extends StatefulWidget {
  const SuaNhanVien({
    super.key,
    required this.calam,
    required this.hinhAnh,
    required this.luong,
    required this.ngaySinh,
    required this.sodienthoai,
    required this.tenNV,
    required this.id,
    required this.gioiTinh,
  });
  final String calam,
      hinhAnh,
      luong,
      ngaySinh,
      sodienthoai,
      tenNV,
      gioiTinh,
      id;

  @override
  State<SuaNhanVien> createState() => _SuaNhanVienState();
}

class _SuaNhanVienState extends State<SuaNhanVien> {
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
        ngaySinh.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  // khởi tạo ngày hôm nay của phần thêm ngày sinh
  DateTime selectedDate = DateTime.now();
  final TextEditingController luong = TextEditingController();
  final TextEditingController ngaySinh = TextEditingController();
  final TextEditingController sodienthoai = TextEditingController();
  final TextEditingController tenNV = TextEditingController();
  String gentle = "Khác";
  String calam = "Sáng"; // Giá trị ban đầu
  String imageURLNV = "";
  Future updateNhanvien(NhanVien nhanvien, String id) async {
    Map<String, dynamic> dulieuNV = {
      'caLam': nhanvien.caLam,
      'hinhAnh': imageURLNV,
      'luong': nhanvien.luong,
      'ngaySinh': nhanvien.ngaySinh,
      'sdt': nhanvien.sdt,
      'tenNV': nhanvien.tenNV,
      'gioiTinh': nhanvien.gioiTinh,
    };
    // Kiểm tra nếu có ảnh URL, thì thêm nó vào dữ liệu cập nhật
    try {
      await FirebaseFirestore.instance
          .collection('Staff')
          .doc(id)
          .update(dulieuNV);
      Fluttertoast.showToast(msg: 'Cập nhật thành công!');
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Cập nhật thất bại', backgroundColor: Colors.red);
    }
  }

  final ImagePicker pickersupdateNV = ImagePicker();
  XFile? imagesupdateNV;
  Future<void> uploadImage(XFile newImages) async {
    setState(() {
      imagesupdateNV = newImages;
    });
    imageURLNV = await UploadImage();
  }

  // hàm đưa đưa dữ liệu lên Storage
  UploadImage() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("nhanVien"); // Ham lien ket vao storage
    try {
      final imageRef = storageRef.child(imagesupdateNV!.name);
      await imageRef.putFile(File(imagesupdateNV!.path));
      return imageURLNV = await imageRef.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e);
      return '';
    }
  }

  // hàm hiện thông tin sản phầm lên giao diện chỉnh sửa
  @override
  void initState() {
    calam = widget.calam;
    luong.text = widget.luong.toString();
    ngaySinh.text = widget.ngaySinh;
    sodienthoai.text = widget.sodienthoai;
    tenNV.text = widget.tenNV;
    imageURLNV = widget.hinhAnh;
    gentle = widget.gioiTinh;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              height: 818,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 16 * fem, 17 * fem, 0 * fem),
                width: double.infinity,
                height: 800,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/page-1/images/hinhnen1-bg.png'),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 13 * fem),
                        width: double.infinity,
                        height: 140 * fem,
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
                              top: 114 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 322 * fem,
                                  height: 32 * fem,
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
                              top: 0 * fem,
                              child: Align(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DanhSachNhanVien()));
                                  },
                                  child: SizedBox(
                                    width: 32 * fem,
                                    height: 32 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/vector-Hxd.png',
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
                            25 * fem, 26 * fem, 24 * fem, 31 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xb2f5dab1),
                          borderRadius: BorderRadius.circular(30 * fem),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  'Thay đổi thông tin nhân viên',
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
                                  0 * fem, 0 * fem, 0 * fem, 12 * fem),
                              child: Text(
                                'Tải ảnh lên',
                                overflow: TextOverflow.clip,
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
                              child: TextButton(
                                onPressed: () async {
                                  final newImages = await pickersupdateNV
                                      .pickImage(source: ImageSource.gallery);
                                  if (newImages == null) {
                                    return;
                                  }
                                  uploadImage(newImages);
                                },
                                child: imagesupdateNV != null
                                    ? Image.file(
                                        File(imagesupdateNV!.path),
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
                                    controller: tenNV,
                                    style: SafeGoogleFont('Quicksand',fontSize: 12,),
                                    textInputAction: TextInputAction.next,

                                    decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Color(0xff007373)),
                                        hintText: "Tên nhân viên",
                                        fillColor: Colors.white),
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  value: gentle,
                                  items:
                                      ["Khác", "Nam", "Nữ"].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      gentle = newValue!;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Color(0xff007373)),
                                    hintText: "Giới tính",
                                    fillColor: Colors.white,
                                  ),
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
                                    controller: sodienthoai,
                                    style: SafeGoogleFont('Quicksand',fontSize: 12,),
                                    decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Color(0xff007373)),
                                        hintText: "Số điện thoại",
                                        fillColor: Colors.white),
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: calam,
                                items: ["Sáng", "Chiều", "Tối", "Khuya"]
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    calam = newValue!;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Color(0xff007373)),
                                  hintText: "Ca làm",
                                  fillColor: Colors.white,
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
                                    controller: luong,
                                    style: SafeGoogleFont('Quicksand',fontSize: 12,),
                                    decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Color(0xff007373)),
                                        hintText: "Lương",
                                        fillColor: Colors.white),
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: SizedBox(
                                height: 50 * fem,
                                child: TextFormField(
                                  controller: ngaySinh,
                                  style: SafeGoogleFont('Quicksand',fontSize: 12,),
                                  onTap: (){
                                    _selectDateupdate(context);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Ngày sinh",
                                    hintStyle:
                                        TextStyle(color: Color(0xff007373)),
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
                              margin: EdgeInsets.fromLTRB(
                                  25 * fem, 0 * fem, 25 * fem, 10 * fem),
                              width: 300,
                              height: 50 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff007373),
                                borderRadius: BorderRadius.circular(90 * fem),
                              ),
                              child: Center(
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DanhSachNhanVien()));
                                      double Luong = double.parse(luong.text);
                                      final UpdateNV = NhanVien(
                                        calam,
                                        imageURLNV,
                                        Luong,
                                        ngaySinh.text,
                                        sodienthoai.text,
                                        tenNV.text,
                                        gentle,
                                      );
                                      updateNhanvien(UpdateNV, widget.id);
                                    },
                                    child: Text(
                                      'Xác nhận thay đổi',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2000000477 * ffem / fem,
                                        color: const Color(0xfffcf2d9),
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
        ),
      ),
    );
  }
}
