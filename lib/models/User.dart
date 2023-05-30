class User {
  final int id;
  final String username;
  final String email;
  final String nom;
  final String prenom;
  final String phone;
  final String password;
  final String role;

  User({required this.id,required this.username, required this.nom, required this.prenom, required this.phone,required  this.password,required  this.role,required  this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['IdUser'],
      nom: json['Nom'],
      prenom: json['Prenom'],
      username: json['Username'],
      phone: json['Phone'],
      email: json['Email'],
      password: json['Password'],
      role: json['Role'],
      
    );
  }
}
class LoginResponse {
  final String token;
  final User user;

  LoginResponse({required this.token, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['Token'],
      user: User.fromJson(json['User']),
    );
  }
}
