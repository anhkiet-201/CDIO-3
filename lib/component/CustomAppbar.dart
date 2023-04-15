import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

AppBar CustomAppbar({required String title, Widget? leading, Widget? action,bool leadingAuto =false}){
  return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: leading,
        automaticallyImplyLeading: leadingAuto,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          action ?? const SizedBox(),
          const SizedBox(width: 20,)
        ],
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      );
}