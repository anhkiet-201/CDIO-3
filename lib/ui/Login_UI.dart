import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interior_app/data/LoginData.dart';
import 'package:interior_app/ui/Home_UI.dart';
import 'package:interior_app/ui/Signup_UI.dart';

import '../Utils/Utils.dart';
import '../component/EmailField.dart';
import '../component/PasswordField.dart';
import '../component/Style.dart';
class Login_UI extends StatelessWidget {
  Login_UI({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                constraints: BoxConstraints(
                    maxWidth: 800
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Spacer(),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Xin chào,',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Đăng nhập để tiếp tục,',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.black.withOpacity(0.6)
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    EmailField(
                      controller: _emailController,
                    ),
                    SizedBox(height: 30,),
                    PasswordField(
                      controller: _passController,
                    ),
                    SizedBox(height: 50,),
                    SizedBox(
                      height: 50,
                      child:ElevatedButton(
                        style: CustomButtonStyle(),
                        onPressed: (){
                          if(login_d(_emailController.text.trim(), _passController.text.trim())){
                            Navigator.of(context).pop();
                          }else{
                            showSnackBar(context, contentType: ContentType.failure, title: 'Login failure!', message: 'Tài khoản hoặc mật khẩu sai');
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Flexible(
                              child: Text(
                                'Đăng nhập',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Icon(Icons.arrow_forward_rounded,size: 35,)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Không có tài khoản? ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              )
                          ),
                          TextSpan(
                            text: 'Đăng ký ngay.',
                            style: TextStyle(
                              color: Colors.blue
                            ),
                            recognizer: TapGestureRecognizer()..onTap = (){
                              startActivity(context,  Signup_UI());
                            }
                          )
                        ]
                      ),
                    ),
                    const SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
