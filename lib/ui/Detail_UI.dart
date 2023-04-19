import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_app/component/CustomAppbar.dart';
import 'package:interior_app/data/GioHangData.dart';
import 'package:interior_app/data/ProductsData.dart';
import 'package:interior_app/models/Product.dart';

import '../Utils/Utils.dart';
import 'ViewMore_UI.dart';
import '../data/LoginData.dart';

class Detail_UI extends StatefulWidget {
  const Detail_UI({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<Detail_UI> createState() => _Detail_UIState();
}

class _Detail_UIState extends State<Detail_UI> {

  int _num = 1;

  void changeNum(int n){
    if(n == 0) {
      return;
    }
    setState(() {
      _num = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppbar(title: '',leadingAuto: true,action: const Icon(Iconsax.shopping_cart)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset('images/${widget.product.img}',fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              '${widget.product.tenSp}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            Text(
              doubleToVnd(widget.product.donGia),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 25,
                      width: 25,
                      child: Icon(Iconsax.minus),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Colors.black,
                                  width: 1
                              )
                          )
                      ),
                    ),
                    onTap: (){
                      changeNum(_num - 1);
                    },
                  ),
                  Container(
                    height: 25,
                    width: 75,
                    child: Center(
                      child: Text(
                        _num.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      height: 25,
                      width: 25,
                      child: Icon(Iconsax.add),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.black,
                                  width: 1
                              )
                          )
                      ),
                    ),
                    onTap: (){
                      changeNum(_num + 1);
                    },
                  )
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: RichText(
                text: TextSpan(
                  children:[
                    TextSpan(
                      text: 'Mô tả: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: 'Bàn ghế phòng ăn là vật dụng không thể thiếu trong ngôi nhà của bạn. Với chất liệu từ gỗ cao su,… đa dạng về mẫu mã và chất liệu và giá cả rẻ nhất trên thị trường Hà Nội. Chúng tôi với hơn 10 năm kinh nghiệm từ sản xuất, thi công và thiết kế. Tại noithatdangkhoa.com chúng tôi chuyên bán buôn, bán lẻ nên các bạn cứ yên tâm về giá cả và chất lượng nhé !',
                    )
                  ],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            buildRow('Sản phầm tương tự')
          ],
        ),
      ),
      bottomNavigationBar: user == null ? null : SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton('Thêm vào giỏ',onClick: (){
              gh.add(_num,widget.product);
              showSnackBar(context, contentType: ContentType.help, title: 'Thông báo', message: 'Thành công');
            }),
            buildButton('Mua ngay'),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text,{Function? onClick}){
    return Expanded(
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
                text
            ),
          ),
        ),
        onTap: ()=>onClick?.call(),
      ),
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
                itemCount: productData.length,
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
                              child: Image.asset('images/${productData[index].img}',fit: BoxFit.cover,),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Text(
                                    '${productData[index].tenSp}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                      doubleToVnd(productData[index].donGia)
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      startActivity(context, Detail_UI(product: productData[index],));
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
