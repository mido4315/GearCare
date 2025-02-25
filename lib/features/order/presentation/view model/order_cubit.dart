import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/order_model.dart';
import '../../data/order_repo_impl.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepoImpl orderRepo;

  OrderCubit(this.orderRepo) : super(OrderInitial());

  Future<void> postOrder(OrderModel order, String userType) async {
    emit(OrderLoading());
    Either<Failure, OrderModel> result = await orderRepo.postOrder(order,userType);
    result.fold(
          (failure) {
        emit(OrderFailure(failure.errorMessage));
      },
          (order) {
        emit(OrderSuccess(order));
      },
    );
  }
}