// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:greengrocer/src/models/item_cart_model.dart';

class OrdersModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<ItemCartModel> items;
  String status;
  String copyAndPaste;
  double total;
  OrdersModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });

  OrdersModel copyWith({
    String? id,
    DateTime? createdDateTime,
    DateTime? overdueDateTime,
    List<ItemCartModel>? items,
    String? status,
    String? copyAndPaste,
    double? total,
  }) {
    return OrdersModel(
      id: id ?? this.id,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      overdueDateTime: overdueDateTime ?? this.overdueDateTime,
      items: items ?? this.items,
      status: status ?? this.status,
      copyAndPaste: copyAndPaste ?? this.copyAndPaste,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdDateTime': createdDateTime.millisecondsSinceEpoch,
      'overdueDateTime': overdueDateTime.millisecondsSinceEpoch,
      'items': items.map((x) => x.toMap()).toList(),
      'status': status,
      'copyAndPaste': copyAndPaste,
      'total': total,
    };
  }

  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      id: map['id'] as String,
      createdDateTime: DateTime.fromMillisecondsSinceEpoch(
        map['createdDateTime'] as int,
      ),
      overdueDateTime: DateTime.fromMillisecondsSinceEpoch(
        map['overdueDateTime'] as int,
      ),
      items: List<ItemCartModel>.from(
        (map['items'] as List<int>).map<ItemCartModel>(
          (x) => ItemCartModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'] as String,
      copyAndPaste: map['copyAndPaste'] as String,
      total: map['total'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromJson(String source) =>
      OrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdersModel(id: $id, createdDateTime: $createdDateTime, overdueDateTime: $overdueDateTime, items: $items, status: $status, copyAndPaste: $copyAndPaste, total: $total)';
  }

  @override
  bool operator ==(covariant OrdersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdDateTime == createdDateTime &&
        other.overdueDateTime == overdueDateTime &&
        listEquals(other.items, items) &&
        other.status == status &&
        other.copyAndPaste == copyAndPaste &&
        other.total == total;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdDateTime.hashCode ^
        overdueDateTime.hashCode ^
        items.hashCode ^
        status.hashCode ^
        copyAndPaste.hashCode ^
        total.hashCode;
  }
}
