import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/order_model.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences.dart';
import 'winch_home_repo.dart';

class WinchHomeRepoImpl implements WinchHomeRepo {
  final APIService apiService;

  WinchHomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<OrderModel>>> getAllRepairOrders() async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };

      var result = await apiService.get(
        headers: headers,
        path: "WinchDriver/GetMyOrderToAccept",
      );

      List<OrderModel> orders = [];
      for (var item in result["model"]) {
        orders.add(OrderModel.fromMap(item));
      }

      return Right(orders);
    } catch (e) {
      if (e is DioException) {
        print(e.response);
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> handleOrderAction(
      String orderId, String action) async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };
      Map<String, dynamic> body = {
        'OrderId': orderId,
        'Action': action,
      };

      print(body);
      await apiService.postFormData(
        headers: headers,
        path: "WinchDriver/HandleOrderAction",
        data: FormData.fromMap(body),
      );

      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        print('eeeeeeeeeeeeeeeeeeeee');
        print(e);
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

}