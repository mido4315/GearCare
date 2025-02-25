import 'package:dartz/dartz.dart';
import 'package:gear_care/core/models/service_provider_model.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ServiceProviderModel>>> getServiceProvider({
    required String userType,
    required String location,
    required String carType,
  });
}