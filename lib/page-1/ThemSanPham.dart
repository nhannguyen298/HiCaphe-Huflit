import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/model/DanhMucCaPhe.dart';
import 'package:myapp/page-1/DanhMucSanPham.dart';
import 'package:myapp/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ThemSanPham extends StatefulWidget {
  final void Function() updateProductStream;
  const ThemSanPham({super.key, required this.updateProductStream});
  @override
  State<ThemSanPham> createState() => _ThemSanPhamState();
}

class _ThemSanPhamState extends State<ThemSanPham> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController dongia = TextEditingController();
  final TextEditingController soluong = TextEditingController();
  final TextEditingController masp = TextEditingController();
  // final TextEditingController kichthuoc = TextEditingController();
  final TextEditingController mota = TextEditingController();
  final TextEditingController tensp = TextEditingController();
  String kichThuoc = ""; // Giá trị ban đầu
  String hinhanh= "";
  final ImagePicker picker = ImagePicker();
  //biến để thực hiện kiểm tra bạn đã thêm ảnh hay chưa
  bool isImageSelected = false;
  // biến Xfile chứa nội dung hình ảnh đã được chọn
  XFile? image ;
// hàm để đưa hình ảnh lên giao diện
  void updateImage(XFile newImage) {
    setState(() {
      image = newImage;
    });
  }


  // hàm đưa đưa dữ liệu lên Storage
  uploadImage(String id) async {
    final storageRef = FirebaseStorage.instance.ref().child("sanPham"); // Ham lien ket vao storage
    try {
      final imageRef = storageRef.child("$id-${image!.name}");
      await imageRef.putFile(File(image!.path));
      return await imageRef.getDownloadURL();
    } on FirebaseException catch(a) {
      return '';
    }
  }

  Future addnewCaphes( CaPhe caphe) async {
    final String newId = DateTime.now().millisecondsSinceEpoch.toString(); // Ham lien ket vao cloud firebase
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String imageURL = await uploadImage(newId);
    double donGia = double.parse(dongia.text);
    try {
      await firestore.collection("Product").doc(newId).set({
        "tenSP": caphe.tenCaphe,
        "moTa": caphe.motaCaphe,
        "kichThuoc": caphe.kichThuoc,
        "idCate": caphe.idCate,
        "hinhAnh": imageURL,
        "donVitinh": caphe.donviTinh,
        "donGia": donGia,
      });
      Fluttertoast.showToast(msg: 'Thêm thành công!');
    }
    catch (e) {
      Fluttertoast.showToast(msg: 'Thêm thất bại', backgroundColor: Colors.red);
    }
  }


  @override
  Widget build(BuildContext context) {

    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              // themsanphamVvR (5:127)
              padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 17*fem, 0*fem),
              width: double.infinity,
              decoration: const BoxDecoration (
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
                    // autogroup4qjjzcH (NueoH5o7fiEjPyeyfJ4Qjj)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                    width: double.infinity,
                    height: 143*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // logomauiYH (5:129)
                          left: 114*fem,
                          top: 16*fem,
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
                          // caukhauhieu34m (5:156)
                          left: 5*fem,
                          top: 114*fem,
                          child: Align(
                            child: SizedBox(
                              width: 322*fem,
                              height: 29*fem,
                              child: Text(
                                'Thưởng thức vị ngon trọn vẹn',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Dancing Script',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2*ffem/fem,
                                  letterSpacing: 1*fem,
                                  color: const Color(0xff993300),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // vectorK2H (5:157)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 50*fem,
                              height: 50*fem,
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const DanhMucSanPham()));
                                },
                                child: Image.asset(
                                  'assets/page-1/images/vector-Pzq.png',
                                  width: 49*fem,
                                  height: 40*fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // bieumaudangnhap1vh (5:130)
                    margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 9*fem, 0*fem),
                    padding: EdgeInsets.fromLTRB(25*fem, 26*fem, 24*fem, 28*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      color: const Color(0xb2f5dab1),
                      borderRadius: BorderRadius.circular(30*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // group32hYd (5:131)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                          width: double.infinity,
                          height: 36*fem,
                          decoration: BoxDecoration (
                            color: const Color(0xff007373),
                            borderRadius: BorderRadius.circular(15*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Thêm mới sản phẩm',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Quicksand',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.25*ffem/fem,
                                color: const Color(0xfffcf2d9),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // txspxpmHb (5:155)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                          child:  TextButton(
                              onPressed:(){} ,
                              child: Text('Tải ảnh lên',
                                style: SafeGoogleFont (
                                  'Quicksand',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25*ffem/fem,
                                  color: const Color(0xff007373),
                                ),)
                          ),
                        ),
                        Container(
                          // frame48f85 (5:151)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 34*fem),
                          width: 259*fem,
                          height: 110*fem,
                          child: TextButton(
                            onPressed: () async{
                              //biến để lưu ảnh đã chọn trong đth
                              final newImage = await picker.pickImage(source: ImageSource.gallery);
                              // nếu không cho ảnh thì sẽ không trả về gì cả
                              if(newImage==null){
                                setState(() {
                                  isImageSelected = false;
                                });
                              }
                              else{
                                // nếu đã chọn ảnh thì sẽ đưa vô hàm để up ảnh lên giao diện
                                isImageSelected = true;
                                updateImage(newImage);
                              }

                            },
                            child: image != null ? Image.file(File(image!.path),width: 259*fem,
                              height: 110*fem,) :
                            Image.asset(
                              'assets/page-1/images/frame-48.png',
                              width: 259*fem,
                              height: 110*fem,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: SizedBox(height: 30,
                              child: TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){
                                    return  'Mã sản phẩm được trống';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: masp,
                                style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Color(0xff007373)),
                                    hintText: "Mã loại sản phẩm",
                                    fillColor: Colors.white),
                              ),)
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: SizedBox(height: 30,
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: tensp,
                                style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Color(0xff007373)),
                                    hintText: "Tên sản phẩm",
                                    fillColor: Colors.white),
                              ),)
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: DropdownButtonFormField<String>(
                            value: kichThuoc, // Giá trị ban đầu
                            items: ["","L", "N"].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                kichThuoc = newValue!; // Cập nhật giá trị khi thay đổi
                              });
                            },
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Color(0xff007373)),
                              hintText: "Kích thước",
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: SizedBox(height: 30,
                              child: TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){
                                    return  'Số lượng không được trống';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                controller: soluong,
                                style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Color(0xff007373)),
                                    hintText: "Đơn vị tính",
                                    fillColor: Colors.white),
                              ),)
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: SizedBox(height: 50,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Vui lòng nhập giá sản phẩm';
                                  } else if (value.length > 5) {
                                    return 'Nhập trong khoảng từ 1000VND - 99999VND';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                controller: dongia,
                                style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Color(0xff007373)),
                                    hintText: "Giá sản phẩm",
                                    fillColor: Colors.white),
                              ),

                            )
                        ),

                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: SizedBox(height: 50,
                              child: TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){
                                    return  'Mô tả không được trống';
                                  }
                                  else{
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                controller: mota,
                                style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Color(0xff007373)),
                                    hintText: "Mô tả",
                                    fillColor: Colors.white),
                              ),)
                        ),
                        Container(
                          // btndangnhapD53 (5:149)
                          margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 25*fem, 0*fem),
                          width: 300,
                          height: 50*fem,
                          decoration: BoxDecoration (
                            color: const Color(0xff007373),
                            borderRadius: BorderRadius.circular(90*fem),
                          ),
                          child: Center(
                            child: Center(
                              child: GestureDetector(
                                onTap: (){
                                  if (formKey.currentState!.validate()) {
                                    if (isImageSelected) {
                                      widget.updateProductStream();
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DanhMucSanPham()));
                                      double gia = double.parse(dongia.text);
                                      CaPhe caphe = CaPhe(
                                        gia,
                                        soluong.text,
                                        hinhanh,
                                        masp.text,
                                        kichThuoc,
                                        mota.text,
                                        tensp.text,
                                      );
                                      addnewCaphes(caphe);
                                    } else {
                                      // Hiển thị thông báo lỗi nếu không có hình ảnh
                                      Fluttertoast.showToast(msg: 'Vui lòng chọn hình ảnh sản phẩm.');
                                    }
                                  }
                                },
                                child: Text( 'Xác nhận thêm mới',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Quicksand',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2000000477*ffem/fem,
                                      color: const Color(0xfffcf2d9),)

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
