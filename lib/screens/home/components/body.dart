import 'dart:io';

import 'package:comparateur_prix/constants.dart';
import 'package:comparateur_prix/models/Product.dart';
import 'package:comparateur_prix/screens/home/components/section_title.dart';
import 'package:comparateur_prix/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:comparateur_prix/services/apiservice.dart';
import 'package:image_picker/image_picker.dart';
import 'ProductList.dart';
import '../../../components/product_card.dart';
import '../../../components/products.dart';
import 'Catgeorie_list.dart';
import 'home_header.dart';
import 'icon_btn_counter.dart';
import 'search_field.dart';

class Body extends StatelessWidget {
  
  const Body({super.key});
  
  @override
  Widget build(BuildContext context) {
    var id;
    return Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(5)),
          HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(10)),
          CategoryList(onCategorySelected: (int ) {  },),
          
          SizedBox(height: getProportionateScreenWidth(5)),
          ProductListWidget( categoryId: id,),
          SizedBox(height: getProportionateScreenWidth(10)),

          
          
         
          
        ],
      );
      
    
  }
}

 

