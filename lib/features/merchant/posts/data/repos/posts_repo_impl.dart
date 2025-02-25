import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_model.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences.dart';
import '../../../../Authentication/data/repos/auth_repo/auth_repo_impl.dart';
import 'posts_repo.dart';

class PostsRepoImpl implements PostsRepo {
  PostsRepoImpl(this.apiService);

  APIService apiService;

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    List<ProductModel> productsList = [];

    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');
    // const String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzZWxsZXIxQGdtYWlsLmNvbSIsImp0aSI6ImMxMzQzMWU3LTNkZjAtNDYzYy1iODQzLWRmNzkwZjU2MTk4ZSIsImVtYWlsIjoic2VsbGVyMUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImYxOTExODMwLTIzZDctNGI0NC05ODcxLTNlOTAwMmQ3Nzc4NyIsInJvbGVzIjoiU2VsbGVyIiwiZXhwIjoxNzIxMDMxNjM0LCJpc3MiOiJHZWFyQ2FyZUFwaSIsImF1ZCI6IlNlY3VyZUFwaVVzZXIifQ.FSxAvq-3c64mf1O3Atx5x0YUQ5tJA5lZx1TmWOiYBRg";

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
    try {
      // make a post request to the server
      Map<String, dynamic> result = await apiService.get(
        path: 'Seller/GetAllMyProducts',
        headers: headers,
      );
      var products = result["model"];


      for (int i = 0; i < products.length; i++) {
        productsList.add(ProductModel.fromMap(products[i]));
      }
      return Right(productsList);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> addProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };

      List<MultipartFile> photos = [];
      for (var image in images) {
        photos.add(await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last));
      }

      FormData formData = FormData.fromMap({
        'Name': name,
        'Price': price,
        'Description': description,
        "CategoryName": 'string',
        'photos': photos,
      });

      // make a post request to the server
      Map<String, dynamic> result = await apiService.postFormData(
        path: 'Seller/AddProduct',
        headers: headers,
        data: formData,
      );

      return Right(ProductModel.fromMap(result['model']));
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };

      Map<String, String> queryParams = {
        'productId ': productId,
      };

      // make a post request to the server
      await apiService.delete(
        path: 'Seller/DeleteProduct/$productId',
        headers: headers,
      );
    } catch (e) {
      if (e is DioException) {
        Left(
          ServerFailure.fromDioError(e),
        );
      }
      left(ServerFailure(
        e.toString(),
      ));
    }
  }
}