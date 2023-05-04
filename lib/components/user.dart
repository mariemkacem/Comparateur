class User {
    late final String? nom;
  late final String? prenom;

   late final String email;
  final String password;
  late final String? tel;

  User( this.email, this.password,this.nom, this.prenom, this.tel );
  

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
      'tel': tel,
      
    };
  }
}
