import 'package:dio/dio.dart';
import 'package:gear_care/features/Authentication/data/repos/complete_data_rep/complete_data_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/Authentication/data/repos/auth_repo/auth_repo_impl.dart';
import 'api_service.dart';
import 'shared_preferences.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SharedPrefs>(
    SharedPrefs(),
    signalsReady: true,
  );
  getIt.registerSingleton<APIService>(
    APIService(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<APIService>(),
    ),
  );
  getIt.registerSingleton<CompleteDataRepoImpl>(
    CompleteDataRepoImpl(
      getIt.get<APIService>(),
    ),
  );
}