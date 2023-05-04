import 'package:comparateur_prix/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SignInScreen  extends StatelessWidget {
  const SignInScreen ({super.key});
   static String routeName = "/signin";

  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}