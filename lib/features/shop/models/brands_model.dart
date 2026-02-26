import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String id;
  String image;
  final String name;
  final int productCount;
  final bool isFeatured;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    required this.productCount,
    required this.isFeatured,
  });

  /// Empty model
  static BrandModel empty() => BrandModel(
    id: '',
    image: '',
    name: '',
    productCount: 0,
    isFeatured: false,
  );

  /// Convert model to JSON (Firestore)
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'productCount': productCount,
      'isFeatured': isFeatured,
    };
  }

  /// Create model from JSON / Map
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    return BrandModel(
      id: document['id'] ?? '',
      image: document['image'] ?? '',
      name: document['name'] ?? '',
      productCount: document['productCount'] ?? 0,
      isFeatured: document['isFeatured'] ?? false,
    );
  }

  /// Create model from Firestore DocumentSnapshot
  factory BrandModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();

    if (data == null) return BrandModel.empty();

    return BrandModel(
      id: snapshot.id,
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      productCount: data['productCount'] ?? 0,
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}