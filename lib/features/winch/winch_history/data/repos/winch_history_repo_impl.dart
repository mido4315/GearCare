import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/order_model.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences.dart';
import 'winch_history_repo.dart';

class WinchHistoryRepoImpl implements WinchHistoryRepo {
  final APIService apiService;

  WinchHistoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<OrderModel>>> myOrdersHistory(
      String filter) async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };

      var result = await apiService.get(
        headers: headers,
        path: "WinchDriver/GetOrdersHistory",
        queryParams: {'orderBy': filter},
      );

      List<OrderModel> orders = [];
      for (var item in result["model"]) {
        orders.add(OrderModel.fromMap(item));
      }

      return Right(orders);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}