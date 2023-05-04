import 'package:comparateur_prix/screens/complete_profile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key, required Null Function(dynamic data) callback});
  static String routeName = "/completeprofile";

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}