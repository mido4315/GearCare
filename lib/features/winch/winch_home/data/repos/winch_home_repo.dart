import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/order_model.dart';


abstract class WinchHomeRepo {
  Future<Either<Failure, List<OrderModel>>> getAllRepairOrders();
  Future<Either<Failure, void>> handleOrderAction(String orderId, String action);
}