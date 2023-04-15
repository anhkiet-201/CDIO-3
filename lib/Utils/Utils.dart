
//import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void startActivity(BuildContext context, Widget target, {Function? doAfter}){
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context,animation, secondaryAnimation) => target,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeInOutQuad,));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        );
      },
    )
  ).then((value) => doAfter?.call());
}

void startActivityAndFinishCurrent(BuildContext context, Widget target){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>target),);
}

bool isValidEmail(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}
//
void showSnackBar(BuildContext context,{required ContentType contentType, required String title, required String message} ) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      )));
}

String doubleToVnd(int x){
 return NumberFormat.currency(locale: 'vi').format(x);
}



// void openUri(String url) async {
//   if(await canLaunch(url)){
//     launch(url);
//   }else {
//     throw 'Can\'t launch $url';
//   }
// }