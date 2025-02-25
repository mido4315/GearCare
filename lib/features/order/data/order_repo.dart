import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/models/order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderModel>> postOrder(OrderModel order, String userType);
}