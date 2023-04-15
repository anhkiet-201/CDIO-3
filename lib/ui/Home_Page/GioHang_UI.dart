import 'package:flutter/material.dart';
import 'package:interior_app/component/GioHang_Item.dart';
import 'package:interior_app/data/GioHangData.dart';
import 'package:interior_app/data/LoginData.dart';

import '../../Utils/Utils.dart';
import '../../component/CustomAppbar.dart';
import '../Login_UI.dart';

class GioHang_UI extends StatefulWidget {
  const GioHang_UI({Key? key}) : super(key: key);

  @override
  State<GioHang_UI> createState() => _GioHang_UIState();
}

class _GioHang_UIState extends State<GioHang_UI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: 'Giỏ hàng (${gh.gioHangData.length})',
        action: Center(
          child: GestureDetector(
            child: const Text(
              'Sửa',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ),
      body:user== null ? buildDontLogin() : Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: gh.gioHangData.length,
              itemBuilder: (_,index){
                return Giohang_Item(
                  product: gh.gioHangData[index],
                  gh: gh,
                  index: index,
                  onValueChange: (){
                    print(gh.tongThanhtoan());
                    setState(() {

                    });
                  },
                );
              },
            ),
          ),
          Container(
            height: 75,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                  text: TextSpan(
                    children:[
                      const TextSpan(
                        text:'Tổng thanh toán: '
                      ),
                      TextSpan(
                        text: doubleToVnd(gh.tongThanhtoan().toInt())
                      ),
                    ],
                    style: const TextStyle(
                      color: Colors.black
                    )
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Center(
                      child: Text(
                        'Mua hàng'
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Widget buildDontLogin() {
    return Center(
        child: GestureDetector(
          child: RichText(
            text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'Đăng ký',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  ),
                  TextSpan(
                      text: ' hoặc '
                  ),
                  TextSpan(
                      text: 'Đăng nhập',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      )
                  )
                ],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                )
            ),

          ),
          onTap: (){
            startActivity(context, Login_UI(),
                doAfter: (){
                  setState(() {

                  });
                }
            );
          },
        )
    );
  }

}
