import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/page-1/capnhatnhanvien.dart';
import 'package:myapp/page-1/ChiTietNhanVien.dart';
import 'package:myapp/page-1/ThemNhanVien.dart';
import 'package:myapp/page-1/TrangChuNew.dart';
import 'package:myapp/utils.dart';

class DanhSachNhanVien extends StatefulWidget {
  const DanhSachNhanVien({super.key});

  @override
  State<DanhSachNhanVien> createState() => _DanhSachNhanVienState();
}

class _DanhSachNhanVienState extends State<DanhSachNhanVien> {
  final TextEditingController searchNV = TextEditingController();
  String searchKeyNV = '';
  List<DocumentSnapshot> filteredSearchNV = [];
  String normalizeString(String input) {
    return input.toLowerCase(); // Chuyển hết sang chữ thường
  }

  void searchValueNV() {
    String normalizedKeyword = normalizeString(searchKeyNV);
    setState(() {
      productStreamNV = updataNV
          .where('tenNV', isGreaterThanOrEqualTo: normalizedKeyword)
          .where('tenNV', isLessThan: '${normalizedKeyword}z')
          .snapshots();
    });
  }
// Nhưng biến phục vụ chức năng search

  final CollectionReference updataNV =
      FirebaseFirestore.instance.collection('Staff');
  bool sapXepNV = true;
  late Stream<QuerySnapshot> productStreamNV;
  void updateProductStreamNV() {
    setState(() {
      productStreamNV = updataNV.orderBy('tenNV').snapshots();
    });
  }

