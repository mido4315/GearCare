import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/order_model.dart';
import '../../../data/repos/winch_history_repo_impl.dart';

abstract class WinchOrdersHistoryState {}

class WinchOrdersHistoryInitial extends WinchOrdersHistoryState {}

class WinchOrdersHistoryLoading extends WinchOrdersHistoryState {}

class WinchOrdersHistoryLoaded extends WinchOrdersHistoryState {
  final List<OrderModel> orders;

  WinchOrdersHistoryLoaded(this.orders);
}

class WinchOrdersHistoryError extends WinchOrdersHistoryState {
  final String message;

  WinchOrdersHistoryError(this.message);
}

class WinchOrdersHistoryCubit extends Cubit<WinchOrdersHistoryState> {
  final WinchHistoryRepoImpl historyRepo;

  WinchOrdersHistoryCubit(this.historyRepo)
      : super(WinchOrdersHistoryInitial());

  Future<void> getMyOrdersHistory(String filter) async {
    emit(WinchOrdersHistoryLoading());
    Either<Failure, List<OrderModel>> result =
        await historyRepo.myOrdersHistory(filter);
    result.fold(
      (failure) => emit(WinchOrdersHistoryError(failure.errorMessage)),
      (orders) => emit(WinchOrdersHistoryLoaded(orders)),
    );
  }
}