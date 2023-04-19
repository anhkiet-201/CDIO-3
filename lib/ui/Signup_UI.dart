import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:interior_app/Utils/Utils.dart';
import 'package:interior_app/component/CustomTextField.dart';
import 'package:interior_app/data/LoginData.dart';
import 'package:interior_app/models/User.dart';

import '../component/EmailField.dart';
import '../component/PasswordField.dart';
import '../component/Style.dart';

class Signup_UI extends StatelessWidget {
   Signup_UI({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();
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
                                  'Đăng ký,',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Đăng ký tài khoản mới,',
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
                      hintText: 'Email',
                      controller: _emailController,
                    ),
                    SizedBox(height: 30,),
                    CustomTextField(
                      hintText: 'Username',
                      controller: _usernameController,
                    ),
                    SizedBox(height: 30,),
                    PasswordField(
                      controller: _passController,
                      hintText: 'Mật khẩu',
                    ),
                    SizedBox(height: 30,),
                    PasswordField(
                      controller: _repassController,
                      hintText: 'Nhập lại password',
                    ),
                    const SizedBox(height: 50,),
                    SizedBox(
                      height: 50,
                      child:ElevatedButton(
                        style: CustomButtonStyle(),
                        onPressed: (){
                          if(_passController.text == _repassController.text){
                            if(signUp_d(User(name: _usernameController.text, pass: _passController.text, email: _emailController.text.trim()))){
                              showSnackBar(context, contentType: ContentType.success, title: "Thông báo!", message: "Thành công!");
                              Navigator.of(context).pop();
                            }
                          }
                          else{
                            showSnackBar(context, contentType: ContentType.failure, title: "Thông báo!", message: "mật khẩu đã nhập không trùng!");
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Flexible(
                              child: Text(
                                'Đăng ký',
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
