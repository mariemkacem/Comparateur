import 'package:comparateur_prix/screens/forgot_password/components/body.dart';
import 'package:flutter/material.dart';


import '../../size_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen(routeName, {super.key});
     static String routeName = "/forgot";

  @override
  Widget build(BuildContext context) {
      SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Body() ,
    );
  }
}