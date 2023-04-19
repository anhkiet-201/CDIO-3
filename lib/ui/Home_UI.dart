import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_app/component/CustomAppbar.dart';
import 'package:interior_app/ui/Home_Page/CuaHang_UI.dart';
import 'package:interior_app/ui/Home_Page/DonHang_UI.dart';
import 'package:interior_app/ui/Home_Page/GioHang_UI.dart';
import 'package:interior_app/ui/Home_Page/QuanLy_UI.dart';
import 'package:interior_app/ui/Home_Page/TaiKhoan_UI.dart';

class Home_UI extends StatefulWidget {
  const Home_UI({Key? key}) : super(key: key);

  @override
  State<Home_UI> createState() => _Home_UIState();
}

class _Home_UIState extends State<Home_UI> {
  int _currentIndex = 1;
  List<Widget> _pages = [GioHang_UI(),CuaHang_UI(),TaiKhoan_UI()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index)=>setState(() {
          this._currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_bag),
            label: "Giỏi hàng"
          ),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.shop),
              label: "Cửa hàng"
          ),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.personalcard),
              label: "Tài khoản"
          )
        ],
      ),
    );
  }
}
