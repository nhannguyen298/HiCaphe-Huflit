import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/utils.dart';
import 'ChiTietSanPhamKH.dart';

class ChiTietSPDH extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  final String Name;
  const ChiTietSPDH(
      {Key? key, required this.documentSnapshot, required this.Name})
      : super(key: key);

  @override
  State<ChiTietSPDH> createState() => _ChiTietSPDHState();
}

class _ChiTietSPDHState extends State<ChiTietSPDH> {
  Future<void> updateOrderStatus(String orderId) async {
    try {
      // Update tinhTrang field to "đơn đã hủy"
      await FirebaseFirestore.instance
          .collection('Bill')
          .doc(orderId)
          .update({'tinhTrang': 'Đơn đã hủy'});

      Fluttertoast.showToast(
        msg: "Đơn hàng đã được hủy",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (error) {
      print("Error updating order status: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final mahoadon = widget.documentSnapshot.id;
    final ngayDH = widget.documentSnapshot['ngayDH'];
    final thanhtien = widget.documentSnapshot['tongHoaDon'];
    final phuongthuc = widget.documentSnapshot['phuongThucThanhToan'];
    final tinhTrang = widget.documentSnapshot['tinhTrang'];
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xfff5dab1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5dab1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                          16 * fem, 16 * fem, 0 * fem, 20 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 11 * fem),
                              width: 32 * fem,
                              height: 32 * fem,
                              child: Image.asset(
                                'assets/page-1/images/vector.png',
                                width: 32 * fem,
                                height: 32 * fem,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                8 * fem, 0 * fem, 0 * fem, 21 * fem),
                            width: double.infinity,
                            height: 90 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 22 * fem, 0 * fem),
                                  width: 90 * fem,
                                  height: 90 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/safe.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 15 * fem),
                                        child: Text(
                                          mahoadon,
                                          style: SafeGoogleFont(
                                            'Quicksand',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ngayDH,
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: Color(0xff993300),
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
                                8 * fem, 0 * fem, 0 * fem, 17 * fem),
                            width: 900 * fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 5 * fem),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 2 * fem, 0 * fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  30 * fem,
                                                  0 * fem),
                                              child: Text(
                                                'Tên khách hàng',
                                                style: SafeGoogleFont(
                                                  'Quicksand',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.25 * ffem / fem,
                                                  color: Color(0xff007373),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              widget.Name,
                                              style: SafeGoogleFont(
                                                'Quicksand',
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.25 * ffem / fem,
                                                color: Color(0xff993300),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5 * fem,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  72 * fem,
                                                  0 * fem),
                                              child: Text(
                                                'Thành tiền',
                                                style: SafeGoogleFont(
                                                  'Quicksand',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.25 * ffem / fem,
                                                  color: Color(0xff007373),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              thanhtien.toString() + "VND",
                                              style: SafeGoogleFont(
                                                'Quicksand',
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.25 * ffem / fem,
                                                color: Color(0xff993300),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5 * fem,
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 43 * fem, 0 * fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  19 * fem,
                                                  0 * fem),
                                              child: Text(
                                                'Phương thức thanh toán',
                                                style: SafeGoogleFont(
                                                  'Quicksand',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.25 * ffem / fem,
                                                  color: Color(0xff007373),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              phuongthuc,
                                              style: SafeGoogleFont(
                                                'Quicksand',
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.25 * ffem / fem,
                                                color: Color(0xff993300),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 48 * fem, 0 * fem),
                                        child: Text(
                                          'Tình trạng đơn hàng',
                                          style: SafeGoogleFont(
                                            'Quicksand',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.25 * ffem / fem,
                                            color: Color(0xff007373),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        tinhTrang,
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.25 * ffem / fem,
                                          color: Color(0xff993300),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await updateOrderStatus(mahoadon);
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  53 * fem, 0 * fem, 55.96 * fem, 0 * fem),
                              width: double.infinity,
                              height: 32 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff993300),
                                borderRadius: BorderRadius.circular(30 * fem),
                              ),
                              child: Center(
                                child: Center(
                                  child: Text(
                                    'Hủy đơn hàng',
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Bill')
                      .doc(mahoadon)
                      .collection('products')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final products = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final productSnapshot = products[index];
                        final idSP = productSnapshot['id'];
                        final soluong = productSnapshot['soluong'];
                        // Thực hiện truy vấn dữ liệu từ collection Product
                        return StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Product')
                              .doc(idSP)
                              .snapshots(),
                          builder: (context, productDataSnapshot) {
                            if (!productDataSnapshot.hasData ||
                                productDataSnapshot.data == null) {
                              return Text('Không có dữ liệu cho idSP: $idSP');
                            }
                            final Map<String, dynamic>? productData =
                            productDataSnapshot.data?.data()
                            as Map<String, dynamic>?;

                            if (productData == null) {
                              return Text(
                                  'Dữ liệu sản phẩm trống cho idSP: $idSP');
                            }

                            final tensp = productData['tenSP'] as String?;
                            final hinhanh = productData['hinhAnh'] as String?;
                            final kichthuoc =
                            productData['kichThuoc'] as String?;
                            final dongia = productData['donGia'] as int?;

                            if (tensp == null ||
                                hinhanh == null ||
                                kichthuoc == null ||
                                dongia == null) {
                              return Text(
                                  'Dữ liệu sản phẩm không đầy đủ cho idSP: $idSP');
                            }
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChiTietSanPhamKH(idspKH: idSP),
                                    ),
                                  );
                                },
                                leading: Image.network(hinhanh),
                                title: Text(
                                  tensp,
                                  style: SafeGoogleFont(
                                    'Quicksand',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.25 * ffem / fem,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kích thước : " + kichthuoc,
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25 * ffem / fem,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                    Text(
                                      "Số lượng : " + soluong.toString(),
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25 * ffem / fem,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                    Text(
                                      "Đơn giá : " + dongia.toString() + ' VND',
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.25 * ffem / fem,
                                        color: Color(0xff777777),
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
