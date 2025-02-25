import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gear_care/features/shop_page/data/shop_repo.dart';

import '../../../core/errors/failure.dart';
import '../../../core/models/product_model.dart';
import '../../../core/utils/api_service.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/utils/shared_preferences.dart';

class ShopRepoImpl extends ShopRepo {
  final APIService apiService;

  ShopRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts({String? searchString}) async {
    List<ProductModel> products = [];

    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };

    try {
      var result = await apiService.get(
        headers: headers,
        path: 'ApplicationUser/GetAllProducts',
        queryParams: {
          "search": searchString ?? ""
        }
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

  @override
  Future<Either<Failure, void>> addProductToCart(String id,
      int quantity) async {
    List<ProductModel> products = [];

    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> queryParams = {
      'productId ': id,
      'quantity': quantity,
    };
    try {
      var result = await apiService.post(
          path: "ApplicationUser/AddProductToShoppingCart",
          queryParams: queryParams
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
  Future<Either<Failure, void>> removeProductFromCart(String id,
      int quantity) async {
    List<ProductModel> products = [];

    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
    Map<String, dynamic> queryParams = {
      'productId ': id,
      'quantity': quantity,
    };
    try {
      var result = await apiService.delete(
          path: "ApplicationUser/AddProductToShoppingCart",
          queryParams: queryParams
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