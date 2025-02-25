import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_model.dart';

abstract class PostsRepo {
  Future<Either<Failure, ProductModel>> addProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String category,
    required List<File> images,
  });

  Future<Either<Failure, List<ProductModel>>> getProducts();

  Future<void> deleteProduct(String productId);
}