import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/page-1/CapNhatSanPham.dart';
import 'package:myapp/page-1/ChiTietSanPham.dart';
import 'package:myapp/page-1/ThemSanPham.dart';
import 'package:myapp/page-1/TrangChuNew.dart';
import 'package:myapp/utils.dart';

class DanhMucSanPham extends StatefulWidget {
  const DanhMucSanPham({super.key});

  @override
  State<DanhMucSanPham> createState() => _DanhMucSanPhamState();
}

class _DanhMucSanPhamState extends State<DanhMucSanPham> {
  String selectedIdCate = ''; // Thêm trường này để lưu idCate được chọn
  // hàm lọc danh sức từ Category
  void filterProductsByCate(String idCate) {
    setState(() {
      productStream = updata.where('idCate', isEqualTo: idCate).snapshots();
    });
  }

  final TextEditingController search = TextEditingController();
  String searchKey = '';
  List<DocumentSnapshot> filteredSearch = [];
  String normalizeString(String input) {
    return input.toLowerCase(); // Chuyển hết sang chữ thường
  }

  void searchValue() {
    String normalizedKeyword = normalizeString(searchKey);
    setState(() {
      productStream = updata
          .where('tenSP', isGreaterThanOrEqualTo: normalizedKeyword)
          .where('tenSP', isLessThan: '${normalizedKeyword}z')
          .snapshots();
    });
  }
// Nhưng biến phục vụ chức năng search

  final CollectionReference updata =
      FirebaseFirestore.instance.collection('Product');
  final CollectionReference upCate =
      FirebaseFirestore.instance.collection('Category');
  bool sapXep = true;
  late Stream<QuerySnapshot> productStream;
  void updateProductStream() {
    setState(() {
      productStream = updata.orderBy('tenSP').snapshots();
    });
  }

