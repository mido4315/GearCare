import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failure.dart';
import '../../../core/models/order_model.dart';
import '../../../core/utils/api_service.dart';
import '../../../core/utils/service_locator.dart';
import '../../../core/utils/shared_preferences.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  OrderRepoImpl(this.apiService);

  final APIService apiService;

  @override
  Future<Either<Failure, OrderModel>> postOrder(OrderModel order, String userType) async {
    try {
      final String token = getIt.get<SharedPrefs>().token;

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };

      Map<String, dynamic> result;
      print(userType);
      print(userType);
      print(userType);
      if(userType == "WinchDriver"){
         result = await apiService.postFormData(
            path: 'ApplicationUser/CreateWinchOrder',
            headers: headers,
            data: FormData.fromMap(order.toMap())
        );
      }else{
         result = await apiService.postFormData(
            path: 'ApplicationUser/CreateRepareOrder',
            headers: headers,
            data: FormData.fromMap(order.toMap())
        );
      }


      return Right(OrderModel.fromMap(result));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}