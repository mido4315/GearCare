import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gear_care/core/utils/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/models/service_provider_model.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/service_locator.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRepoImpl(this.apiService);

  final APIService apiService;

  @override
  Future<Either<Failure, List<ServiceProviderModel>>> getServiceProvider({
    required String userType,
    required String location,
    required String carType,
  }) async {
    final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token'
    };
    Map<String, String> queryParams = {
      'userType':userType,
      'location': location,
      'carType':carType,
    };
    List<ServiceProviderModel> serviceProviders = [];
    try {
      print('getServiceProvider');

      // make a post request to the server
      var result = await apiService.get(
        path: 'ApplicationUser/GetServiceProviderAvailable',
        headers: headers,
        queryParams: queryParams,
      );
      for (int i = 0; i < result["model"].length; i++) {
        serviceProviders.add(ServiceProviderModel.fromMap(result["model"][i]));
      }
      
      return right(serviceProviders);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

// @override
// Future<Either<Failure, List<ProductModel>>> getBestProducts() async {
//   List<ProductModel> products = [];
//   try {
//     // make a post request to the server
//     List<dynamic> result = await apiService.getList(
//       path: '/api/deal-of-the-day',
//       headers: _headers,
//     );
//     for (int i = 0; i < result.length; i++) {
//       products.add(ProductModel.fromMap(result[i]));
//     }
//
//     return right(products);
//   } catch (e) {
//     if (e is DioException) {
//       return Left(
//         ServerFailure.fromDioError(e),
//       );
//     }
//     return Left(
//       ServerFailure(e.toString()),
//     );
//   }
// }
}