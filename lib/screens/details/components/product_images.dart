import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Produit.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Produit product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product.id.toString(),
              child: Image.network(widget.product.image),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
       /* Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.image.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )*/
      ],
    );
  }

  
  }

