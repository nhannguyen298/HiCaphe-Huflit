import 'package:cloud_firestore/cloud_firestore.dart';

class Users{
 final String displayName;
 final String email;
 final String hinhanh;
 final String sdt;
 final String uid;
 final String luong;
 final String gioitinh;
 final String ngaysinh;
 final String calam;
 final String id;

 Users(this.displayName, this.email, this.hinhanh, this.sdt, this.uid, this.luong, this.gioitinh, this.ngaysinh, this.calam, this.id);

 // Hàm tạo từ dữ liệu Firestore
 factory Users.fromFirestore(DocumentSnapshot doc) {
  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  return Users(
   data['displayName'] ?? '',
   data['email'] ?? '',
   data['hinhAnh'] ?? '',
   data['sdt'] ?? '',
   data['uid'] ?? '',
   data['luong']?? '',
   data['gioitinh'] ?? '',
   data['ngaysinh'] ?? '',
   data['calam']?? '',
   doc.id,
  );
 }
 @override
 String toString() {
  return 'Users{displayName: $displayName, email: $email, hinhanh: $hinhanh, sdt: $sdt, uid: $uid, luong: $luong, gioitinh: $gioitinh, ngaysinh: $ngaysinh}';
 }
 Map<String, dynamic> toMap() {
  return {
   'email': email,
   'hinhanh': hinhanh,
   'displayName': displayName,
   'sdt': sdt,
   'calam': calam,
   'luong': luong,
   'gioitinh': gioitinh,
   'ngaysinh': ngaysinh,
  };
 }

}