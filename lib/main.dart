import 'package:comparateur_prix/screens/sign_in/sign_screen.dart';
import 'package:comparateur_prix/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'lib/theme.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      //home: CategoriesWidget(),
     initialRoute:  SignInScreen.routeName,
    routes: routes,
    );
  }

}

