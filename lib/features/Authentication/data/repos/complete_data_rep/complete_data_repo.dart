import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';

abstract class CompleteDataRepo {


  Future<Either<Failure, void>> completeWinchData({
    required String model,
    required List<String> specialization,
    required File licenceImage,
    required File winchImage,
  });

  Future<Either<Failure, void>> completeServiceProviderData({
    required String carTypeToRepair,
    required List<String> specialization,
    required File idImage,
  });

  Future<Either<Failure, void>> completeMerchantData({
    required File idImage,
  });

  // Future<Either<Failure, UserModel>> completeClientData({
  //   required String carModel,
  // });
}