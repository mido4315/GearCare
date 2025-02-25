import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/order_model.dart';


abstract class WinchHistoryRepo {
  Future<Either<Failure, List<OrderModel>>> myOrdersHistory(String filter);
}