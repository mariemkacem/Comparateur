import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../components/user.dart';

Future<void> registerUser(User user) async {
  final url = Uri.parse('https://localhost:7035/api/Auth/register');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode(user.toJson());
  try {
    final response = await http.post(url, headers: headers, body: body);
    final responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      // Inscription réussie, gérer la réponse du serveur ici
      // Récupérer les données de la réponse du serveur
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      final expiresIn = responseData['expiresIn'];

      // Stocker le jeton d'authentification dans le stockage local (par exemple Shared Preferences)
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setInt('expiresIn', expiresIn);

    } else {
      // Afficher un message d'erreur si l'inscription a échoué
      throw HttpException(responseData['message']);
    }
  } catch (error) {
    // Afficher un message d'erreur si une exception est levée
    throw HttpException('Une erreur s\'est produite. Veuillez réessayer.');
  }
}
