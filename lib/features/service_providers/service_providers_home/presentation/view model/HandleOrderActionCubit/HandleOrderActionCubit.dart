import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../data/repos/service_providers_home_repo.dart';
import '../../../data/repos/service_providers_home_repo_impl.dart';

abstract class HandleOrderActionState {}

class HandleOrderActionInitial extends HandleOrderActionState {}

class HandleOrderActionLoading extends HandleOrderActionState {}

class HandleOrderActionSuccess extends HandleOrderActionState {
  final String message;

  HandleOrderActionSuccess(this.message);
}

class HandleOrderActionError extends HandleOrderActionState {
  final String message;

  HandleOrderActionError(this.message);
}

class HandleOrderActionCubit extends Cubit<HandleOrderActionState> {
  final ServiceProvidersHomeRepoImpl serviceProvidersHomeRepo;

  HandleOrderActionCubit(this.serviceProvidersHomeRepo) : super(HandleOrderActionInitial());

  Future<void> handleOrderAction(String orderId, String action) async {
    emit(HandleOrderActionLoading());
    Either<Failure, void> result = await serviceProvidersHomeRepo.handleOrderAction(orderId, action);
    result.fold(
          (failure) => emit(HandleOrderActionError(failure.errorMessage)),
          (_) => emit(HandleOrderActionSuccess('Order action handled successfully')),
    );
  }
}