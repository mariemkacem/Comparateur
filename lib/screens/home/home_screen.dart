import 'package:comparateur_prix/screens/home/components/bodyh.dart';
import 'package:flutter/material.dart';


import '../../components/coustom_bottom_nav_bar.dart';
import '../../components/enums.dart';
import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(),
      body: Bodyh(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),

    );
  }
}