import 'package:comparateur_prix/constants.dart';
import 'package:comparateur_prix/models/Product.dart';
import 'package:comparateur_prix/screens/home/components/section_title.dart';
import 'package:comparateur_prix/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/product_card.dart';
import '../../../components/products.dart';
import 'categories.dart';
import 'home_header.dart';
import 'icon_btn_counter.dart';
import 'search_field.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        
        child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(5)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(10)),
          Categories(),
          SizedBox(height: getProportionateScreenWidth(5)),
          Products(),
          SizedBox(height: getProportionateScreenWidth(10)),
         
          InkWell(
             onTap  :(){},
            child: Positioned(
              bottom: 0.0,
              child: Container(
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
          ),
        ],
      ),
      ),
    );
  }
}

