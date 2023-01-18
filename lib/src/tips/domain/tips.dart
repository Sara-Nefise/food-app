import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tips.freezed.dart';
part 'tips.g.dart';

@freezed
class Tips with _$Tips {
  factory Tips({
    required String name,
    required String detail,
    required String category,
  }) = _Tips;

  factory Tips.fromJson(Map<String, dynamic> json) => _$TipsFromJson(json);
}
