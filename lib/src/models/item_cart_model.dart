// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:greengrocer/src/models/item_model.dart';

class ItemCartModel {
  int quantidade;
  final ItemModel itemModel;

  ItemCartModel({required this.quantidade, required this.itemModel});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantidade': quantidade,
      'itemModel': itemModel.toMap(),
    };
  }

  factory ItemCartModel.fromMap(Map<String, dynamic> map) {
    return ItemCartModel(
      quantidade: map['quantidade'] as int,
      itemModel: ItemModel.fromMap(map['itemModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCartModel.fromJson(String source) =>
      ItemCartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ItemCartModel copyWith({int? quantidade, ItemModel? itemModel}) {
    return ItemCartModel(
      quantidade: quantidade ?? this.quantidade,
      itemModel: itemModel ?? this.itemModel,
    );
  }

  double totalprice() => itemModel.price * quantidade;
}
