import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/order_model.dart';
import '../../../data/repos/history_repo_impl.dart';

abstract class MyOrdersHistoryState {}

class MyOrdersHistoryInitial extends MyOrdersHistoryState {}

class MyOrdersHistoryLoading extends MyOrdersHistoryState {}

class MyOrdersHistoryLoaded extends MyOrdersHistoryState {
  final List<OrderModel> orders;

  MyOrdersHistoryLoaded(this.orders);
}

class MyOrdersHistoryError extends MyOrdersHistoryState {
  final String message;

  MyOrdersHistoryError(this.message);
}

class MyOrdersHistoryCubit extends Cubit<MyOrdersHistoryState> {
  final HistoryRepoImpl historyRepo;

  MyOrdersHistoryCubit(this.historyRepo) : super(MyOrdersHistoryInitial());

  Future<void> getMyOrdersHistory(String filter) async {
    emit(MyOrdersHistoryLoading());
    Either<Failure, List<OrderModel>> result =
        await historyRepo.myOrdersHistory(filter);
    result.fold(
      (failure) => emit(MyOrdersHistoryError(failure.errorMessage)),
      (orders) => emit(MyOrdersHistoryLoaded(orders)),
    );
  }
}