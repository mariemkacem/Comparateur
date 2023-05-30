import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert';

import '../models/User.dart';

Future<String> loginUser(String email, String password) async {
  // URL de l'API de connexion
  final apiUrl = Uri.parse('http://localhost:21207/api/Login/');

  // Corps de la requête (e-mail et mot de passe)
  final requestBody = jsonEncode({
    'email': email,
    'password': password,
  });

  // En-têtes de la requête
  final headers = {'Content-Type': 'application/json'};

  // Effectuer la requête POST
  final response = await http.post(apiUrl, headers: headers, body: requestBody);

  // Vérifier le code de réponse
  if (response.statusCode == 200) {
  
  return response.body;
 
   // var authToken = responseData['token'];
   // return responseData;
   }else {
    // Échec de la connexion
    throw Exception('Échec de la connexion');
  }
}


Future<LoginResponse> loginUser1(String email, String password) async {
  var url = 'http://localhost:21207/api/Login/';

  var response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    var loginResponse = LoginResponse.fromJson(responseData);
    print('Response JSON: ${response.body}');

    return loginResponse;
  } else if (response.statusCode == 404) {
    throw Exception('Utilisateur non trouvé');
  } else {
    throw Exception('Erreur lors de la requête : ${response.statusCode}');
  }
}

