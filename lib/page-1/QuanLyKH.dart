import 'package:flutter/material.dart';
import 'package:myapp/page-1/DanhMucSanPhamKH.dart';
import 'package:myapp/page-1/GioHang.dart';
import 'package:myapp/page-1/TrangChuKH.dart';
import 'package:myapp/page-1/YeuThich.dart';

class QuanLyKH extends StatefulWidget {
  @override
  State<QuanLyKH> createState() => _StateQuanLyKH();
}

class _StateQuanLyKH extends State<QuanLyKH> {

  int selectedIndex = 0;
  List<Widget> widgetOpts = <Widget>[
    TrangChuKH(),
    DanhMucSanPhamKH(),
    GioHang(),
    YeuThich(),
  ];

  void onItemTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOpts.elementAt(selectedIndex),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Color(0xff993300),
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
      child: SizedBox(
        height: 65,
        child: BottomNavigationBar(

          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          items:
          const  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Trang Chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee_outlined),
              activeIcon: Icon(Icons.coffee),
              label: 'Sản Phẩm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Giỏ Hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: 'Yêu thích',
            )
          ],
          currentIndex: selectedIndex,
          onTap: onItemTap,

        ),
      ),
    ));
  }
}
