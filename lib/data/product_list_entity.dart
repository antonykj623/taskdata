import 'package:tasknew/generated/json/base/json_field.dart';
import 'package:tasknew/generated/json/product_list_entity.g.dart';
import 'dart:convert';
export 'package:tasknew/generated/json/product_list_entity.g.dart';

@JsonSerializable()
class ProductListEntity {
	late double id;
	late String title;
	late double price;
	late String description;
	late String category;
	late String image;
	late ProductListRating rating;

	bool isfavourite=false;

	ProductListEntity();

	factory ProductListEntity.fromJson(Map<String, dynamic> json) => $ProductListEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProductListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProductListRating {
	late double rate;
	late double count;

	ProductListRating();

	factory ProductListRating.fromJson(Map<String, dynamic> json) => $ProductListRatingFromJson(json);

	Map<String, dynamic> toJson() => $ProductListRatingToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}