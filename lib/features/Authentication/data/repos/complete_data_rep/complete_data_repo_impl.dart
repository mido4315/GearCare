import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences.dart';
import 'complete_data_repo.dart';

class CompleteDataRepoImpl implements CompleteDataRepo {
  CompleteDataRepoImpl(this.apiService);

  APIService apiService;

  // get the admin token

  // create headers

  @override
  Future<Either<Failure, void>> completeWinchData({
    required String model,
    required List<String> specialization,
    required File licenceImage,
    required File winchImage,
  }) async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };
      // Create form data
      FormData formData = FormData.fromMap({
        'Model': model,
        'Spezilization': specialization,
        'WinchlicencePhoto': await MultipartFile.fromFile(licenceImage.path,
            filename: licenceImage.path.split('/').last),
        'winchPhoto': await MultipartFile.fromFile(winchImage.path,
            filename: winchImage.path.split('/').last),
      });

      print('_headers');
      print(headers);
      var result = await apiService.postFormData(
        headers: headers,
        path: 'WinchDriver/CompleteWinchData',
        data: formData,
      );

      print(result);
      // UserModel user = UserModel.fromMap(result);
      // myUserModel = user;
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, void>> completeMerchantData({
    required File idImage,
  }) async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };
      // Create form data
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(idImage.path,
            filename: idImage.path.split('/').last),
      });
      print('_headers');
      print(headers);
      var result = await apiService.postFormData(
          headers: headers, path: 'Seller/AddIDpicture', data: formData);

      print(result);
      // UserModel user = UserModel.fromMap(result);
      // myUserModel = user;
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, void>> completeServiceProviderData({
    required String carTypeToRepair,
    required List<String> specialization,
    required File idImage,
  }) async {
    try {
      final String? token = getIt.get<SharedPrefs>().getData(key: 'token');

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token'
      };
      // Create form data
      FormData formData = FormData.fromMap({
        'CarTypeToRepaire': carTypeToRepair,
        'Spezilization': specialization,
        'IDphoto': await MultipartFile.fromFile(idImage.path,
            filename: idImage.path.split('/').last),
      });

      var result = await apiService.postFormData(
          headers: headers,
          path: 'ServiceProvider/CompletePersonalData',
          data: formData);

      print(result);
      // UserModel user = UserModel.fromMap(result);
      // myUserModel = user;
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(ServerFailure(
        e.toString(),
      ));
    }
  }
}