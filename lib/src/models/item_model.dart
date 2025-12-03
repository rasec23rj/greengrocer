import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItemModel {
  final String description;
  final String imgUrl;
  final String itemName;
  final double price;
  final String unit;

  ItemModel({
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });

  ItemModel copyWith({
    String? description,
    String? imgUrl,
    String? itemName,
    double? price,
    String? unit,
  }) {
    return ItemModel(
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      itemName: itemName ?? this.itemName,
      price: price ?? this.price,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'imgUrl': imgUrl,
      'itemName': itemName,
      'price': price,
      'unit': unit,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      description: map['description'] as String,
      imgUrl: map['imgUrl'] as String,
      itemName: map['itemName'] as String,
      price: map['price'] as double,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
