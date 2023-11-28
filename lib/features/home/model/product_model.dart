import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String title,
    required int price,
    required String description,
    required List<String> images,
    required DateTime creationAt,
    required DateTime updatedAt,
    required Category category,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required Name name,
    required String image,
    required DateTime creationAt,
    required DateTime updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

enum Name {
  @JsonValue("Audi")
  audi,
  @JsonValue("Clothes")
  clothes,
  @JsonValue("Miscellaneous")
  miscellaneous,
  @JsonValue("Shoes")
  shoes
}

final nameValues = EnumValues({
  "Audi": Name.audi,
  "Clothes": Name.clothes,
  "Miscellaneous": Name.miscellaneous,
  "Shoes": Name.shoes
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
