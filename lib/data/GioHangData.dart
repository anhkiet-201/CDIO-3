import 'dart:math';

import 'package:interior_app/models/Product.dart';

final GioHangData gh = GioHangData();

class GioHangData {
  List<Product> gioHangData = [
    // Product(maSp: '001', donGia: 1230000, maDM: 'DM01', tenSp: 'Bàn ăn gia đình',img: 'img.png'),
    // Product(maSp: '002', donGia: 1230000, maDM: 'DM01', tenSp: 'Bàn ăn gia đình',img: 'img.png'),
    // Product(maSp: '003', donGia: 1230000, maDM: 'DM01', tenSp: 'Bàn ăn gia đình',img: 'img.png'),

  ];
  late List<bool> checkList = [];
  late List<int> numList = [];
  GioHangData(){
    // checkList = List.filled(gioHangData.length, false);
    // numList = List.filled(gioHangData.length, Random().nextInt(5) + 1);
  }

  add(int num,Product product){
    gioHangData.add(product);
    checkList.add(false);
    numList.add(num);
  }

  double tongThanhtoan (){
    double tongThanhToan = 0;
    for(int i =0; i < gioHangData.length; i++){
      if(checkList[i]){
        tongThanhToan += (gioHangData[i].donGia * numList[i]);
      }
    }
    return tongThanhToan;
  }

  void check(int index, bool value){
    checkList[index] = value;
  }


}