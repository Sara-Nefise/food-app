import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'refigerator.freezed.dart';
part 'refigerator.g.dart';

@freezed
class Refrigerator with _$Refrigerator {
  factory Refrigerator({
    required String id,
    required String category,
    required String expirationD,
    required String marketName,
    required String name,
    required String purchaseD,
    required int quantity,
    required String unit,
  }) = _Refrigerator;

  factory Refrigerator.fromJson(Map<String, dynamic> json) =>
      _$RefrigeratorFromJson(json);
}
