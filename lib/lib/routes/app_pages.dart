import 'package:comparateur_prix/lib/routes/app_bindings.dart';
import 'package:comparateur_prix/screens/home/home_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: CategoriesScreenBinding(),
    ),
   
   
  ];
}