part of 'get_products_cubit.dart';

@immutable
abstract class GetProductsState {}

class GetProductsInitial extends GetProductsState {}

class GetProductsLoading extends GetProductsState {}

class GetProductsLoaded extends GetProductsState {
  final List<ProductModel> products;

  GetProductsLoaded(this.products);
}

class GetProductsFailure extends GetProductsState {
  final String errorMessage;

  GetProductsFailure(this.errorMessage);
}