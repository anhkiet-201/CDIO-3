import 'package:flutter/material.dart';

import '../component/CustomAppbar.dart';

class ViewMore_UI extends StatefulWidget {
  const ViewMore_UI({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ViewMore_UI> createState() => _ViewMore_UIState();
}

class _ViewMore_UIState extends State<ViewMore_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppbar(title:widget.title,leadingAuto: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5, mainAxisExtent:400),
          itemBuilder: (index,_){
            return Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
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
                              '12.000.000 vnđ'
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
