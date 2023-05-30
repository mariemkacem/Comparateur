class Categorie {
 final int id;  
  final String nom;

Categorie({required this.id,required this.nom});

   factory Categorie.fromJson( Map<String, dynamic> json) {
    return Categorie(
      id: json['idCat'] ?? 0,
      nom: json['nom']);
  }

  
}