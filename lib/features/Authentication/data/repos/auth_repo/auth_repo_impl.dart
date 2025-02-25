import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/user_model.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.apiService);

  APIService apiService;
  UserModel? myUserModel;

  @override
  Future<Either<Failure, UserModel>> userRegister({
    required String name,
    required String phoneNumber,
    required String email,
    required String location,
    required String username,
    required String password,
    required String userType,
    required String latitude,
    required String longitude,
    File? photo,
  }) async {
    try {
      // print(name);
      // print(phoneNumber);
      // print(email);
      // print(username);
      // print(password);
      // print(userType);
      // print(photo?.path);

      // Create form data
      FormData formData = FormData.fromMap({
        'Name': name,
        'PhoneNumber': phoneNumber,
        'Email': email,
        'Location': location,
        'Username': username,
        'Password': password,
        'UserType': userType,
        'photo': photo != null
            ? await MultipartFile.fromFile(photo.path,
                filename: photo.path.split('/').last)
            : null,
        'latitude': latitude,
        'longitude': longitude,
      });

      var result = await apiService.postFormData(
          path: 'Account/Register', data: formData);

      UserModel user = UserModel.fromMap(result);

      print(user.userType);
      print(user.userType);
      print(user.userType);

      getIt.get<SharedPrefs>().setData(key: 'UserModel', value: user);
      getIt.get<SharedPrefs>().setData(key: 'name', value: user.name);
      getIt.get<SharedPrefs>().setData(key: 'email', value: user.email);
      getIt.get<SharedPrefs>().setData(key: 'location', value: user.location);
      getIt.get<SharedPrefs>().setData(key: 'photoId', value: user.photoId);
      getIt.get<SharedPrefs>().setData(key: 'username', value: user.username);
      getIt
          .get<SharedPrefs>()
          .setData(key: 'phoneNumber', value: user.phoneNumber);
      getIt.get<SharedPrefs>().setData(key: 'userType', value: user.userType);
      getIt.get<SharedPrefs>().setData(key: 'token', value: user.token);
      getIt.get<SharedPrefs>().setData(key: 'lat', value: user.latitude);
      getIt.get<SharedPrefs>().setData(key: 'long', value: user.longitude);

      myUserModel = user;
      return Right(user);
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
  Future<Either<Failure, UserModel>> userLogin({
    required String username,
    required String password,
  }) async {
    try {
      UserModel data = UserModel(
        username: username,
        password: password,
      );

      var result =
          await apiService.post(path: 'Account/Login', data: data.toJson());

      UserModel user = UserModel.fromMap(result);

      getIt.get<SharedPrefs>().setData(key: 'UserModel', value: user);
      getIt.get<SharedPrefs>().setData(key: 'name', value: user.name);
      getIt.get<SharedPrefs>().setData(key: 'email', value: user.email);
      getIt.get<SharedPrefs>().setData(key: 'location', value: user.location);
      getIt.get<SharedPrefs>().setData(key: 'photoId', value: user.photoId);
      getIt.get<SharedPrefs>().setData(key: 'username', value: user.username);
      getIt.get<SharedPrefs>().setData(key: 'phoneNumber', value: user.phoneNumber);
      getIt.get<SharedPrefs>().setData(key: 'userType', value: user.userType);
      getIt.get<SharedPrefs>().setData(key: 'token', value: user.token);
      getIt.get<SharedPrefs>().setData(key: 'lat', value: user.latitude);
      getIt.get<SharedPrefs>().setData(key: 'long', value: user.longitude);

      //______________________________________saving user data with shard preferences
      // List<String> userArgs = [
      //   user.name!,
      //   user.email,
      //   user.type!,
      //   user.token!,
      // ];
      // getIt.get<SharedPrefs>().setData(key: 'user', value: userArgs);
      myUserModel = user;
      return Right(user);
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
}