import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/utils.dart';
import 'ChiTietSanPham.dart';
import 'package:myapp/page-1/DanhMucDonHang.dart';

class ChiTetDonHang extends StatefulWidget {
  final String id, displayName, ngayDH, tinhTrang;
  final double dongia;
  const ChiTetDonHang(
      {super.key,
      required this.id,
      required this.displayName,
      required this.dongia,
      required this.ngayDH,
      required this.tinhTrang});

  @override
  State<ChiTetDonHang> createState() => _ChiTetDonHangState();
}

class _ChiTetDonHangState extends State<ChiTetDonHang> {
  String? tinhtrang;
  String selectCheckin = 'Tiền mặt';
  String selectedTrangThai = "Đã đặt hàng";
  late String displayedOrderStatus;
  bool isOrderCanceled = false;

  @override
  void initState() {
    super.initState();
    displayedOrderStatus = widget.tinhTrang;
    isOrderCanceled = widget.tinhTrang.toLowerCase() == 'đơn đã hủy';
    selectedTrangThai = isOrderCanceled ? 'Đã hủy đơn' : 'Đã đặt hàng';
  }

  final CollectionReference updataDatHang =
      FirebaseFirestore.instance.collection('Bill');

  Future<void> updateTrangThai(String newTrangThai) async {
    try {
      if (!isOrderCanceled) {
        await FirebaseFirestore.instance
            .collection('Bill')
            .doc(widget.id)
            .update({
          'tinhTrang': newTrangThai,
          'isCanceled': newTrangThai.toLowerCase() == 'đơn đã hủy'
        });

        setState(() {
          displayedOrderStatus = newTrangThai;
          isOrderCanceled = newTrangThai.toLowerCase() == 'đơn đã hủy';
        });

        if (newTrangThai == 'đơn đã hủy') {
          setState(() {
            isOrderCanceled = true;
          });
        }

        Fluttertoast.showToast(msg: 'Cập nhật thành công');
      } else {
        Fluttertoast.showToast(msg: 'Đơn đã bị hủy, không thể cập nhật trạng thái.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Cập nhật thất bại');
      print(e.toString());
    }
  }

  Future<void> updatePaymentMethod(String newPaymentMethod) async {
    try {
      await FirebaseFirestore.instance
          .collection('Bill')
          .doc(widget.id)
          .update({'phuongThucThanhToan': newPaymentMethod});
    } catch (e) {
      print(e.toString());
    }
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
          decoration: const BoxDecoration(color: Color(0xfff5dab1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xfff5dab1)),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DanhMucDonHang()));
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
                                          widget.id,
                                          style: SafeGoogleFont(
                                            'Quicksand',
                                            fontSize: 14 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.25 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        widget.ngayDH,
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
                                              widget.displayName,
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
                                      SizedBox(height: 5 * fem),
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
                                              widget.dongia.toString(),
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
                                      SizedBox(height: 5 * fem),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 30 * fem, 0 * fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0 * fem,
                                                  8 * fem,
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
                                            Container(
                                              child: SizedBox(
                                                width: 134,
                                                child: DropdownButtonFormField<
                                                    String>(
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                  ),
                                                  value: selectCheckin,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      selectCheckin = newValue!;
                                                    });
                                                  },
                                                  items: [
                                                    'Tiền mặt',
                                                    'Google Pay'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: SafeGoogleFont(
                                                          'Quicksand',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height:
                                                              1.25 * ffem / fem,
                                                          color: const Color(
                                                              0xff000000),
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
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
                                            0 * fem, 30 * fem, 0 * fem),
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
                                      Container(
                                        child: SizedBox(
                                          width: 136,
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.transparent),
                                              ),
                                            ),
                                            value: selectedTrangThai,
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectedTrangThai = newValue!;
                                              });
                                            },
                                            items: [
                                              'Đã đặt hàng',
                                              'Đã thanh toán',
                                              'Đang giao',
                                              'Đã nhận hàng',
                                              'Đã hủy đơn'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: SafeGoogleFont(
                                                    'Quicksand',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.25 * ffem / fem,
                                                    color:
                                                        const Color(0xff000000),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            enableFeedback: !isOrderCanceled,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              updateTrangThai(selectedTrangThai);
                              updatePaymentMethod(selectCheckin);
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
                                    'Lưu trạng thái đơn hàng',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Quicksand',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3333333333 * ffem / fem,
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
                  stream: updataDatHang
                      .doc(widget.id)
                      .collection('products')
                      .snapshots(),
                  builder: (context, snapshot) {
                    final giohang = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: giohang.length,
                      itemBuilder: (context, document) {
                        final DocumentSnapshot documentSnapshotGioHang =
                            giohang[document];
                        final idSP = documentSnapshotGioHang['id'];
                        final soluong = documentSnapshotGioHang['soluong'];
                        return StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Product')
                              .doc(idSP)
                              .snapshots(),
                          builder: (context, index) {
                            if (!index.hasData || index.data == null) {
                              return Text('Không có dữ liệu cho idSP: $idSP');
                            }
                            final productData =
                                index.data?.data() as Map<String, dynamic>? ??
                                    {};
                            if (productData.isEmpty) {
                              return Text(
                                  'Dữ liệu sản phẩm trống cho idSP: $idSP');
                            }
                            final tensp = productData['tenSP'];
                            final hinhanh = productData['hinhAnh'];
                            final kichthuoc = productData['kichThuoc'];
                            final dongia = productData['donGia'];
                            return SizedBox(
                              height: 120,
                              child: Card(
                                child: ListTile(
                                  visualDensity: VisualDensity(vertical: 4),
                                  tileColor: Color(0xfff5dab1),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChiTietSanPham(
                                                    productId: idSP)));
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
                                      child: Image.network(hinhanh,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  title: Text(
                                    tensp,
                                    style: SafeGoogleFont(
                                      'Quicksand',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kích thước : " + kichthuoc,
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Số lượng : " + soluong.toString(),
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        "Đơn giá : " +
                                            dongia.toString() +
                                            ' VND',
                                        style: SafeGoogleFont(
                                          'Quicksand',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
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
