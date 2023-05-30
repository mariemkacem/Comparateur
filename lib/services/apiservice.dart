import 'dart:io';

import 'package:comparateur_prix/models/Categorie.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';
import '../lib/config/api_urls.dart';
import '../models/User.dart';


Future<List<Categorie>> fetchCategories() async {
  final response = await http.get(Uri.parse('http://localhost:21207/api/Categorie'));
  
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
  
    final  categories = jsonData.map((categorie) => Categorie.fromJson(categorie ?? {'id': 0, 'name': ''})).toList();
    return categories;
  } else {
    throw Exception('Failed to fetch categories');
  }
}

Future<List<User>> getUsers() async {
  var url = 'http://localhost:21207/api/User/allusers'; // Remplacez l'URL par celle de votre API "getUsers"

  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    List<User> users = [];

    for (var user in data) {
      users.add(User.fromJson(user));
    }

    return users;
  } else {
    throw Exception('Erreur lors de la récupération des utilisateurs');
  }
}
Future<User> fetchUserById(int userId) async {
  final response = await http.get(Uri.parse('http://localhost:21207/api/User/$userId'));

  if (response.statusCode == 200) {
    // Analyser les données JSON de la réponse
    final userData = jsonDecode(response.body);
    
    // Créer une instance de User à partir des données
    final user = userData;
    return user;
  } else {
    throw Exception('Échec de la requête GET : ${response.statusCode}');
  }
}


