import 'dart:convert';
import 'package:comparateur_prix/models/Produit.dart';
import 'package:http/http.dart' as http;


  Future<List<Produit>> fetchProduits() async {
    
     final response = await http.get(Uri.parse('http://localhost:21207/api/Produits'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final produits = data.map((produit) {
      final id = produit['id'] ?? 0;
      final titre = produit['titre'] ?? '';
      final description = produit['description'] ?? '';
      final image = produit['image'] ?? '';
      final prix = produit['prix'] ?? '';
      final lien = produit['lien'] ?? '';
      final idCat = produit['idCat'] ?? 0;
      final idMag = produit['idMag'] ?? 0;
      
      return Produit(
        id: id,
        titre: titre,
        description: description,
        image: image,
        prix: prix,
        lien: lien,
        idCat: idCat,
        idMag: idMag,
      );
    }).toList();
    return produits;
  } else {
    throw Exception('Failed to fetch produits');
  }
     
}
/* return data.map((item) => Produit(
        id: item['id'],
        Titre: item['Titre'],
        Description: item['Description'],
        Image: item['Image'],
        Prix: item['Prix'],
        Lien: item['Lien'],
        idCat: item['idCat'],
        idMag: item['idMag']
      )).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }*/
  Future<List<Produit>>  fetchProductsByCategory(int categoryId) async {
  String url = 'http://localhost:21207/api/Produits/searchCategory/$categoryId';

    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Récupérer les données de la réponse
      final List<dynamic> data = json.decode(response.body);

      // Traiter les données comme vous le souhaitez
      // Par exemple, vous pouvez stocker les produits dans une liste
      List<Produit> products = data.map((json) => Produit.fromJson(json)).toList();
    return products ;
      // Utiliser les produits récupérés dans votre interface Flutter
      // Peut-être mettre à jour l'état de votre liste de produits ou afficher les produits à l'écran
    } else {
      throw Exception('Failed to load products');
    }
}
  Future<bool> isProductFavorite(int productId) async {
  final response = await http.get(Uri.parse('http://localhost:21207/api/Produits/isFavorite/$productId',productId));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    print(responseData);

    return responseData as bool;
  } else {
    throw Exception('Failed to load favorite status');
  }
}
