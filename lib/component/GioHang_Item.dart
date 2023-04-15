import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:interior_app/data/GioHangData.dart';
import 'package:interior_app/models/Product.dart';

class Giohang_Item extends StatefulWidget {
  Giohang_Item({required this.product,super.key, this.onValueChange, required this.gh, required this.index});
  final Function()? onValueChange;
  final Product product;
  GioHangData gh;
  final int index;
  @override
  State<Giohang_Item> createState() => _Giohang_ItemState();
}

class _Giohang_ItemState extends State<Giohang_Item> {

  bool _value = false;

  void onValueChange(){

  }

  void changeNum(int n){
    if(n == 0) {
      return;
    }
    setState(() {
      widget.gh.numList[widget.index] = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Row(
            children: [
              Checkbox(
                value: _value, 
                onChanged: (value){
                  widget.onValueChange?.call();
                  widget.gh.check(widget.index, value!);
                  setState(() {
                    _value = value!;
                  });
                }
                ),
              const SizedBox(width: 10,),
              ClipRRect(
                  child: Image.asset('images/${widget.product.img}',width: 75,height: 75,fit: BoxFit.fitHeight,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              const SizedBox(width: 15,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.product.tenSp}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              color: Colors.black,
                              width: 1
                          )
                      ),
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
                              changeNum(widget.gh.numList[widget.index] - 1);
                              widget.onValueChange?.call();
                            },
                          ),
                          Container(
                            height: 25,
                            width: 75,
                            child: Center(
                              child: Text(
                                widget.gh.numList[widget.index].toString(),
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
                              changeNum(widget.gh.numList[widget.index] + 1);
                              widget.onValueChange?.call();
                            },
                          )
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        );
  }
}