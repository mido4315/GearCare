import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../data/repos/complete_data_rep/complete_data_repo_impl.dart';

part 'complete_service_provider_data_state.dart';

class CompleteServiceProviderDataCubit extends Cubit<CompleteServiceProviderDataState> {
  CompleteServiceProviderDataCubit(this.completeDataRepo) : super(CompleteServiceProviderDataInitial());

  final CompleteDataRepoImpl completeDataRepo;

  Future<void> completeServiceProviderData({
    required String carTypeToRepair,
    required List<String> specialization,
    required File idImage,
  }) async {
    emit(CompleteServiceProviderDataLoading());
    var result = await completeDataRepo.completeServiceProviderData(
      carTypeToRepair: carTypeToRepair,
      specialization: specialization,
      idImage: idImage,
    );
    result.fold(
          (failure) => emit(CompleteServiceProviderDataFailure(failure.errorMessage)),
          (_) => emit(CompleteServiceProviderDataSuccess()),
    );
  }
}