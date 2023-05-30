import 'package:comparateur_prix/screens/details/components/product_images.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../models/Produit.dart';
import '../../../size_config.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Produit product;


  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {
                   Navigator.pushNamed(context,product.lien);
                },
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Go website",
                          press: () {
                            Navigator.pushNamed(context,product.lien);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
