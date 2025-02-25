import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repos/complete_data_rep/complete_data_repo_impl.dart';

part 'complete_merchant_data_state.dart';

class CompleteMerchantDataCubit extends Cubit<CompleteMerchantDataState> {
  CompleteMerchantDataCubit(this.completeDataRepo)
      : super(CompleteMerchantDataInitial());

  final CompleteDataRepoImpl completeDataRepo;

  Future<void> completeMerchantData({required File idImage}) async {
    emit(CompleteMerchantDataLoading());
    var result = await completeDataRepo.completeMerchantData(idImage: idImage);
    result.fold(
      (failure) => emit(CompleteMerchantDataFailure(failure.errorMessage)),
      (_) => emit(CompleteMerchantDataSuccess()),
    );
  }
}