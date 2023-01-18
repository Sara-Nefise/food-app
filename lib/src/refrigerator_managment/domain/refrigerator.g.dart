// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refrigerator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Refrigerator _$$_RefrigeratorFromJson(Map<String, dynamic> json) =>
    _$_Refrigerator(
      category: json['category'] as String,
      expirationD: json['expirationD'] as String,
      marketName: json['marketName'] as String,
      name: json['name'] as String,
      purchaseD: json['purchaseD'] as String,
      quantity: json['quantity'] as int,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$$_RefrigeratorToJson(_$_Refrigerator instance) =>
    <String, dynamic>{
      'category': instance.category,
      'expirationD': instance.expirationD,
      'marketName': instance.marketName,
      'name': instance.name,
      'purchaseD': instance.purchaseD,
      'quantity': instance.quantity,
      'unit': instance.unit,
    };
