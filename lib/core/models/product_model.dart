import 'dart:convert';

class ProductModel {
  final String? id;
  final String? name;
  final List<String>? pictureURL;
  final int? price;
  final int? newPrice;
  final String? description;
  final bool? instock;
  final bool? deleted;
  final String? sellerId;
  final String? categoryid;
  final String? seller;
  final int? discount;
  final String? categorys;
  final String? photos;
  final String? productShoppingcart;

  ProductModel({
    this.id,
    this.name,
    this.pictureURL,
    this.price,
    this.newPrice,
    this.description,
    this.instock,
    this.deleted,
    this.sellerId,
    this.categoryid,
    this.seller,
    this.discount,
    this.categorys,
    this.photos,
    this.productShoppingcart,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'] as String?,
      name: data['name'] as String?,
      pictureURL: (data['pictureURL'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: data['price'] as int?,
      newPrice: data['newPrice'] as int?,
      description: data['description'] as String?,
      instock: data['instock'] as bool?,
      deleted: data['deleted'] as bool?,
      sellerId: data['sellerId'] as String?,
      categoryid: data['categoryid'] as String?,
      seller: data['seller']?['name'] as String?,
      discount: data['discount'] as int?,
      categorys: data['categorys'] as String?,
      photos: data['photos'] as String?,
      productShoppingcart: data['product_Shoppingcart'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'pictureURL': pictureURL,
      'price': price,
      'newPrice': newPrice,
      'description': description,
      'instock': instock,
      'deleted': deleted,
      'sellerId': sellerId,
      'categoryid': categoryid,
      'seller': seller,
      'discount': discount,
      'categorys': categorys,
      'photos': photos,
      'product_Shoppingcart': productShoppingcart,
    };
  }

  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}