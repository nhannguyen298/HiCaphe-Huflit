import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/page-1/QuanLyKH.dart';
import 'package:myapp/utils.dart';

import 'ChiTietSanPhamKH.dart';

class YeuThich extends StatefulWidget {
  const YeuThich({Key? key});

  @override
  State<YeuThich> createState() => _YeuThichState();
}

class _YeuThichState extends State<YeuThich> {
  final TextEditingController searchYeuThich = TextEditingController();
  String searchKeyYeuThich = '';

  final CollectionReference updataYeuThich = FirebaseFirestore.instance.collection('FavoriteProduct');
  bool sapXepYeuThich = true;
  late Stream<QuerySnapshot> productStreamYeuThich;

  @override
  void initState() {
    super.initState();
    productStreamYeuThich = updataYeuThich.snapshots();
  }

  void searchValue() {
    String normalizedKeyword = normalizeString(searchKeyYeuThich);
    setState(() {
      productStreamYeuThich = updataYeuThich
          .where('tenSP', isGreaterThanOrEqualTo: normalizedKeyword)
          .where('tenSP', isLessThan: '${normalizedKeyword}z')
          .snapshots();
    });
  }

  String normalizeString(String input) {
    return input.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text('Yêu thích'),
        backgroundColor: Color(0xffE47905),
        automaticallyImplyLeading: false, // Ẩn icon back
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffFEF7E5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(13 * fem, 28 * fem, 13 * fem, 12.5 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20 * fem),
                    height: 45 * fem,
                    child: Row(
                      children: [
                        Expanded(
                          child: CupertinoSearchTextField(
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xffE47905)),
                              color: const Color(0xffFEF7E5),
                              borderRadius: BorderRadius.circular(30 * fem),
                            ),
                            placeholder: 'Tìm kiếm',
                            onChanged: (value) {
                              setState(() {
                                searchKeyYeuThich = value;
                                searchValue();
                              });
                            },
                            controller: searchYeuThich,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40 * fem, vertical: 1 * fem),
                    width: double.infinity,
                    height: 32 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffE47905),
                      borderRadius: BorderRadius.circular(30 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Sản phẩm đã thích',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Quicksand',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.3333333333 * ffem / fem,
                          color: Color(0xffFEF7E5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: sapXepYeuThich
                    ? productStreamYeuThich
                    : updataYeuThich.orderBy('tenSP').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('Không có dữ liệu'));
                  }

                  final nuoc = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: nuoc.length,
                    itemBuilder: (context, document) {
                      final DocumentSnapshot documentSnapshotYeuThich = nuoc[document];
                      final IDsp = documentSnapshotYeuThich['id'];

                      return StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Product')
                            .doc(IDsp)
                            .snapshots(),
                        builder: (context, index) {
                          if (index.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          if (!index.hasData || index.data == null) {
                            return const Center(child: Text('Không có dữ liệu'));
                          }

                          final sanphamyeuthich = index.data?.data() as Map<String, dynamic>? ?? {};
                          if (sanphamyeuthich.isEmpty) {
                            return const Center(child: Text('Dữ liệu sản phẩm trống'));
                          }

                          final hinhanh = sanphamyeuthich['hinhAnh'];
                          final tenSP = sanphamyeuthich['tenSP'];
                          final kichthuoc = sanphamyeuthich['kichThuoc'];
                          final dongia = sanphamyeuthich['donGia'];
                          final donvitinh = sanphamyeuthich['donVitinh'];
                          bool matchesSearch = tenSP.toLowerCase().contains(searchKeyYeuThich.toLowerCase());

                          if (!matchesSearch) {
                            return Container();
                          }
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8.0),
                              visualDensity: VisualDensity(vertical: 4),
                              tileColor: Colors.white10,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ChiTietSanPhamKH(idspKH: IDsp),
                                  ),
                                );
                              },
                              leading: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 60,
                                  minHeight: 55,
                                  maxWidth: 64,
                                  maxHeight: 64,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(hinhanh, fit: BoxFit.cover),
                                ),
                              ),
                              title: Text(
                                tenSP,
                                style: const TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffE47905),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kích thước: $kichthuoc",
                                    style: TextStyle(
                                      fontSize: 15, // Adjust the font size as needed
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "$dongia/$donvitinh",
                                    style: TextStyle(
                                      fontSize: 15, // Adjust the font size as needed
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  confirmDeleteDialogyeuthich(
                                      updataYeuThich.doc(documentSnapshotYeuThich.id));
                                },
                                icon: Icon(Icons.delete, color: Color(0xFFFA531C)),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future confirmDeleteDialogyeuthich(DocumentReference dele) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa sản phẩm'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc chắn muốn xóa sản phẩm này khỏi danh sách yêu thích không?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () async {
                try {
                  await dele.delete();
                  Fluttertoast.showToast(msg: 'Xóa thành công!');
                } catch (e) {
                  Fluttertoast.showToast(msg: 'Xóa thất bại', backgroundColor: Colors.red);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