  @override
  void initState() {
    super.initState();
    // Khởi tạo productStream với dữ liệu ban đầu
    productStream = updata.snapshots();
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
          // danhmucsanphamtB3 (5:376)
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xfff5dab1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // autogroupd25pQv5 (Nuf1G9zcm6EPhD28Yvd25P)
                padding: EdgeInsets.fromLTRB(
                    13 * fem, 48 * fem, 0 * fem, 12.5 * fem),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // group71jBf (5:499)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 13 * fem, 31 * fem),
                        width: double.infinity,
                        height: 45 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectoreZX (5:500)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 0 * fem),
                              width: 45 * fem,
                              height: 45 * fem,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TrangChuNew()));
                                },
                                child: Image.asset(
                                  'assets/page-1/images/vector.png',
                                  width: 45 * fem,
                                  height: 45 * fem,
                                ),
                              ),
                            ),
                            Container(
                              // timkiemyLu (5:501)
                              padding: EdgeInsets.fromLTRB(
                                  17 * fem, 0 * fem, 0 * fem, 0 * fem),
                              height: double.infinity,
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
                                          searchKey = value;
                                        });
                                      },
                                      // chuyển kiểu chữ để nhận dạng sản phẩm
                                      // onSubmitted: (value){
                                      //   searchValue();
                                      // },
                                      controller: search,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // frame36Q4q (5:388)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 17.5 * fem),
                        width: 613 * fem,
                        height: 32 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xfffcf2d9),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfff5dab1),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: upCate.snapshots(),
                                  builder: (context, snapshot) {
                                    final loc = snapshot.data!.docs;
                                    return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: loc.length,
                                        itemBuilder: (context, index) {
                                          final DocumentSnapshot
                                              documentSnapshot = loc[index];
                                          final id = documentSnapshot.id;
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedIdCate = id;
                                                });
                                                filterProductsByCate(id);
                                              },
                                              child: Container(
                                                // width: 140,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff993300),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15.0),
                                                  child: Center(
                                                    child: Text(
                                                      documentSnapshot['Name'],
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xfffcf2d9)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  })),
                        ),
                      ),
                      Container(
                          // autogrouptybbNDw (NuevXdDPScUQ6TNmmXTYBb)
                          margin: EdgeInsets.fromLTRB(
                              12 * fem, 0 * fem, 23 * fem, 0 * fem),
                          width: double.infinity,
                          height: 25 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => ThemSanPham(
                                              updateProductStream:
                                                  updateProductStream)),
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
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 10 * fem, 0 * fem),
                                        child: Text(
                                          'Thêm sản phẩm mới',
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
                                    sapXep =
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
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: sapXep
                        ? productStream
                        : updata.orderBy('tenSP').snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text('Không có dữ liệu'),
                        );
                      }
                      final nuoc = snapshot.data!.docs;
                      // điều kiện lọc sản phẩm từ Category
                      // Sử dụng Set để lưu trữ sản phẩm mà không loại bỏ bản ghi trùng lặp
                      Set<String> productNames = {};
                      // Điều kiện lọc sản phẩm từ Category
                      if (selectedIdCate.isNotEmpty) {
                        // Duyệt qua tất cả sản phẩm và thêm tên sản phẩm vào Set
                        for (var sanpham in nuoc) {
                          if (sanpham['idCate'] == selectedIdCate &&
                              sanpham['tenSP']
                                  .toString()
                                  .toLowerCase()
                                  .contains(searchKey.toLowerCase())) {
                            productNames.add(sanpham['tenSP']);
                          }
                        }
                      } else {
                        // Duyệt qua tất cả sản phẩm và thêm tên sản phẩm vào Set
                        for (var sanpham in nuoc) {
                          if (sanpham['tenSP']
                              .toString()
                              .toLowerCase()
                              .contains(searchKey.toLowerCase())) {
                            productNames.add(sanpham['tenSP']);
                          }
                        }
                      }

                      // Chuyển danh sách Set thành danh sách danh sách
                      List<String> uniqueProductNames = productNames.toList();
                      //thêm dữ liệu vào chuỗi rỗng để lọc sản phẩm phục vụ chức năng tìm kiếm
                      filteredSearch = nuoc
                          .where((sanpham) => sanpham['tenSP']
                              .toString()
                              .toLowerCase()
                              .contains(searchKey.toLowerCase()))
                          .toList();

                      return ListView.builder(
                          // đưa dữ liệu hiển thị lên màn hình
                          itemCount: uniqueProductNames.length,
                          itemBuilder: (context, document) {
                            // Tìm tất cả các sản phẩm có cùng tên và hiển thị chúng
                            List<DocumentSnapshot> productsWithSameName = nuoc
                                .where((sanpham) =>
                                    sanpham['tenSP'] ==
                                    uniqueProductNames[document])
                                .toList();

                            return Column(
                              children: productsWithSameName
                                  .map((documentSnapshotSP) {
                                final tenSP = documentSnapshotSP['tenSP'];
                                final hinhAnh = documentSnapshotSP['hinhAnh'];
                                final Size = documentSnapshotSP['kichThuoc'];
                                final donGia = documentSnapshotSP['donGia'];
                                final id = documentSnapshotSP.id;
                                return SizedBox(
                                  height: 130,
                                  child: Card(
                                    child: ListTile(
                                      tileColor: Color(0xfff5dab2),
                                      visualDensity: VisualDensity(vertical: 4),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChiTietSanPham(productId: id),
                                          ),
                                        );
                                      },
                                      leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(hinhAnh,
                                              fit: BoxFit.cover)),
                                      title: Text(
                                        tenSP,
                                        style: SafeGoogleFont('Quicksand',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Kích thước : " + Size),
                                          Text(donGia.toString() + " VND"),
                                        ],
                                      ),
                                      trailing: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (context) => CapNhatSanPham(
                                                      tensp: documentSnapshotSP[
                                                          'tenSP'],
                                                      soluong:
                                                          documentSnapshotSP[
                                                              'donVitinh'],
                                                      masp: documentSnapshotSP[
                                                          'idCate'],
                                                      kichthuoc:
                                                          documentSnapshotSP[
                                                              'kichThuoc'],
                                                      mota: documentSnapshotSP[
                                                          'moTa'],
                                                      dongia:
                                                          documentSnapshotSP[
                                                                  'donGia']
                                                              .toString(),
                                                      hinhanh:
                                                          documentSnapshotSP[
                                                              'hinhAnh'],
                                                      id: documentSnapshotSP
                                                          .id),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              // bteditbTw (5:459)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  0 * fem,
                                                  8 * fem),
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
                                                0 * fem, 0 * fem, 0 * fem),
                                            width: 40 * fem,
                                            height: 35 * fem,
                                            child: TextButton(
                                              onPressed: () {
                                                confirmDeleteDialog(updata.doc(
                                                    documentSnapshotSP.id));
                                              },
                                              child: Image.asset(
                                                'assets/page-1/images/btxoa.png',
                                                width: 17 * fem,
                                                height: 20 * fem,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future confirmDeleteDialog(DocumentReference dele) async {
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
                    builder: (context) => const DanhMucSanPham()));
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () async {
                try {
                  await dele.delete();
                  Fluttertoast.showToast(msg: 'Xóa   thành công!');
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: 'Xóa thất bại', backgroundColor: Colors.red);
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DanhMucSanPham()));
              },
            ),
          ],
        );
      },
    );
  }
}
