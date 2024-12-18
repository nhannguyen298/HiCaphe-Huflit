import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myapp/page-1/DanhMucNguyenLieu.dart';
import 'package:myapp/utils.dart';

import '../model/QuanLyNguyenLieu.dart';

class ThemNguyenLieu extends StatefulWidget {
  final void Function() updateProductStreamNL;
  const ThemNguyenLieu({Key? key, required this.updateProductStreamNL});

  @override
  State<ThemNguyenLieu> createState() => _ThemNguyenLieuState();
}

class _ThemNguyenLieuState extends State<ThemNguyenLieu> {
  final formKey = GlobalKey<FormState>();

  String defaultNgaySinh = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    // Đặt giá trị mặc định cho trường ngày sinh là thời gian hiện tại
    ngaynhapNL.text = defaultNgaySinh;
  }
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDateupAdd(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        ngaynhapNL.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  final TextEditingController dongiaNL = TextEditingController();
  final TextEditingController donVitinhNL = TextEditingController();
  final TextEditingController ngaynhapNL = TextEditingController();
  final TextEditingController sltonkho = TextEditingController();
  final TextEditingController motaNL = TextEditingController();
  final TextEditingController tenNL = TextEditingController();
  String hinhanh= "";
  final ImagePicker pickerNL = ImagePicker();
  //biến để thực hiện kiểm tra bạn đã thêm ảnh hay chưa
  bool isImageSelectedNL = false;
  // biến Xfile chứa nội dung hình ảnh đã được chọn
  XFile? imageNL ;
// hàm để đưa hình ảnh lên giao diện
  void updateImageNL(XFile newImage) {
    setState(() {
      imageNL = newImage;
    });
  }
  // hàm đưa đưa dữ liệu lên Storage
  uploadImageNL(String id) async {
    final storageRef = FirebaseStorage.instance.ref().child("nguyenLieu"); // Ham lien ket vao storage
    try {
      final imageRef = storageRef.child("$id-${imageNL!.name}");
      await imageRef.putFile(File(imageNL!.path));
      return await imageRef.getDownloadURL();
    }
    on FirebaseException catch(e) {
      return '';
    }
  }
  Future addnewNguyenLieu(NguyenLieu nguyenLieu) async {
    final String newId = DateTime.now().millisecondsSinceEpoch.toString(); // Ham lien ket vao cloud firebase
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String imageURL = await uploadImageNL(newId);
    double donGia = double.parse(dongiaNL.text);
    try {
      await firestore.collection("RawMaterials").doc(newId).set({
        "donGia": donGia,
        "donViTinh": nguyenLieu.donVitinh,
        "moTa": nguyenLieu.moTa,
        "ngayNhap": nguyenLieu.ngayNhap,
        "hinhAnh": imageURL,
        "slTonKho": nguyenLieu.slTonKho,
        "tenNL": nguyenLieu.tenNL,
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                // themnguyenlieu3JH (5:158)
                padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 17*fem, 0*fem),
                width: double.infinity,
                height: 822,
                decoration: const BoxDecoration (
                  color: Color(0xffffffff),
                  image: DecorationImage (
                    fit: BoxFit.cover,
                    image: AssetImage (
                      'assets/page-1/images/hinhnen1-bg.png',
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupp8smi9X (Nuep4JzkktJQa9wdwkP8Sm)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                        width: double.infinity,
                        height: 140*fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // logomauSLR (5:160)
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
                              // caukhauhieukM7 (5:187)
                              left: 5*fem,
                              top: 114*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 322*fem,
                                  height: 29*fem,
                                  child: Text(
                                    'Thưởng thức vị ngon trọn vẹn',
                                    textAlign: TextAlign.center,
                                    style: TextStyle (
                                      fontFamily: 'Dancing Script',
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
                            Container(
                              // vectorptH (5:369)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                              width: 45*fem,
                              height: 45*fem,
                              child: TextButton(
                                onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const QuanLyNguyenLieu()));
                                } ,
                                child: Image.asset(
                                  'assets/page-1/images/vector.png',
                                  width: 45*fem,
                                  height: 45*fem,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // bieumaudangnhapWzV (5:161)
                        margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 9*fem, 0*fem),
                        padding: EdgeInsets.fromLTRB(25*fem, 26*fem, 24*fem, 45*fem),
                        width: double.infinity,
                        decoration: BoxDecoration (
                          color: const Color(0xb2f5dab1),
                          borderRadius: BorderRadius.circular(30*fem),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // group32zPs (5:162)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                              width: double.infinity,
                              height: 36*fem,
                              decoration: BoxDecoration (
                                color: const Color(0xff007373),
                                borderRadius: BorderRadius.circular(15*fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Thêm mới nguyên liệu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle (
                                    fontFamily: 'Quicksand',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25*ffem/fem,
                                    color: const Color(0xfffcf2d9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // txspxp3sw (5:182)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                              child: Text(
                                'Tải ảnh lên',
                                style: TextStyle (
                                  fontFamily: 'Quicksand',
                                  fontSize: 12*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.25*ffem/fem,
                                  color: const Color(0xff007373),
                                ),
                              ),
                            ),
                            Container(
                              // frame52k1f (5:183)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                              width: 259*fem,
                              height: 110*fem,
                              child: TextButton(
                                onPressed: () async{
                                  //biến để lưu ảnh đã chọn trong đth
                                  final newImage = await pickerNL.pickImage(source: ImageSource.gallery);
                                  // nếu không cho ảnh thì sẽ không trả về gì cả
                                  if(newImage==null){
                                    setState(() {
                                      isImageSelectedNL = false;
                                    });
                                  }
                                  else{
                                    // nếu đã chọn ảnh thì sẽ đưa vô hàm để up ảnh lên giao diện
                                    isImageSelectedNL = true;
                                    updateImageNL(newImage);
                                  }
                                },
                                child: imageNL != null ? Image.file(File(imageNL!.path),width: 259*fem,
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
                                        return  'Giá không được trống';
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    controller: dongiaNL,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                        hintStyle: TextStyle(color: Color(0xff007373)),
                                        hintText: "Giá nguyên liệu",
                                        fillColor: Colors.white),
                                  ),)
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: SizedBox(height: 30,
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return  'Đơn vị tính không được trống';
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                                    controller: donVitinhNL,
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                        hintStyle: TextStyle(color: Color(0xff007373)),
                                        hintText: "Đơn vị tính",
                                        fillColor: Colors.white),
                                  ),)
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: SizedBox(height: 30,
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return  'Mô tả không được trống';
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                                    controller: motaNL,
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                        hintStyle: TextStyle(color: Color(0xff007373)),
                                        hintText: "Mô tả",
                                        fillColor: Colors.white),
                                  ),)
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: SizedBox(
                                height: 50,
                                child: TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return  'Ngày không được trống';
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  controller: ngaynhapNL,
                                  textInputAction: TextInputAction.next,
                                  style: const TextStyle(fontSize: 12),
                                  onTap: (){
                                     _selectDateupAdd(context);
                                  },
                                  decoration: InputDecoration(

                                    hintText: defaultNgaySinh,
                                    hintStyle: const TextStyle(color: Color(0xff007373)),
                                    fillColor: Colors.white,
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.calendar_today),
                                      onPressed: () {
                                        // Mở datetime picker ở đây
                                        _selectDateupAdd(context);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: SizedBox(height: 30,
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return  'Tên nguyên liệu không được trống';
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                                    controller: tenNL,
                                    style: const TextStyle(fontSize: 12),
                                    textInputAction: TextInputAction.next,
                                    decoration: const InputDecoration(
                                        hintStyle: TextStyle(color: Color(0xff007373)),
                                        hintText: "Tên nguyên liệu",
                                        fillColor: Colors.white),
                                  ),)
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: SizedBox(height: 30,
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return  'Số lượng tồn kho không được trống';
                                      }
                                      else{
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: sltonkho,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                        hintStyle: TextStyle(color: Color(0xff007373)),
                                        hintText: "Số lượng tồn kho",
                                        fillColor: Colors.white),
                                  ),)
                            ),
                            Container(
                              // btndangnhaphd3 (5:180)
                              margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 25*fem, 0*fem),
                              width: 300,
                              height: 50*fem,
                              decoration: BoxDecoration (
                                color: const Color(0xff007373),
                                borderRadius: BorderRadius.circular(90*fem),
                              ),
                              child: Center(
                                child: Center(
                                  child: TextButton(
                                    onPressed: (){
                                      if(formKey.currentState!.validate()){
                                        if( isImageSelectedNL){
                                          widget.updateProductStreamNL();
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const QuanLyNguyenLieu()));
                                          double donGia = double.parse(dongiaNL.text);
                                          NguyenLieu nguyenlieu = NguyenLieu(
                                              donGia: donGia,
                                              donVitinh: donVitinhNL.text,
                                              hinhAnh: hinhanh,
                                              moTa: motaNL.text,
                                              ngayNhap: ngaynhapNL.text,
                                              slTonKho: sltonkho.text,
                                              tenNL: tenNL.text);
                                          addnewNguyenLieu(nguyenlieu);
                                        }
                                        else{
                                          // Hiển thị thông báo lỗi nếu không có hình ảnh
                                          Fluttertoast.showToast(msg: 'Vui lòng điền đủ thông tin sản phẩm.');
                                        }
                                        // Fluttertoast.showToast(msg: 'Bạn chưa điền thông tin');
                                      }

                                    },
                                    child: Text('Xác nhận thêm mới',
                                        textAlign: TextAlign.center,
                                        style: TextStyle (
                                          fontFamily: 'Quicksand',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w400,
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
        ),
      ),
    );
  }
}
