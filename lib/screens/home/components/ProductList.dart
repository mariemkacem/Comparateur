import 'package:comparateur_prix/components/product_card.dart';
import 'package:flutter/material.dart';

import '../../../models/Produit.dart';
import '../../../services/produit_service.dart';
import 'section_title.dart';
import '../../../size_config.dart';

class ProductListWidget extends StatefulWidget {
  final int categoryId;
  ProductListWidget({ required this.categoryId});

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late Future<List<Produit>> produits ;
  
    void initState() {
    super.initState();
    produits = fetchProduits(); // Remplacez fetchProduits() par votre méthode pour obtenir les données initiales
  }
  void updateProduits() {
  setState(() {
    produits = fetchProduits(); // Remplacez fetchProduits() par votre méthode pour obtenir les nouvelles données
  });
}
  Future<List<Produit>> fetchData(int categoryId) async {
  if (categoryId == -1) {
    produits =  fetchProduits();
  } else {
    produits =  fetchProductsByCategory(categoryId);
  }
  return produits ;
}
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SectionTitle(
        title: "Products",
         press: (){},
      ),
       
        SizedBox(width: getProportionateScreenWidth(20)),
         SingleChildScrollView(
          
          child: FutureBuilder<List<Produit>>(
             future: fetchData(widget.categoryId),
             builder: (context,snapshot){
             if (snapshot.hasData){
              final produitList = snapshot.data! ;
              return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
               physics:AlwaysScrollableScrollPhysics(),
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final produit = produitList[index];
                  return ProductCard(
                    produit: produit,
                    id: produit.id,
                  );
                },
              ) ;
             
              }
            else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }else {
                return Center(
                  child: Text('No data available'),
                );
              }
            },
            ),
         ),
       ]
    ),
    );
    
       
  }
}