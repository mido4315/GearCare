import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repos/complete_data_rep/complete_data_repo_impl.dart';

part 'complete_winch_data_state.dart';

class CompleteWinchDataCubit extends Cubit<CompleteWinchDataState> {
  CompleteWinchDataCubit(this.completeDataRepo) : super(CompleteWinchDataInitial());

  final CompleteDataRepoImpl completeDataRepo;

  Future<void> completeWinchData({
    required String model,
    required List<String> specialization,
    required File licenceImage,
    required File winchImage,
  }) async {
    emit(CompleteWinchDataLoading());
    var result = await completeDataRepo.completeWinchData(
      model: model,
      specialization: specialization,
      licenceImage: licenceImage,
      winchImage: winchImage,
    );
    result.fold(
          (failure) => emit(CompleteWinchDataFailure(failure.errorMessage)),
          (_) => emit(CompleteWinchDataSuccess()),
    );
  }
}