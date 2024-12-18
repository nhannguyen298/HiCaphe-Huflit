import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/page-1/QuanLyKH.dart';
import 'package:myapp/utils.dart';

import '../model/YeuThich.dart';
import 'ChiTietSanPhamKH.dart';

class DanhMucSanPhamKH extends StatefulWidget {
  const DanhMucSanPhamKH({super.key});

  @override
  State<DanhMucSanPhamKH> createState() => _DanhMucSanPhamKHState();
}

class _DanhMucSanPhamKHState extends State<DanhMucSanPhamKH> {
  Future addnewFavorite(CaPheYeuThich capheyeuthich) async {
    final String newId = DateTime.now().millisecondsSinceEpoch.toString();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    String uid = user.uid;
    DocumentSnapshot Users = await firestore.collection("Users").doc(uid).get();
    String Uid = Users.id;
    try {
      await firestore.collection("FavoriteProduct").doc(newId).set({
        "idCate": capheyeuthich.idCate,
        "id": capheyeuthich.idSP,
        "uid": Uid,
      });
      Fluttertoast.showToast(msg: 'Đã thêm vào danh sách yêu thích!');
    } catch (e) {
      Fluttertoast.showToast(msg: 'Thêm thất bại', backgroundColor: Colors.red);
    }
  }

  void addToCart(DocumentSnapshot product) async {
    final String newId = DateTime.now().millisecondsSinceEpoch.toString();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    String uid = user.uid;
    DocumentSnapshot Users = await firestore.collection("Users").doc(uid).get();
    String Uid = Users.id;
    QuerySnapshot cartProducts = await firestore
        .collection("Cart")
        .where("id", isEqualTo: product.id)
        .get();

    if (cartProducts.docs.isNotEmpty) {
      final DocumentSnapshot existingProduct = cartProducts.docs[0];
      final currentQuantity = existingProduct.get("soluong");
      final currentTotal = existingProduct.get("thanhTien");
      final newQuantity = currentQuantity + 1;
      final newTotal = newQuantity * product.get("donGia");

      await firestore.collection("Cart").doc(existingProduct.id).update({
        "soluong": newQuantity,
        "thanhTien": newTotal,
      });
    } else {
      await firestore.collection("Cart").add({
        "donGia": product['donGia'],
        "soluong": 1,
        "thanhTien": product['donGia'],
        "idCate": product['idCate'],
        "id": product.id,
        "uid": Uid,
      });

      Fluttertoast.showToast(msg: 'Đã thêm vào giỏ hàng của bạn!');
      final QuerySnapshot snapshot = await firestore.collection("Cart").get();
      double total = 0.0;
      for (final QueryDocumentSnapshot doc in snapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final int thanhTien = data['thanhTien'];
        total += thanhTien;
      }
      setState(() {
        tonghoadonKH = total;
      });
    }
  }

  double tonghoadonKH = 0.0;
  String selectedIdCateKH = '';
  void filterProductsByCate(String idCate) {
    setState(() {
      productStreamKH = updataKH.where('idCate', isEqualTo: idCate).snapshots();
    });
  }

  final TextEditingController searchKH = TextEditingController();
  String searchKeyKH = '';
  List<DocumentSnapshot> filteredSearchKH = [];
  String normalizeString(String input) {
    return input.toLowerCase();
  }

  void searchValue() {
    String normalizedKeyword = normalizeString(searchKeyKH);
    setState(() {
      productStreamKH = updataKH
          .where('tenSP', isGreaterThanOrEqualTo: normalizedKeyword)
          .where('tenSP', isLessThan: '${normalizedKeyword}z')
          .snapshots();
    });
  }

  final CollectionReference updataKH =
  FirebaseFirestore.instance.collection('Product');
  final CollectionReference upCateKH =
  FirebaseFirestore.instance.collection('Category');
  bool sapXepKH = true;
  late Stream<QuerySnapshot> productStreamKH;
  void updateProductStream() {
    setState(() {
      productStreamKH = updataKH.orderBy('tenSP').snapshots();
    });
  }

