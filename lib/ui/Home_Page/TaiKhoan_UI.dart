import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_app/Utils/Utils.dart';
import 'package:interior_app/data/LoginData.dart';
import 'package:interior_app/ui/Login_UI.dart';

import '../../component/CustomAppbar.dart';

class TaiKhoan_UI extends StatefulWidget {
  const TaiKhoan_UI({Key? key}) : super(key: key);

  @override
  State<TaiKhoan_UI> createState() => _TaiKhoan_UIState();
}

class _TaiKhoan_UIState extends State<TaiKhoan_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Tài khoản'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child:user==null ? buildDontLogin() : buildProfile(),
            ),
            buildSizedBox(Icons.menu,'Đơn mua'),
            const SizedBox(height: 10,),
            SizedBox(
              height: 75,
              child: Row(
                children: [
                  buildExpanded(Icons.check,'Chờ xác nhận'),
                  buildExpanded(Icons.wallet_giftcard,'Chờ lấy'),
                  buildExpanded(Icons.local_shipping,'Đang giao'),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            buildSizedBox(Icons.history,'Lịch sử mua hàng'),
            const SizedBox(height: 10,),
            buildSizedBox(Icons.settings,'Thiết lập tài khoản'),
            const SizedBox(height: 10,),
            buildSizedBox(Icons.support,'Trung tâm trợ giúp'),
            Spacer(),
            user != null ? GestureDetector(
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Center(
                      child: Text(
                        'Đăng xuất',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                ),
                onTap: (){
                  user = null;
                  setState(() {

                  });
                }
            ) : SizedBox()
          ],
        ),
      ),
    );
  }

  Row buildProfile() {
    return Row(
              children: [
                Icon(Iconsax.personalcard,size: 75,),
                SizedBox(width: 10,),
                Text(
                    'Hồ Anh Kiệt',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            );
  }

  Widget buildDontLogin() {
    return Center(
      child: GestureDetector(
        child: RichText(
        text: TextSpan(
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

  SizedBox buildSizedBox(IconData icon, String title) {
    return SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 20,),
                SizedBox(width: 10,),
                Text(
                    title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              ],
            ),
          );
  }

  Expanded buildExpanded(IconData icon, String title) {
    return Expanded(
                    child: Container(
                      margin: EdgeInsets.all(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon),
                          Text(title,style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    )
                );
  }
}
