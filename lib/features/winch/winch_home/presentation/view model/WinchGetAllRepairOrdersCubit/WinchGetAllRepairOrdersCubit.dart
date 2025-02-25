import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/order_model.dart';
import '../../../data/repos/winch_home_repo.dart';
import '../../../data/repos/winch_home_repo_impl.dart';


abstract class WinchGetAllRepairOrdersState {}

class WinchGetAllRepairOrdersInitial extends WinchGetAllRepairOrdersState {}

class WinchGetAllRepairOrdersLoading extends WinchGetAllRepairOrdersState {}

class WinchGetAllRepairOrdersLoaded extends WinchGetAllRepairOrdersState {
  final List<OrderModel> orders;

  WinchGetAllRepairOrdersLoaded(this.orders);
}

class WinchGetAllRepairOrdersError extends WinchGetAllRepairOrdersState {
  final String message;

  WinchGetAllRepairOrdersError(this.message);
}

class WinchGetAllRepairOrdersCubit extends Cubit<WinchGetAllRepairOrdersState> {
  final WinchHomeRepoImpl serviceProvidersHomeRepo;

  WinchGetAllRepairOrdersCubit(this.serviceProvidersHomeRepo) : super(WinchGetAllRepairOrdersInitial());

  Future<void> getAllRepairOrders() async {
    emit(WinchGetAllRepairOrdersLoading());
    Either<Failure, List<OrderModel>> result = await serviceProvidersHomeRepo.getAllRepairOrders();
    result.fold(
          (failure) => emit(WinchGetAllRepairOrdersError(failure.errorMessage)),
          (orders) => emit(WinchGetAllRepairOrdersLoaded(orders)),
    );
  }
}