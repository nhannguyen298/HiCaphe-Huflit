import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/model/NhanVien.dart';
import 'package:myapp/page-1/danhsachnhanvien.dart';
import 'package:myapp/utils.dart';
import 'package:intl/intl.dart';

class ThemNhanVien extends StatefulWidget {
  final void Function() updateProductStreamNV;
  const ThemNhanVien({super.key, required this.updateProductStreamNV});

  @override
  State<ThemNhanVien> createState() => _ThemNhanVienState();
}

class _ThemNhanVienState extends State<ThemNhanVien> {
  final formKey = GlobalKey<FormState>();

  String defaultNgaySinh = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    // Đặt giá trị mặc định cho trường ngày sinh là thời gian hiện tại
    ngaysinh.text = defaultNgaySinh;
  }
  // khởi tạo ngày hôm nay của phần thêm ngày sinh
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
        ngaysinh.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  final TextEditingController tenNV = TextEditingController();
  final TextEditingController sodienthoai = TextEditingController();
  // final TextEditingController calam = TextEditingController();
  String Calam = "Sáng"; // Giá trị ban đầu
  String gioitinh = "Khác";

  final TextEditingController luong= TextEditingController();
  final TextEditingController ngaysinh = TextEditingController();

  String hinhanh= "";
  final ImagePicker pickerNV = ImagePicker();
  //biến để thực hiện kiểm tra bạn đã thêm ảnh hay chưa
  bool isImageSelectedNV = false;
  // biến Xfile chứa nội dung hình ảnh đã được chọn
  XFile? imageNV ;
