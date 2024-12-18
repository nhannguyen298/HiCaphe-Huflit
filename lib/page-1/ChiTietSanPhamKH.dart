import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChiTietSanPhamKH extends StatefulWidget {
  final String idspKH;

  const ChiTietSanPhamKH({Key? key, required this.idspKH}) : super(key: key);

  @override
  _ChiTietSanPhamKHState createState() => _ChiTietSanPhamKHState();
}

class _ChiTietSanPhamKHState extends State<ChiTietSanPhamKH> {
  late DocumentSnapshot product;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }

  void fetchProductDetails() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentSnapshot productSnapshot =
    await firestore.collection('Product').doc(widget.idspKH).get();
    setState(() {
      product = productSnapshot;
      isLoading = false;
    });
  }

  void addToCart(DocumentSnapshot product) async {
    final String newId = DateTime.now().millisecondsSinceEpoch.toString();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Fluttertoast.showToast(
          msg: 'Bạn cần đăng nhập để thêm vào giỏ hàng',
          backgroundColor: Colors.red);
      return;
    }

    String uid = user.uid;
    DocumentSnapshot Users = await firestore.collection("Users").doc(uid).get();
    String Uid = Users.id;
    QuerySnapshot cartProducts = await firestore
        .collection("Cart")
        .where("id", isEqualTo: product.id)
        .get();

    double donGia = product['donGia'].toDouble();

    if (cartProducts.docs.isNotEmpty) {
      final DocumentSnapshot existingProduct = cartProducts.docs[0];
      final currentQuantity = existingProduct.get("soluong");
      final newQuantity = currentQuantity + 1;
      final newTotal = newQuantity * donGia;

      await firestore.collection("Cart").doc(existingProduct.id).update({
        "soluong": newQuantity,
        "thanhTien": newTotal,
      });
    } else {
      await firestore.collection("Cart").add({
        "donGia": donGia,
        "soluong": 1,
        "thanhTien": donGia,
        "idCate": product['idCate'],
        "id": product.id,
        "uid": Uid,
      });

      Fluttertoast.showToast(msg: 'Đã thêm vào giỏ hàng của bạn!');
    }
  }

  void addToFavorite(DocumentSnapshot product) async {
    final String newId = DateTime.now().millisecondsSinceEpoch.toString();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Fluttertoast.showToast(
          msg: 'Bạn cần đăng nhập để thêm vào yêu thích',
          backgroundColor: Colors.red);
      return;
    }

    String uid = user.uid;
    DocumentSnapshot Users = await firestore.collection("Users").doc(uid).get();
    String Uid = Users.id;
    QuerySnapshot favoriteProducts = await firestore
        .collection("FavoriteProduct")
        .where("id", isEqualTo: product.id)
        .get();

    if (favoriteProducts.docs.isEmpty) {
      await firestore.collection("FavoriteProduct").doc(newId).set({
        "idCate": product['idCate'],
        "id": product.id,
        "uid": Uid,
      });
      Fluttertoast.showToast(msg: 'Đã thêm vào danh sách yêu thích!');
    } else {
      Fluttertoast.showToast(
          msg: 'Sản phẩm đã tồn tại trong danh sách yêu thích',
          backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Chi Tiết Sản Phẩm'),
          backgroundColor: Color(0xfff5dab1),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final String tenSP = product['tenSP'];
    final String hinhAnh = product['hinhAnh'];
    final String kichThuoc = product['kichThuoc'];
    final double donGia = product['donGia'].toDouble();
    final String moTa = product['moTa'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi Tiết Sản Phẩm'),
        backgroundColor: Color(0xff993300),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and price
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      hinhAnh,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xfff5dab1), Color(0xff993300)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Text(
                      '${donGia.toStringAsFixed(0)} VNĐ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Product title
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                tenSP,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff993300),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Product description
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                moTa,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Product size
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Kích thước: $kichThuoc',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Add to cart button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      addToFavorite(product);
                    },
                    icon: const Icon(Icons.favorite_border),
                    label: const Text(
                      'Yêu Thích',
                      style: TextStyle(fontSize: 16), // Increased text size
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff993300),
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0, // Add padding for better spacing
                        vertical: 10.0, // Add padding for better spacing
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      addToCart(product);
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
                      'Thêm Vào Giỏ Hàng',
                      style: TextStyle(fontSize: 16), // Increased text size
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff993300),
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0, // Add padding for better spacing
                        vertical: 10.0, // Add padding for better spacing
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
