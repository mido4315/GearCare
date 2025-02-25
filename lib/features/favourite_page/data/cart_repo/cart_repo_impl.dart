import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gear_care/features/shop_page/data/shop_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/shared_preferences.dart';
import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final APIService apiService;

  CartRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> addProductToCart(
      String id, int quantity) async {
    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
    print(id);
    Map<String, dynamic> queryParams = {
      'productId ': id,
    };
    try {
      var result = await apiService.post(
        headers: headers,
        path: "ApplicationUser/AddProductToShoppingCart/$id",
      );

      print('result result');
      print(result);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeProductFromCart(
      String id, int quantity) async {
    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> queryParams = {
      'productId ': id,
    };
    try {

      print(id);

      var result = await apiService.delete(
        headers: headers,
        path: "ApplicationUser/RemoveProductFromShoppingCart/$id",
      );

      print('result result');
      print(result);
      return const Right(null);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsInCart() async {
    List<ProductModel> products = [];

    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };

    try {
      var result = await apiService.get(
        headers: headers,
        path: 'ApplicationUser/GetAllProductsInShoppingCart',
      );

      for (var item in result["model"]) {
        products.add(ProductModel.fromMap(item));
      }

      return Right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}