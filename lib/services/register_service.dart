import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> registerUser(String username, String email, String password,String nom, String prenom, String phone, String role) async {
  print("success");
 
   final url = Uri.parse('http://localhost:21207/api/Register');
  
  final headers = <String, String>{
    'Content-Type': 'application/json',
  };
  
  final body = <String, String>{
      "username": username,
        "nom": nom,
        "prenom": prenom,
        "phone": phone,
        "email": email,
        "password": password,
        "role": role
  };

  final response = await http.post(url, headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    // Succès de l'enregistrement
    print('Enregistrement réussi');
  } else {
    // Échec de l'enregistrement
    print('Échec de lenregistrement. Code d\'erreur: ${response.statusCode}');
  }



}
