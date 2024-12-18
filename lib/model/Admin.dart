import 'package:cloud_firestore/cloud_firestore.dart';

class Admin{
  final String displayName;
  final String email;
  final String hinhanh;
  final String sdt;
  final String diachi;
  final String uid;
  final String id;


  Admin(this.displayName, this.email, this.hinhanh, this.sdt, this.diachi,
      this.uid, this.id); // Hàm tạo từ dữ liệu Firestore
  factory Admin.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Admin(
      data['displayName'] ?? '',
      data['email'] ?? '',
      data['hinhAnh'] ?? '',
      data['sdt'] ?? '',
      data['diaChi'] ?? '',
      data['uid'] ?? '',
      doc.id,
    );
  }

  @override
  String toString() {
    return 'Admin{displayName: $displayName, email: $email, hinhanh: $hinhanh, sdt: $sdt, diachi: $diachi, uid: $uid}';
  }
}