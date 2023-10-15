import 'package:cardsproject2/module/orders/model/card.dart';

import '../../home/model/category.dart';
import '../../home/model/product.dart';

class Order {
  final int? id;
  final double? price;
  final String? deviceName;
  final String? createdAt;
  final Category? type;
  final Category? category;
  final Category? subCategory;
  final String? status;
  final Product? product;
  final List<Card>? prepaidCard;

  Order({
    this.id,
    this.price,
    this.deviceName,
    this.createdAt,
    this.type,
    this.category,
    this.subCategory,
    this.status,
    this.product,
    this.prepaidCard,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List<Card> tmp = [];
    if(json['prepaid_cards'] != null){
      json['prepaid_cards'].forEach((field){
        tmp.add(Card.fromJson(field));
      });
    }
    return Order(
      id: json['id'],
      price: double.parse("${json['price']}"),
      deviceName: json['device_name'],
      createdAt: json['created_at'],
      type: json['type'] != null ? Category.fromJson(json['type']) : null,
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      subCategory: json['subcategory'] != null ? Category.fromJson(json['subcategory']) : null,
      status: json['order_status']['name'],
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      prepaidCard: tmp,
    );
  }
}

