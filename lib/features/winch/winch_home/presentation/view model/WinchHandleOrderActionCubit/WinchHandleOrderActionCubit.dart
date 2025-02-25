import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../data/repos/winch_home_repo.dart';
import '../../../data/repos/winch_home_repo_impl.dart';

abstract class WinchHandleOrderActionState {}

class WinchHandleOrderActionInitial extends WinchHandleOrderActionState {}

class WinchHandleOrderActionLoading extends WinchHandleOrderActionState {}

class WinchHandleOrderActionSuccess extends WinchHandleOrderActionState {
  final String message;

  WinchHandleOrderActionSuccess(this.message);
}

class WinchHandleOrderActionError extends WinchHandleOrderActionState {
  final String message;

  WinchHandleOrderActionError(this.message);
}

class WinchHandleOrderActionCubit extends Cubit<WinchHandleOrderActionState> {
  final WinchHomeRepoImpl serviceProvidersHomeRepo;

  WinchHandleOrderActionCubit(this.serviceProvidersHomeRepo) : super(WinchHandleOrderActionInitial());

  Future<void> handleOrderAction(String orderId, String action) async {
    emit(WinchHandleOrderActionLoading());
    Either<Failure, void> result = await serviceProvidersHomeRepo.handleOrderAction(orderId, action);
    result.fold(
          (failure) => emit(WinchHandleOrderActionError(failure.errorMessage)),
          (_) => emit(WinchHandleOrderActionSuccess('Order action handled successfully')),
    );
  }
}