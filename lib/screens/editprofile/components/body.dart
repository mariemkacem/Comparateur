import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


import '../../../models/User.dart';
import 'TextFieldWidget.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late User user ;

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
               /* ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),*/
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'FirstName',
                  text: user.nom,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'LastName',
                  text: user.prenom,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone',
                  text: user.phone,
                  onChanged: (about) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Password',
                  text: user.password,
                  onChanged: (about) {},
                ),
              ],
            ),
          ),
        ),
      );
      
}