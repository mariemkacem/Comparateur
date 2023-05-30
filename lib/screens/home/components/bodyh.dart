import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'Catgeorie_list.dart';
import 'ProductList.dart';
import 'home_header.dart';

class Bodyh extends StatefulWidget {
  // ...

  @override
  _BodyhState createState() => _BodyhState();
}

class _BodyhState extends State<Bodyh> {
  int selectedCategoryId = -1;

  void updateSelectedCategoryId(int categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
  }

 
  @override
  Widget build(BuildContext context) {
    var id = selectedCategoryId ;

    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(5)),
        HomeHeader(),
        SizedBox(height: getProportionateScreenWidth(10)),
        CategoryList(
          onCategorySelected: updateSelectedCategoryId,
        ),
        SizedBox(height: getProportionateScreenWidth(5)),
        ProductListWidget(
          categoryId: id,
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        // ...
      ],
    );
  }
}
