import 'components/body.dart';
import 'package:flutter/material.dart';


import '../../size_config.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});
  static String routeName = "/loginsuccess";

  @override
  Widget build(BuildContext context) {
      SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar (
        title: Text("Login Success"),
      ),
      body:  Body(),
    );
  }
}