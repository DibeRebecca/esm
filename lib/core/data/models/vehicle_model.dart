class Vehicule {
  int? id;
  String? matricule;
  String? couleur;
  String? type;
  int? nbSieges;
  int? marqueId;
  int? modeleId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Marque? marque;
  Modele? modele;

  Vehicule(
      {this.id,
      this.matricule,
      this.couleur,
      this.type,
      this.nbSieges,
      this.marqueId,
      this.modeleId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.marque,
      this.modele});

  Vehicule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricule = json['matricule'];
    couleur = json['couleur'];
    type = json['type'];
    nbSieges = json['nb_sieges'];
    marqueId = json['marque_id'];
    modeleId = json['modele_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    marque = json['marque'] != null ? Marque.fromJson(json['marque']) : null;
    modele = json['modele'] != null ? Modele.fromJson(json['modele']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['matricule'] = matricule;
    data['couleur'] = couleur;
    data['type'] = type;
    data['nb_sieges'] = nbSieges;
    data['marque_id'] = marqueId;
    data['modele_id'] = modeleId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (marque != null) {
      data['marque'] = marque!.toJson();
    }
    if (modele != null) {
      data['modele'] = modele!.toJson();
    }
    return data;
  }
}

class Marque {
  int? id;
  String? code;
  String? nom;

  Marque({
    this.id,
    this.code,
    this.nom,
  });

  Marque.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nom = json['nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['nom'] = nom;

    return data;
  }
}

class Modele {
  int? id;
  String? code;
  String? nom;
  int? marqueId;

  Modele({
    this.id,
    this.code,
    this.nom,
    this.marqueId,
  });

  Modele.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nom = json['nom'];
    marqueId = json['marque_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['nom'] = nom;
    data['marque_id'] = marqueId;

    return data;
  }
}
