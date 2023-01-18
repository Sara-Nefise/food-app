// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      category: json['category'] as String,
      name: json['name'] as String,
      details: json['details'] as String,
      image: json['image'] ?? '' as String,
      ingredients: json['ingredients'] as String,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'category': instance.category,
      'name': instance.name,
      'details': instance.details,
      'image': instance.image,
      'ingredients': instance.ingredients,
    };