// hàm để đưa hình ảnh lên giao diện
  void updateImageNV(XFile newImageNV) {
    setState(() {
      imageNV = newImageNV;
    });
  }
  // hàm đưa đưa dữ liệu lên Storage
  uploadImageNV(String id) async {
    final storageRef = FirebaseStorage.instance.ref().child("nhanVien"); // Ham lien ket vao storage
    try {
      final imageRef = storageRef.child("$id-${imageNV!.name}");
      await imageRef.putFile(File(imageNV!.path));
      return await imageRef.getDownloadURL();
    } on FirebaseException catch(a) {
      return '';
    }
  }

  Future addnewStaff(NhanVien nhanvien) async {
    final String newId = DateTime.now().millisecondsSinceEpoch.toString(); // Ham lien ket vao cloud firebase
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String imageURLNV = await uploadImageNV(newId);
    double Luong= double.parse(luong.text);
    try {
      await firestore.collection("Staff").doc(newId).set({
        "tenNV": nhanvien.tenNV,
        "hinhAnh": imageURLNV,
        "luong": Luong,
        "ngaySinh": nhanvien.ngaySinh,
        "sdt": nhanvien.sdt,
        "caLam": nhanvien.caLam,
        "gioiTinh":nhanvien.gioiTinh,
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
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Material(
                  type: MaterialType.transparency,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      // themnhanvienhEy (5:189)
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
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupcm8mnnD (NuepesqVXKchoVEY4ZCm8M)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                              width: double.infinity,
                              height: 148*fem,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // logomauiQy (5:191)
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
                                    // caukhauhieu1us (5:209)
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
                                    // vectorH6h (5:210)
                                    left: 0*fem,
                                    top: 0*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 50*fem,
                                        height: 50*fem,
                                        child: TextButton(
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const DanhSachNhanVien()));
                                          },
                                          child: Image.asset(
                                            'assets/page-1/images/vector-WGy.png',
                                            width: 40*fem,
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
                              // bieumaudangnhapbdB (5:192)
                              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 9*fem, 0*fem),
                              padding: EdgeInsets.fromLTRB(25*fem, 26*fem, 24*fem, 31*fem),
                              width: double.infinity,
                              decoration: BoxDecoration (
                                color: const Color(0xb2f5dab1),
                                borderRadius: BorderRadius.circular(30*fem),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // group32Uws (5:193)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                    width: double.infinity,
                                    height: 36*fem,
                                    decoration: BoxDecoration (
                                      color: const Color(0xff007373),
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Thêm nhân viên mới',
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
                                    // txspxpjso (5:204)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                    child: Text(
                                      'Tải ảnh lên',
                                      style: SafeGoogleFont (
                                        'Quicksand',
                                        fontSize: 16*ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.25*ffem/fem,
                                        color: const Color(0xff007373),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // frame50EpZ (5:205)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                                    width: 259*fem,
                                    height: 110*fem,
                                    child: TextButton(
                                      onPressed: () async{
                                        //biến để lưu ảnh đã chọn trong đth
                                        final newImageNV = await pickerNV.pickImage(source: ImageSource.gallery);
                                        // nếu không cho ảnh thì sẽ không trả về gì cả
                                        if(newImageNV==null){
                                          setState(() {
                                            isImageSelectedNV = false;
                                          });
                                        }
                                        else{
                                          // nếu đã chọn ảnh thì sẽ đưa vô hàm để up ảnh lên giao diện
                                          isImageSelectedNV = true;
                                          updateImageNV(newImageNV);
                                        }
                                      },
                                      child: imageNV != null ? Image.file(File(imageNV!.path),width: 259*fem,
                                        height: 110*fem,) :
                                      Image.asset(
                                        'assets/page-1/images/frame-50.png',
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
                                              return  'Tên nhân viên không được trống';
                                            }
                                            else{
                                              return null;
                                            }
                                          },
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          controller: tenNV,
                                          style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                          decoration: const InputDecoration(
                                              hintStyle: TextStyle(color: Color(0xff007373)),
                                              hintText: "Tên nhân viên",
                                              fillColor: Colors.white),
                                        ),)
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0), // Thêm khoảng trống ở đầu
                                      child: DropdownButtonFormField<String>(
                                        style: SafeGoogleFont('Quicksand',fontSize: 14,color: Colors.black),
                                        isExpanded: true,
                                        value: gioitinh,
                                        items: ["Khác","Nam","Nữ"].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            gioitinh= newValue!;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(color: Color(0xff007373)),
                                          hintText: "giới tính",
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: SizedBox(height: 50,
                                        child: TextFormField(
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return  'số điện không được trống';
                                            }
                                            else{
                                              return null;
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          controller: sodienthoai,
                                          style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                          decoration: const InputDecoration(
                                              hintStyle: TextStyle(color: Color(0xff007373)),
                                              hintText: "Số điện thoại",
                                              fillColor: Colors.white),
                                        ),)
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0), // Thêm khoảng trống ở đầu
                                      child: DropdownButtonFormField<String>(
                                        style: SafeGoogleFont('Quicksand',fontSize: 14,color: Colors.black),
                                        isExpanded: true,
                                        value: Calam,
                                        items: ["Sáng","Chiều", "Tối","Khuya"].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            Calam = newValue!;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(color: Color(0xff007373)),
                                          hintText: "Ca làm",
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: SizedBox(height: 50,
                                        child: TextFormField(
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return  'Lương không được trống';
                                            }
                                            else{
                                              return null;
                                            }
                                          },
                                          keyboardType: TextInputType.number,
                                          controller: luong,
                                          style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                          textInputAction: TextInputAction.next,
                                          decoration: const InputDecoration(
                                              hintStyle: TextStyle(color: Color(0xff007373)),
                                              hintText: "Lương",
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
                                            return  'Ngày sinh không được trống';
                                          }
                                          else{
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        controller: ngaysinh,
                                        style: SafeGoogleFont('Quicksand',fontSize: 14,),
                                        onTap: (){
                                          _selectDateupAdd(context);
                                        },
                                        decoration: InputDecoration(
                                          hintText: defaultNgaySinh,
                                          hintStyle: TextStyle(color: Color(0xff007373)),
                                          fillColor: Colors.white,
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.calendar_today),
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
                                    // btndangnhapM21 (5:202)
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
                                              if( isImageSelectedNV){
                                                widget.updateProductStreamNV();
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DanhSachNhanVien()));
                                                double Luong = double.parse(luong.text);
                                                NhanVien NV = NhanVien(
                                                    Calam,
                                                    hinhanh,
                                                    Luong,
                                                    ngaysinh.text,
                                                    sodienthoai.text,
                                                    tenNV.text,
                                                    gioitinh);
                                                addnewStaff(NV);
                                              }
                                              else{
                                                // Hiển thị thông báo lỗi nếu không có hình ảnh
                                                Fluttertoast.showToast(msg: 'Vui lòng chọn hình ảnh sản phẩm.');
                                              }
                                              Fluttertoast.showToast(msg: 'Bạn chưa điền đủ thông tin');
                                            }

                                          },
                                          child: Text('Xác nhận thêm mới',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont (
                                                'Quicksand',
                                                fontSize: 16*ffem,
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
              ),
            )),
      ),
    );
  }
}