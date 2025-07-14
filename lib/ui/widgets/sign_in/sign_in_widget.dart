import 'package:flutter/material.dart';

import '../../../index.dart';

class SignInWidget extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final VoidCallback signIn;

  const SignInWidget({
    super.key,
    required this.userNameController,
    required this.passwordController,
    required this.signIn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: s6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kUserNameLabel,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: s4),
          ),
          SizedBox(height: s2),
          TextFormField(
            controller: userNameController,
            decoration: InputDecoration(hintText: kUserNameLabel.toLowerCase()),
          ),
          SizedBox(height: s6),
          Text(
            kPasswordLabel,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: s4),
          ),
          SizedBox(height: s2),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(hintText: kPasswordLabel.toLowerCase()),
          ),
          SizedBox(height: s9),
          Center(
            child: SizedBox(
              width: kLoginButtonWidth,
              height: kLoginButtonHeight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(s2),
                  ),
                ),
                onPressed: signIn,
                child: Text(
                  kLoginLabel,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: addSizing(s3, half),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
