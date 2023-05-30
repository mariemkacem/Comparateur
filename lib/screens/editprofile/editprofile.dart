import 'package:comparateur_prix/screens/editprofile/components/body.dart';
import 'package:flutter/material.dart';


import '../../size_config.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  static String routeName = "/edit";

  @override
  Widget build(BuildContext context) {
      SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar (
        title: Text("Edit Profile"),
      ),
      body:  Body(),
    );
  }
}