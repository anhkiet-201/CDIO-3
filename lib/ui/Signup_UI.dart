import 'package:flutter/material.dart';
import 'package:interior_app/component/CustomTextField.dart';

import '../component/EmailField.dart';
import '../component/PasswordField.dart';
import '../component/Style.dart';

class Signup_UI extends StatelessWidget {
  const Signup_UI({Key? key}) : super(key: key);

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
                                  'Signup,',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  'Create a new account,',
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
                      //controller: _emailController,
                    ),
                    SizedBox(height: 30,),
                    CustomTextField(
                      hintText: 'Username',
                    ),
                    SizedBox(height: 30,),
                    PasswordField(
                      //controller: _passController,
                      hintText: 'Enter password',
                    ),
                    SizedBox(height: 30,),
                    PasswordField(
                      //controller: _passController,
                      hintText: 'Retype password',
                    ),
                    SizedBox(height: 50,),
                    SizedBox(
                      height: 50,
                      child:ElevatedButton(
                        style: CustomButtonStyle(),
                        onPressed: (){
                          // bloc.add(Login_request(_emailController.text, _passController.text));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Flexible(
                              child: Text(
                                'Signup',
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
