import 'dart:convert';

class Product {
  final int? id;
  final String? name;
  final String? description;
  final int? quantity;
  final int? prix;
  final int? userId;
  final dynamic photoPath;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int? categorieId;
  final int? subcategoryId;
  final String? rating;
  late bool? isfavoriteForUser = false;

  Product({
    this.id,
    this.name,
    this.description,
    this.quantity,
    this.prix,
    this.userId,
    this.photoPath,
    this.createdAt,
    this.updatedAt,
    this.categorieId,
    this.subcategoryId,
    this.rating,
    this.isfavoriteForUser,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(
        json.decode(str),
      );

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        quantity: json["quantity"],
        prix: json["prix"],
        userId: json["user_id"],
        photoPath: json["photo_path"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        categorieId: json["categorie_id"],
        subcategoryId: json["subcategory_id"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "quantity": quantity,
        "prix": prix,
        "user_id": userId,
        "photo_path": photoPath,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "categorie_id": categorieId,
        "subcategory_id": subcategoryId,
        "rating": rating,
      };
}
