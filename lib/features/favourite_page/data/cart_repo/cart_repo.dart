import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/product_model.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addProductToCart(String id, int quantity);

  Future<Either<Failure, void>> removeProductFromCart(String id, int quantity);

  Future<Either<Failure, List<ProductModel>>> getProductsInCart();
}