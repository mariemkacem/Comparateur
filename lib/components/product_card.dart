import 'package:comparateur_prix/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../models/Produit.dart';
import '../screens/details/details_screen.dart';
import '../services/produit_service.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard( {
    Key? key,  this.width =100,  this.aspectRetion = 1.02, required this.produit ,required this.id,
  }) : super(key: key);

final double width, aspectRetion;
final Produit produit ;
final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.pushNamed(
        context, DetailsScreen.routeName , arguments: ProductDetailsArguments(product: produit)
        );
      
      },
      
      child: Padding(
        padding:  EdgeInsets.only(left: getProportionateScreenWidth(20)),
        
        child: Container(
           decoration: BoxDecoration(
            color: Colors.white, // Couleur de fond de votre "product card"
            borderRadius: BorderRadius.circular(8), // Rayon de bordure pour arrondir les angles
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                spreadRadius: 2, // Rayon de dispersion de l'ombre
                blurRadius: 5, // Flou de l'ombre
                offset: Offset(0, 3), // Décalage de l'ombre (horizontal, vertical)
              ),
            ],
          ),
          width: getProportionateScreenWidth(width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              SizedBox(
                width: getProportionateScreenWidth(150),
                child: AspectRatio(
                  aspectRatio: aspectRetion,
                  child: Container(
                   // padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      
                    ),
                   child: Image.network(produit.image)
                  ),
                ),),
            const SizedBox(height: 10),
            
          Text(
              produit.titre,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            /* Text(
              Produit.idMag,
              style: TextStyle(color: kSecondaryColor),
              maxLines: 2,
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  produit.prix,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
               FutureBuilder<bool>(
                future: isProductFavorite(id),
                builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            } else {
              final isFavorite = snapshot.data!;
              return InkWell(
                  
                    onTap: () { },
                    borderRadius: BorderRadius.circular(30),
                          child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),/*
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      width: getProportionateScreenWidth(28),
                      height: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: isFavorite? kSecondaryColor.withOpacity(0.15) 
                        : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                      color: isFavorite? Color(0xFFFF4848)
                      : Color(0xFFDBDEE4), 
                      
                      ),
                    ),*/
                  );
            }
          },)
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}

