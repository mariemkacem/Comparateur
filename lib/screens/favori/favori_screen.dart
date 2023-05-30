import 'package:comparateur_prix/screens/favori/components/body.dart';
import 'package:flutter/material.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../components/enums.dart';
import '../../size_config.dart';

class FavoriScreen extends StatelessWidget {
  static String routeName = "/favori";
  @override
  Widget build(BuildContext context) {
       SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favoris"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}