  @override
  void initState() {
    super.initState();
    // Khởi tạo productStream với dữ liệu ban đầu
    productStreamNV = updataNV.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          // danhsachnhanvienPey (5:531)
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xfff5dab1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // autogroupj9bo86m (Nuf7Y9CnrQjYXMttphj9bo)
                padding: EdgeInsets.fromLTRB(
                    13 * fem, 48 * fem, 13 * fem, 29.5 * fem),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group72TPw (5:624)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 20.5 * fem),
                        width: double.infinity,
                        height: 45 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorBaq (5:625)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 0 * fem),
                              width: 45 * fem,
                              height: 45 * fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TrangChuNew()));
                                },
                                child: Image.asset(
                                  'assets/page-1/images/vector-Fey.png',
                                  width: 45 * fem,
                                  height: 45 * fem,
                                ),
                              ),
                            ),
                            Container(
                              // timkiemW7K (5:626)
                              padding: EdgeInsets.fromLTRB(
                                  17 * fem, 0 * fem, 0 * fem, 0 * fem),
                              height: double.infinity,
                              // decoration: BoxDecoration (
                              //   border: Border.all(color: const Color(0xff993300)),
                              //   color: const Color(0xffffffff),
                              //   borderRadius: BorderRadius.circular(30*fem),
                              // ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 280,
                                    height: 50,
                                    child: CupertinoSearchTextField(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff993300)),
                                        color: const Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(30 * fem),
                                      ),
                                      placeholder: 'Tìm kiếm',
                                      //thay đổi trạng thái listview lọc sản phẩm khi search
                                      onChanged: (value) {
                                        setState(() {
                                          searchKeyNV = value;
                                        });
                                      },
                                      // chuyển kiểu chữ để nhận dạng sản phẩm
                                      // onSubmitted: (value){
                                      //   searchValueNguyenLieu();
                                      // },
                                      controller: searchNV,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group73LVf (5:632)
                        margin: EdgeInsets.fromLTRB(
                            12 * fem, 0 * fem, 10 * fem, 0 * fem),
                        width: double.infinity,
                        height: 25 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ThemNhanVien(
                                          updateProductStreamNV:
                                              updateProductStreamNV),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      // butonthemspHbo (5:497)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 8 * fem, 0 * fem),
                                      width: 24 * fem,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff993300),
                                        borderRadius:
                                            BorderRadius.circular(20 * fem),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+',
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
                                      // txspxpYnd (5:403)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 10 * fem, 0 * fem),
                                      child: Text(
                                        'Thêm nhân viên mới',
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: const Color(0xff993300),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  sapXepNV =
                                      false; // Đảo ngược trạng thái sắp xếp
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    // btsapxep4FB (5:377)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 8 * fem, 4 * fem),
                                    width: 20 * fem,
                                    height: 20 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/btsapxep.png',
                                      width: 20 * fem,
                                      height: 20 * fem,
                                    ),
                                  ),
                                  Text(
                                    // txspxpmvH (5:402)
                                    'Sắp xếp',
                                    style: SafeGoogleFont(
                                      'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.25 * ffem / fem,
                                      color: const Color(0xff993300),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: sapXepNV
                          ? productStreamNV
                          : updataNV.orderBy('tenNV').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text('Không có dữ liệu'),
                          );
                        }
                        final nguyenlieu = snapshot.data!.docs;
                        //thêm dữ liệu vào chuỗi rỗng để lọc sản phẩm
                        filteredSearchNV = nguyenlieu
                            .where((nguyenLieu) => nguyenLieu['tenNV']
                                .toString()
                                .toLowerCase()
                                .contains(searchKeyNV.toLowerCase()))
                            .toList();

                        return ListView.builder(
                            // đưa dữ liệu hiển thị lên màn hình
                            itemCount: filteredSearchNV.length,
                            itemBuilder: (context, document) {
                              final DocumentSnapshot documentSnapshotNV =
                                  filteredSearchNV[document];
                              final tenNV = documentSnapshotNV['tenNV'];
                              final hinhAnh = documentSnapshotNV['hinhAnh'];
                              final ngaySinh = documentSnapshotNV['ngaySinh'];
                              final id = documentSnapshotNV.id;
                              return SizedBox(
                                height: 120,
                                child: Card(
                                  child: ListTile(
                                    visualDensity: VisualDensity(vertical: 4),
                                    tileColor: const Color(0xfff5dab2),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChiTietNhanVien(NhanVienID: id),
                                        ),
                                      );
                                    },
                                    leading: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        minWidth: 64,
                                        minHeight: 55,
                                        maxWidth: 64,
                                        maxHeight: 64,
                                      ),
                                      child: Container(
                                        width: 90,
                                        height: 90,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(hinhAnh,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    title: Text(
                                      tenNV,
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    subtitle: Text(ngaySinh),
                                    trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) => SuaNhanVien(
                                                        calam:
                                                            documentSnapshotNV[
                                                                'caLam'],
                                                        hinhAnh:
                                                            documentSnapshotNV[
                                                                'hinhAnh'],
                                                        luong:
                                                            documentSnapshotNV['luong']
                                                                .toString(),
                                                        ngaySinh:
                                                            documentSnapshotNV[
                                                                'ngaySinh'],
                                                        sodienthoai:
                                                            documentSnapshotNV[
                                                                'sdt'],
                                                        tenNV:
                                                            documentSnapshotNV[
                                                                'tenNV'],
                                                        gioiTinh:
                                                            documentSnapshotNV[
                                                                'gioiTinh'],
                                                        id: documentSnapshotNV
                                                            .id)));
                                          },
                                          child: Container(
                                            // bteditbTw (5:459)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 10 * fem),
                                            width: 18 * fem,
                                            height: 20 * fem,
                                            child: Image.asset(
                                              'assets/page-1/images/btedit-XD3.png',
                                              width: 22 * fem,
                                              height: 22 * fem,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // btxoaWL1 (5:462)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0.12 * fem, 0 * fem),
                                          width: 32 * fem,
                                          height: 32 * fem,
                                          child: TextButton(
                                            onPressed: () {
                                              confirmDeleteDialogNV(updataNV
                                                  .doc(documentSnapshotNV.id));
                                            },
                                            child: Image.asset(
                                              'assets/page-1/images/btxoa.png',
                                              width: 18 * fem,
                                              height: 20 * fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      })),
            ],
          ),
        ),
      ),
    );
  }

  Future confirmDeleteDialogNV(DocumentReference dele) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Ngăn người dùng đóng hộp thoại bằng cách bấm ngoài
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa sản phẩm'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc chắn muốn xóa sản phẩm này không?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DanhSachNhanVien()));
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () async {
                try {
                  await dele.delete();
                  Fluttertoast.showToast(msg: 'Xóa thành công!');
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: 'Xóa thất bại', backgroundColor: Colors.red);
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DanhSachNhanVien()));
              },
            ),
          ],
        );
      },
    );
  }
}
