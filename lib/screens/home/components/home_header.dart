import 'dart:io';

import 'package:comparateur_prix/constants.dart';
import 'package:comparateur_prix/screens/profile/profile_screen.dart';
import 'package:comparateur_prix/screens/sign_in/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../size_config.dart';
import 'icon_btn_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),

          GestureDetector(
             onTap  :(){  
             },
            child: 
              Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenWidth(46),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.camera_alt_outlined , color: kPrimaryColor,),
                    ),
            ),
            GestureDetector(
             onTap  :(){  
             },
            child: 
              Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenWidth(46),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.qr_code , color: kPrimaryColor),
                    ),
            ),
          

          /*GestureDetector(
              onTap: () {
                 Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              child: Container(
                
                 padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                height: getProportionateScreenWidth(46),
                width: getProportionateScreenWidth(46),
                decoration: BoxDecoration(
                 color: kSecondaryColor.withOpacity(0.1),
                 shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/icons/User.svg"),
              ),),
          
             GestureDetector(
              onTap: () {
                 Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              child: Container(
                
                 padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                height: getProportionateScreenWidth(46),
                width: getProportionateScreenWidth(46),
                decoration: BoxDecoration(
                 color: kSecondaryColor.withOpacity(0.1),
                 shape: BoxShape.circle,
                ),
                child: SvgPicture.asset("assets/icons/Heart Icon.svg"),
              ),),*/
         
         
        ],
      ),
    );
  }
}

showContainer(BuildContext context) {
  return Container(
    width: double.infinity,
      height: 350,
      color: Colors.white,
      child: Column(
        children: [
          Center(
            child: ListTile(
              horizontalTitleGap: 70,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),


              title: Text(
                "Search" ),
  ),
          ),
              ElevatedButton(
                onPressed: () {
                  _pickImage();
                },
                child: Text('Search by picture'),
              )
  ],
  ),);
}
Future<void> _pickImage() async {
  final imagePicker = ImagePicker();
  File? _image;
  final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery); // Utilisez ImageSource.camera pour utiliser la caméra

  if (pickedImage != null) {
    
      _image = File(pickedImage.path);
    
  }}


