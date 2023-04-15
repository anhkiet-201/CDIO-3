import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interior_app/Utils/Utils.dart';
import 'package:interior_app/ui/Detail_UI.dart';
import 'package:interior_app/ui/ViewMore_UI.dart';

import '../../component/CustomAppbar.dart';

class CuaHang_UI extends StatefulWidget {
  const CuaHang_UI({Key? key}) : super(key: key);

  @override
  State<CuaHang_UI> createState() => _CuaHang_UIState();
}

class _CuaHang_UIState extends State<CuaHang_UI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: 'Interior app'),
        body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                    aspectRatio: 300/MediaQuery.of(context).size.width,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2)
                ),
                items: [
                  Image.network('https://png.pngtree.com/png-clipart/20210523/original/pngtree-interior-home-decoration-banner-png-image_6321356.jpg',height:300,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
                ],
              ),
            ),
            buildRow('Sản phẩm bán chạy'),
            buildRow('Sản phẩm mới nhất'),
            buildRow('Sản phẩm đuộc yêu thích'),
          ],
        ),
      )
    );
  }

  SizedBox buildRow(String title) {
    return SizedBox(
            child: Column(
              children: [
                SizedBox(
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            'Xem thêm',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          onTap: (){
                            startActivity(context, ViewMore_UI(title: title));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: 275,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_,index){
                        return GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            width: 150,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    child: Image.asset('images/img.png',fit: BoxFit.cover,),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Bàn ăn gia đình',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                            doubleToVnd(12000000)
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: (){
                            startActivity(context, Detail_UI());
                          },
                        );
                      },
                    )
                )
              ],
            ),
          );
  }


}
