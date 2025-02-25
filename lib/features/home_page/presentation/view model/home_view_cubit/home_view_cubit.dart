import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/models/service_provider_model.dart';
import 'package:gear_care/features/home_page/data/repos/home_repo_impl.dart';

import 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(this.homeRepo) : super(HomeViewInitial());

  final HomeRepoImpl homeRepo;

  String latitude = '';
  String longitude = '';
  String location = '';
  String carType = '';
  List<ServiceProviderModel> serviceProviders = [];

  Future<void> getAvailableServiceProvider({
    required String userType,
    required String location,
    required String carType,
  }) async {
    var result = await homeRepo.getServiceProvider(
      userType: userType,
      location: location,
      carType: carType,
    );
    result.fold(
      (failure) {
        emit(
          HomeViewFailure(failure.errorMessage),
        );
      },
      (users) {
        serviceProviders = users;
        emit(
          HomeViewSuccess(),
        );
      },
    );
  }
}