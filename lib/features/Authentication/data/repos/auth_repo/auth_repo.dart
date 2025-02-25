import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> userRegister({
    required String name,
    required String phoneNumber,
    required String email,
    required String location,
    required String username,
    required String password,
    required String userType,
    required File photo,
    required String latitude,
    required String longitude,

  });
  Future<Either<Failure, UserModel>> userLogin({
    required String username,
    required String password,
});
}