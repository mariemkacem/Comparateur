import 'package:flutter/material.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../components/enums.dart';
import '../../models/Product.dart';
import '../../models/Produit.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
          SizeConfig().init(context);

    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
        final Product = agrs.product ;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar:AppBar(),
      body: Body(product: agrs.product),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),

    );
  }
}

class ProductDetailsArguments {
  final Produit product;

  ProductDetailsArguments({required this.product});
}