  @override
  void initState() {
    super.initState();
    productStreamKH = updataKH.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sản phẩm'),
        automaticallyImplyLeading: false, // Hides the back button
        backgroundColor: const Color(0xffE47905),
      ),
      body: Material(
        type: MaterialType.transparency,
        child: SizedBox(
          width: double.infinity,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffFEF7E5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                      13 * fem, 4 * fem, 0 * fem, 12.5 * fem),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 13 * fem, 22 * fem),
                          width: double.infinity,
                          height: 45 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 10 * fem, 0 * fem, 0 * fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 340,
                                      child: CupertinoSearchTextField(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffE47905)),
                                          color: const Color(0xffFEF7E5),
                                          borderRadius:
                                          BorderRadius.circular(30 * fem),
                                        ),
                                        placeholder: 'Tìm kiếm',
                                        onChanged: (value) {
                                          setState(() {
                                            searchKeyKH = value;
                                          });
                                        },
                                        controller: searchKH,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 17.5 * fem),
                          width: double.infinity,
                          height: 50 * fem,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: upCateKH.snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(child: Text('Error: ${snapshot.error}'));
                              }
                              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                                return Center(child: Text('No categories available'));
                              }

                              final loc = snapshot.data!.docs;

                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: loc.length,
                                itemBuilder: (context, index) {
                                  final DocumentSnapshot documentSnapshot = loc[index];
                                  final id = documentSnapshot.id;

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIdCateKH = id;
                                        });
                                        filterProductsByCate(id);
                                      },
                                      child: Chip(
                                        backgroundColor: selectedIdCateKH == id
                                            ? const Color(0xffE47905)
                                            : const Color(0xFFFD9220),
                                        label: Text(
                                          documentSnapshot['Name'],
                                          style: const TextStyle(
                                            color: Color(0xffFEF7E5),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              12 * fem, 0 * fem, 23 * fem, 0 * fem),
                          width: double.infinity,
                          height: 25 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sapXepKH = !sapXepKH;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          210 * fem, 0 * fem, 8 * fem, 4 * fem),
                                      width: 20 * fem,
                                      height: 20 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/btsapxep.png',
                                        width: 18 * fem,
                                        height: 18 * fem,
                                        color: const Color(0xffE47905),
                                      ),
                                    ),
                                    Text(
                                      'Sắp xếp',
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.25 * ffem / fem,
                                        color: const Color(0xffE47905),
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
                      stream: sapXepKH
                          ? productStreamKH
                          : updataKH.orderBy('tenSP').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(
                            child: Text('Không có dữ liệu'),
                          );
                        }
                        final nuoc = snapshot.data!.docs;
                        Set<String> productNames = {};
                        if (selectedIdCateKH.isNotEmpty) {
                          for (var sanpham in nuoc) {
                            if (sanpham['idCate'] == selectedIdCateKH &&
                                sanpham['tenSP']
                                    .toString()
                                    .toLowerCase()
                                    .contains(searchKeyKH.toLowerCase())) {
                              productNames.add(sanpham['tenSP']);
                            }
                          }
                        } else {
                          for (var sanpham in nuoc) {
                            if (sanpham['tenSP']
                                .toString()
                                .toLowerCase()
                                .contains(searchKeyKH.toLowerCase())) {
                              productNames.add(sanpham['tenSP']);
                            }
                          }
                        }
                        List<String> uniqueProductNames = productNames.toList();
                        filteredSearchKH = nuoc
                            .where((sanpham) => sanpham['tenSP']
                            .toString()
                            .toLowerCase()
                            .contains(searchKeyKH.toLowerCase()))
                            .toList();

                        return ListView.builder(
                            itemCount: uniqueProductNames.length,
                            itemBuilder: (context, document) {
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
                                  final idCate = documentSnapshotSP['idCate'];
                                  final id = documentSnapshotSP.id;
                                  return Card(
                                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 3,
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(10),
                                      visualDensity: VisualDensity(vertical: 4),
                                      tileColor: Colors.white10,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChiTietSanPhamKH(idspKH: id),
                                          ),
                                        );
                                      },
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          hinhAnh,
                                          fit: BoxFit.cover,
                                          width: 64,
                                          height: 64,
                                        ),
                                      ),
                                      title: Text(
                                        tenSP,
                                        style: SafeGoogleFont('Quicksand',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xffE47905)),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Kích thước : " + Size,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Text(
                                            donGia.toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              final String newId = DateTime
                                                  .now()
                                                  .millisecondsSinceEpoch
                                                  .toString();
                                              final FirebaseFirestore
                                              firestore =
                                                  FirebaseFirestore.instance;
                                              QuerySnapshot favoriteProducts =
                                              await firestore
                                                  .collection(
                                                  "FavoriteProduct")
                                                  .where("id",
                                                  isEqualTo: id)
                                                  .get();
                                              if (favoriteProducts
                                                  .docs.isEmpty) {
                                                CaPheYeuThich yeuthich =
                                                CaPheYeuThich(id, idCate);
                                                addnewFavorite(yeuthich);
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                    'Sản phẩm đã tồn tại trong danh sách yêu thích',
                                                    backgroundColor: Colors.red);
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(bottom: 8 * fem),
                                              width: 22,
                                              height: 22,
                                              child: Image.asset(
                                                'assets/page-1/images/btLike.png',
                                                width: 22,
                                                height: 22,
                                                color:  Color(0xffE47905),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              addToCart(documentSnapshotSP);
                                            },
                                            child: Container(
                                              width: 40,
                                              height: 35,
                                              child: Image.asset(
                                                'assets/page-1/images/btAddCart.png',
                                                width: 17 * fem,
                                                height: 20 * fem,
                                                color:  Color(0xffE47905),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
