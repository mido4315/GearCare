import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/order_model.dart';


abstract class CurrentOrderRepo {
  Future<Either<Failure, List<OrderModel>>> getCurrentOrder(String filter);
}