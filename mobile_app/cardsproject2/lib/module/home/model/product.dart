import 'package:cardsproject2/module/home/model/category.dart';

import 'product_input_field.dart';

class Product{
  final int? id;
  final String? name;
  final String? description;
  final String? howToUse;
  final String? unavailableNotes;
  final String? image;
  final double? price;
  final double? suggestedPrice;
  final int? stock;
  final bool? isVip;
  final List<ProductInputField>? inputFields;
  final Category? type;
  final Category? category;
  final Category? subCategory;

  Product({
    this.id,
    this.name,
    this.description,
    this.howToUse,
    this.unavailableNotes,
    this.image,
    this.price,
    this.suggestedPrice,
    this.stock,
    this.isVip,
    this.inputFields,
    this.type,
    this.category,
    this.subCategory,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<ProductInputField> tmp = [];
    if(json['fields'] != null){
      json['fields'].forEach((field){
        tmp.add(ProductInputField.fromJson(field));
      });
    }
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      howToUse: json['description'],
      unavailableNotes: json['unavailable_notes'],
      image: json['image'],
      price: json['price'],
      suggestedPrice: json['suggested_price'],
      stock: int.tryParse(json['stock']) ?? 0,
      isVip: json['is_vip'] == "1" ? true : false,
      inputFields: tmp,
      type: json['type'] != null ? Category.fromJson(json['type']) : null,
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      subCategory: json['subcategory'] != null ? Category.fromJson(json['subcategory']) : null,
    );
  }
}