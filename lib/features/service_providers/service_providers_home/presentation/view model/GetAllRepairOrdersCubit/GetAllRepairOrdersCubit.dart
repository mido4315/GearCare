import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/models/order_model.dart';
import '../../../data/repos/service_providers_home_repo.dart';
import '../../../data/repos/service_providers_home_repo_impl.dart';


abstract class GetAllRepairOrdersState {}

class GetAllRepairOrdersInitial extends GetAllRepairOrdersState {}

class GetAllRepairOrdersLoading extends GetAllRepairOrdersState {}

class GetAllRepairOrdersLoaded extends GetAllRepairOrdersState {
  final List<OrderModel> orders;

  GetAllRepairOrdersLoaded(this.orders);
}

class GetAllRepairOrdersError extends GetAllRepairOrdersState {
  final String message;

  GetAllRepairOrdersError(this.message);
}

class GetAllRepairOrdersCubit extends Cubit<GetAllRepairOrdersState> {
  final ServiceProvidersHomeRepoImpl serviceProvidersHomeRepo;

  GetAllRepairOrdersCubit(this.serviceProvidersHomeRepo) : super(GetAllRepairOrdersInitial());

  Future<void> getAllRepairOrders() async {
    emit(GetAllRepairOrdersLoading());
    Either<Failure, List<OrderModel>> result = await serviceProvidersHomeRepo.getAllRepairOrders();
    result.fold(
          (failure) => emit(GetAllRepairOrdersError(failure.errorMessage)),
          (orders) => emit(GetAllRepairOrdersLoaded(orders)),
    );
  }
}