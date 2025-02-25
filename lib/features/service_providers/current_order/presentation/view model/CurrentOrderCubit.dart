import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/order_model.dart';
import '../../data/repos/current_order_repo_impl.dart';

abstract class CurrentOrderState {}

class CurrentOrderInitial extends CurrentOrderState {}

class CurrentOrderLoading extends CurrentOrderState {}

class CurrentOrderLoaded extends CurrentOrderState {
  final List<OrderModel> orders;

  CurrentOrderLoaded(this.orders);
}

class CurrentOrderError extends CurrentOrderState {
  final String message;

  CurrentOrderError(this.message);
}

class CurrentOrderCubit extends Cubit<CurrentOrderState> {
  final CurrentOrderRepoImpl currentOrderRepo;

  CurrentOrderCubit(this.currentOrderRepo) : super(CurrentOrderInitial());

  Future<void> getCurrentOrder(String filter) async {
    emit(CurrentOrderLoading());
    Either<Failure, List<OrderModel>> result =
        await currentOrderRepo.getCurrentOrder(filter);
    result.fold(
      (failure) => emit(CurrentOrderError(failure.errorMessage)),
      (orders) => emit(CurrentOrderLoaded(orders)),
    );
  }
}