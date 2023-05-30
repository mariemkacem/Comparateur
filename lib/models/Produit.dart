class Produit {
   final int id;
  final String titre, description,image,prix,lien;
  final int idCat ,idMag ;
 

  Produit ({ required this.titre,
  required this.description, 
   required this.image,
   required  this.prix,
    required this.idCat, 
   required this.idMag,
   required this.id, 
   required this.lien, 
});
factory Produit.fromJson( Map<String, dynamic> json) {
    return Produit(
      id: json['IdP'] ?? 0,
      titre: json['Titre'],
      description: json['Description'],
      image: json['Image'],
      prix: json['Prix'],
      lien: json['Lien'],
      idCat: json['IdCat'],
      idMag: json['IdMag']);
  }
}