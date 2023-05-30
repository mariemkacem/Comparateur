import 'package:comparateur_prix/components/product_card.dart';
import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../screens/home/components/section_title.dart';
import '../size_config.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(
        title: "Products",
         press: (){},
      ),
        SizedBox(width: getProportionateScreenWidth(40),)      ,

        /*  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row (
              children: [
                ...List.generate(demoProducts.length,(index)=>ProductCard(produit: demoProducts[index], id : demoProducts[index].id)),
                SizedBox(width: getProportionateScreenWidth(20),)      ,
                
              ],
               ),
          ),*/
        ],
      ),
    );
  }
}

