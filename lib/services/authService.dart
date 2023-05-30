import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../components/authdata.dart';

Future<void> authenticate(AuthData authData, context ) async {
  final url = Uri.parse('https://localhost:7035/api/Auth/login');
  try {
    final response = await http.post(
      url,
      body: authData.toJson(),
      headers: {'Content-Type': 'application/json'},
    );
  if (response.statusCode == 200) {
      // Récupérer les données de la réponse du serveur
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      final expiresIn = responseData['expiresIn'];

      // Stocker le jeton d'authentification dans le stockage local (par exemple Shared Preferences)
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setInt('expiresIn', expiresIn);

      // Rediriger l'utilisateur vers une nouvelle page
      //Navigator.of(context).pushReplacementNamed('/home');
      
    }
 else {
      throw Exception('Failed to load data from API');
    }
  } catch (error) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Erreur'),
        content: Text('Une erreur s\'est produite. Veuillez réessayer.'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
