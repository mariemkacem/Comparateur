import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../../components/products.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';

class Body  extends StatelessWidget {
  const Body ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: kDefaultPadding),
     /* child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row (
              children: [
                ...List.generate(demoProducts.length,(index)=>ProductCard(product: demoProducts[index], id : demoProducts[index].id, produit: null,)),
                
              ],
               ),
          ),*/
    );
 
  
  }
}