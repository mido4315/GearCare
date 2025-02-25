part of 'shop_cubit.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopSuccess extends ShopState {
  final List<ProductModel> products;

  ShopSuccess(this.products);
}

class ShopFailure extends ShopState {
  final String errorMessage;

  ShopFailure(this.errorMessage);
}

class AddProductToCartLoading extends ShopState {}

class AddProductToCartFailure extends ShopState {
  final String errorMessage;

  AddProductToCartFailure(this.errorMessage);
}

class AddProductToCartSuccess extends ShopState {}