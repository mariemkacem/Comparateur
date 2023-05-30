import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Categorie.dart';
import '../../../services/apiservice.dart';
import '../../../services/produit_service.dart';


// We need statefull widget because we are gonna change some state on our category
class CategoryList extends StatefulWidget {
  final Function(int) onCategorySelected;

  const CategoryList({required this.onCategorySelected}) ;

  @override
  _CategoryListState createState() => _CategoryListState();
  
}

class _CategoryListState extends State<CategoryList> {

  int selectedIndex = -1;
  void onCategorySelected(int categoryId) {
    setState(() {
      selectedIndex = categoryId;
    });

    onCategorySelected(categoryId);
  }
  //List categories = ['All', 'informatique', 'jardin', 'Cuisine'];
   Future<List<Categorie>> categories =  fetchCategories();
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 30,
      child: FutureBuilder<List<Categorie>>(
        future: categories,
         builder: (context,snapshot){
           if (snapshot.hasData){
            final categorieList = snapshot.data! ;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorieList.length,
              itemBuilder: ( context,  index) {
                  final categorie = categorieList[index];
                 return GestureDetector(
                     onTap: () {
            setState(() {
              //selectedIndex = index;
              onCategorySelected(index);
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              right: index == categorieList.length - 1 ? kDefaultPadding : 0,
            ),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? kPrimaryColor.withOpacity(0.5)
                  : kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categorie.nom,
              style: TextStyle(color:kSecondaryColor),
            ),
          ),
        
                  );
                }
                  );
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
      
          // En attente de la récupération des données
        },
           ),
    );
    
       
  }
}
